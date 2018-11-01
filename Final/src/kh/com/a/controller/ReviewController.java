package kh.com.a.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kh.com.a.model.ReviewDto;
import kh.com.a.model.ReviewParam;
import kh.com.a.service.ReviewService;

@Controller
public class ReviewController {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Autowired
	ReviewService reviewService;

	//게시물 리스트-------------------------------------
	@RequestMapping(value = "reviewList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String reviewList(Model model, ReviewParam param, HttpSession session) throws Exception {

		logger.info("ReviewController reviewList" + new Date());
		
		
	////////////////test 세션 값 임의 저장-----/////////////////////////////////////////////////////////
		session.setAttribute("id", "admin");
		
	//////////////////////////////////////////////////////////////////////////////////////////////////
		
		
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
		double likedAvg = reviewService.getLikedAvg(param);
		System.out.println("리뷰 평점 평균 : " + likedAvg);
		// 게시물을 받아옴.
		List<ReviewDto> reviewList = reviewService.getReviewPagingList(param);
		model.addAttribute("reviewList", reviewList);
		System.out.println("controller   reviewList success");
		
		// paging 처리 2
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 15);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("likedAvg", likedAvg);
		
		System.out.println("recordCountPerPage: " + param.getRecordCountPerPage());

		return "reviewList.tiles";
	}

	//게시물 작성-------------------------------------	
	@RequestMapping(value = "reviewWrite.do", method = { RequestMethod.GET, RequestMethod.POST })
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
	
	@RequestMapping(value = "reviewUpdate.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String reviewUpdate(Model model, ReviewDto reviewDto) throws Exception {
		
		logger.info("reviewUpdate " + new Date());
		System.out.println("수정을 위한 리뷰 번호 : " + reviewDto.getSeq());
		
		System.out.println("수정을 위한 리뷰 게시글 하나 뽑아오기 전");
		ReviewDto updateDto = reviewService.getReviewOne(reviewDto.getSeq());
		
		System.out.println("수정을 위한 리뷰 게시글 하나 뽑아오기 후 :" + updateDto.toString());
		
		model.addAttribute("reviewDto", updateDto);
		
		return "reviewUpdate.tiles";
	}
	
	@RequestMapping(value = "reviewUpdateAf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String reviewUpdateAf(Model model, ReviewDto reviewDto) throws Exception {
		logger.info("reviewUpdateAf " + new Date());
		
		System.out.println("리뷰 게시물 수정하기 전 ");
		reviewService.updateReview(reviewDto);
		System.out.println("리뷰 게시물 수정하기 후 ");
		return "testWeb.tiles";
	}
	
	@RequestMapping(value = "reviewDelete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String reviewDelete(Model model, ReviewDto reviewDto) throws Exception {
		logger.info("reviewDelete " + new Date());
		System.out.println("리뷰 게시물 삭제하기 전 :" + reviewDto.toString());
		reviewService.reviewDelete(reviewDto.getSeq());
		System.out.println("리뷰 게시물 삭제하기 후 ");
		return "testWeb.tiles";
	}
}
