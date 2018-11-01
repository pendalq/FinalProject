package kh.com.a.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.com.a.model.GoodsDto;
import kh.com.a.model.InterDto;
import kh.com.a.model.MemberDto;
import kh.com.a.model.ReviewDto;
import kh.com.a.model.ReviewParam;
import kh.com.a.service.MainBbsService;
import kh.com.a.service.ReviewService;

@Controller
public class MainBbsController {
	private static final Logger logger = LoggerFactory.getLogger(MainBbsController.class);

	@Autowired
	MainBbsService mainbbsservice;
	@Autowired
	ReviewService reviewService;

	@RequestMapping(value = "mainbbslist.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String getMainGoodsList(Model model, HttpServletRequest req) throws Exception {
		logger.info("MainBbsController getMainGoodsList " + new Date());
		
		System.out.println("getMainGoodsList 1/4");
		List<GoodsDto> recentGoodsList = mainbbsservice.getRecentGoods();
		model.addAttribute("mainbbslist", recentGoodsList);
		System.out.println("getMainGoodsList 2/4");
		List<GoodsDto> popularGoodsList = mainbbsservice.getPopularGoods();
		model.addAttribute("mainbbslist2", popularGoodsList);
		System.out.println("getMainGoodsList 3/4");
		List<ReviewDto> reviewList = mainbbsservice.getReviewforMain();
		model.addAttribute("reviewlist", reviewList);
		System.out.println("getMainGoodsList 4/4");
		/*
		 * String id = (String)req.getSession().getAttribute("loginID");
		 * model.addAttribute("loginID", id);
		 * 
		 * int auth = (int)req.getSession().getAttribute("loginAuth");
		 * model.addAttribute("loginAuth", auth);
		 * 
		 * if(id==null||auth==null) {
		 * 
		 * }
		 */
		return "main.tiles";
	}

	@RequestMapping(value = "goodsdetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String getGoodsDetail(Model model, HttpServletRequest req, int seq, int reviewPageNumber) throws Exception {
		logger.info("MainBbsController getGoodsDetail");

		InterDto idto = new InterDto();
		
		String id = (String) req.getSession().getAttribute("loginID");
		idto.setId(id);
		logger.info("MainBbsController getGoodsDetail" + idto);

		//리뷰를 위한 리뷰 파라메타 dto 생성
		ReviewParam reviewParam = new ReviewParam();
		
		// idto.setId("ID2");

		if (id != null) {
			
			idto.setGseq(seq);	
			
			InterDto interdto = mainbbsservice.interCheck(idto);
			GoodsDto goodsdto = mainbbsservice.getGoodsDetail(seq);
			
			model.addAttribute("goodsdetail", goodsdto);
			model.addAttribute("interCheck", interdto);

			
//---------------------- 리뷰 출력 ------------------------------			
			//상품 시퀀스 넘버 리뷰 파라메타에 저장 
			reviewParam.setGseq(seq);
			//리뷰 페이징
			reviewParam.setPageNumber(reviewPageNumber);
			int sn = reviewParam.getPageNumber();
			int start = (sn) * reviewParam.getRecordCountPerPage() + 1;
			int end = (sn + 1) * reviewParam.getRecordCountPerPage();
			
			reviewParam.setStart(start);
			reviewParam.setEnd(end);
			
			// 리뷰 게시물 카운트
			int totalRecordCount = reviewService.getReviewCount(reviewParam);
			//리뷰 평점 
			double likedAvg = reviewService.getLikedAvg(reviewParam);
			System.out.println("리뷰 평점 평균 : " + likedAvg);
			// 리뷰 게시물을 받아옴.
			List<ReviewDto> reviewList = reviewService.getReviewPagingList(reviewParam);
			System.out.println("controller   reviewList success");

			// 리뷰 페이 처리 2
			model.addAttribute("pageNumber", sn);
			model.addAttribute("pageCountPerScreen", 10);
			model.addAttribute("recordCountPerPage", reviewParam.getRecordCountPerPage());
			System.out.println("recordCountPerPage: " + reviewParam.getRecordCountPerPage());
			
			model.addAttribute("totalRecordCount", totalRecordCount);
			model.addAttribute("likedAvg", likedAvg);
			model.addAttribute("reviewList", reviewList);
//---------------------- 리뷰 출력 끝 ------------------------------		

			
			if (id != null) {
				model.addAttribute("loginID", id);
				model.addAttribute("loginAuth", (int) req.getSession().getAttribute("loginAuth"));
			} else {
				model.addAttribute("loginID", "0");
				model.addAttribute("loginAuth", 0);
			}

		} else {
			return "login.tiles";
		}
		return "goodsdetail.tiles";
	}

	@ResponseBody
	@RequestMapping(value = "putInterest.do", method = { RequestMethod.GET, RequestMethod.POST })
	public boolean putInterest(Model model, InterDto idto) throws Exception {
		logger.info("MainBbsController putInterest");

		System.out.println("idto:" + idto.toString());

		boolean result = mainbbsservice.putInterest(idto);

		return result;
	}

	@ResponseBody
	@RequestMapping(value = "delInterest.do", method = { RequestMethod.GET, RequestMethod.POST })
	public boolean delInterest(Model model, InterDto idto) throws Exception {
		logger.info("MainBbsController delInterest");
		System.out.println(idto.toString());
		boolean result = mainbbsservice.delInterest(idto);

		// System.out.println("boolean = " + result);

		return result;
	}

	@ResponseBody
	@RequestMapping(value = "youAreInterestedIn.do", method = { RequestMethod.GET, RequestMethod.POST })
	public List<InterDto> youAreInterestedIn(HttpServletRequest req, String id) throws Exception {
		logger.info("MainBbsController youAreInterestedIn");

		if (req.getSession().getAttribute("loginID") == null) {
			id = "0";
		} else {
			id = (String) req.getSession().getAttribute("loginID");
		}

		List<InterDto> ilist = mainbbsservice.youAreInterestedIn(id);

		System.out.println(ilist.toString());

		return ilist;
	}
}
