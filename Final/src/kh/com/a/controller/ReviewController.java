package kh.com.a.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.com.a.model.ReviewDto;
import kh.com.a.model.ReviewParam;
import kh.com.a.service.MainBbsService;
import kh.com.a.service.ReviewService;

@Controller
public class ReviewController {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Autowired
	ReviewService reviewService;

	
	
	//게시물 리스트-------------------------------------
	@RequestMapping(value = "reviewPagingAjax.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody Object reviewList(Model model, ReviewParam param) throws Exception {

		logger.info("ReviewController reviewList" + new Date());		
		
		System.out.println("상품 시퀀스 넘버 확인 : " + param.getGseq());

		//리뷰 페이징
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn + 1) * param.getRecordCountPerPage();
		System.out.println("controller   sn: " + sn + " start: " + start + " end: " + end + "    paging1 ");

		param.setStart(start);
		param.setEnd(end);
		
		// 게시물 카운트
		int totalRecordCount = reviewService.getReviewCount(param);
		// 게시물을 받아옴.
		List<ReviewParam> reviewPaging = reviewService.getReviewPagingListAjax(param);
		System.out.println("controller   reviewListAjax success");
		for(int i = 0; i < reviewPaging.size(); i++) {
			reviewPaging.get(i).setPageNumber(sn);
			reviewPaging.get(i).setPageCountPerScreen(10);
			reviewPaging.get(i).setRecordCountPerPage(param.getRecordCountPerPage());
			reviewPaging.get(i).setTotalRecordCount(totalRecordCount);
			
			System.out.println("reviewPaging.get("+i+").toString() : " + reviewPaging.get(i).toString());
		}	
		return reviewPaging;
	}

	//게시물 작성-------------------------------------	
	/*@RequestMapping(value = "reviewWrite.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String reviewWrite(Model model,ReviewDto reviewDto  ) {

		logger.info("reviewWrite " + new Date());

		
		System.out.println("gseq :  " + reviewDto.getGseq() + "  id : " + reviewDto.getId() );
		
		String goodsName = reviewService.getGoodsName(reviewDto.getGseq());
		System.out.println("상품 이름 출력 완료 :" + goodsName);
		
		model.addAttribute("reviewDto", reviewDto);
		model.addAttribute("goodsName", goodsName);

		System.out.println("reviewWrite.do 완료");
		return "reviewWrite.tiles";
	}
*/
	//게시물 작성 후 -------------------------------------
	@RequestMapping(value = "reviewWriteAf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String reviewWriteAf(Model model, ReviewDto reviewDto) throws Exception {

		logger.info("reviewWriteAf " + new Date());
		

		System.out.println("reviewDto :  " + reviewDto.toString()+ "\n 2`1`13`131232131231231231231231232");
		
		boolean isS = reviewService.reviewWrite(reviewDto);

		if (isS == true) {
			System.out.println("작성 성공");
		} else {
			System.out.println("작성 실패");
		}
		String msg = "1";
		model.addAttribute("msg", msg);

		return "redirect:/mypage.do";
	}
	
	/*@RequestMapping(value = "reviewUpdate.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String reviewUpdate(Model model, int delSeq) throws Exception {
		
		logger.info("reviewUpdate " + new Date());
		System.out.println("수정을 위한 리뷰 번호 : " + delSeq);
		
		System.out.println("수정을 위한 리뷰 게시글 하나 뽑아오기 전");
		ReviewDto updateDto = reviewService.getReviewOne(delSeq);
		
		System.out.println("수정을 위한 리뷰 게시글 하나 뽑아오기 후 :" + updateDto.toString());
		
		model.addAttribute("reviewDto", updateDto);
		
		return "reviewUpdate.tiles";
	}*/
	
	@RequestMapping(value = "reviewUpdateAjax.do")
	public @ResponseBody Object reviewUpdate(int delSeq) throws Exception {
		System.out.println("ajax : " + delSeq);
		ReviewDto updateDto = reviewService.getReviewOne(delSeq);
		
		System.out.println(updateDto.toString());
	
		
		return updateDto;
	}
	
	@RequestMapping(value = "reviewUpdateAf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String reviewUpdateAf(Model model, HttpServletRequest req, int ggseq, 
			ReviewParam reviewParam, ReviewDto reviewDto) throws Exception {
		logger.info("reviewUpdateAf " + new Date());
		
		System.out.println("리뷰 게시물 수정하기 전 ");
		reviewService.updateReview(reviewDto);
		System.out.println("리뷰 게시물 수정하기 후 ");
		
		String msg = "2";
		model.addAttribute("msg", msg);
		model.addAttribute("seq", ggseq);
		model.addAttribute("reviewParam", reviewParam);
		
		return "redirect:/goodsdetail.do";
	}
	
	@RequestMapping(value = "reviewDelete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String reviewDelete(Model model,HttpServletRequest req, int seq, ReviewParam reviewParam,
			@RequestParam("delSeq") int delSeq) throws Exception {
		
		
		logger.info("reviewDelete " + new Date());
		System.out.println("리뷰 게시물 삭제하기 전 :" + delSeq);
		reviewService.reviewDelete(delSeq);
		System.out.println("리뷰 게시물 삭제하기 후 ");
		
		
		model.addAttribute("seq", seq);
		model.addAttribute("reviewParam", reviewParam);
		
		// 삭제 완료 창을 위한 변수 전송 
		String msg = "1";
		model.addAttribute("msg", msg);
		
		return "redirect:/goodsdetail.do";
	}
}
