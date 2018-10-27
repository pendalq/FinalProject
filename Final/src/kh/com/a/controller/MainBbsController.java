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
import kh.com.a.service.MainBbsService;

@Controller
public class MainBbsController {
	private static final Logger logger = LoggerFactory.getLogger(MainBbsController.class);

	@Autowired
	MainBbsService mainbbsservice;

	@RequestMapping(value = "mainbbslist.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String getMainGoodsList(Model model, HttpServletRequest req) throws Exception {
		logger.info("MainBbsController getMainGoodsList");

		List<GoodsDto> recentGoodsList = mainbbsservice.getRecentGoods();
		model.addAttribute("mainbbslist", recentGoodsList);

		List<GoodsDto> popularGoodsList = mainbbsservice.getPopularGoods();
		model.addAttribute("mainbbslist2", popularGoodsList);

		List<ReviewDto> reviewList = mainbbsservice.getReviewforMain();
		model.addAttribute("reviewlist", reviewList);

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
	public String getGoodsDetail(Model model, HttpServletRequest req, int seq) throws Exception {
		logger.info("MainBbsController getGoodsDetail");

		InterDto idto = new InterDto();
		String id = (String) req.getSession().getAttribute("loginID");
		idto.setId(id);
		logger.info("MainBbsController getGoodsDetail" + idto);

		// idto.setId("ID2");

		if (id != null) {

			idto.setGseq(seq);

			InterDto interdto = mainbbsservice.interCheck(idto);
			GoodsDto goodsdto = mainbbsservice.getGoodsDetail(seq);
			ReviewDto reviewdto = mainbbsservice.getReviewDetail(seq);
			List<ReviewDto> reviewdetaillist = mainbbsservice.getReviewDetailList(seq);

			model.addAttribute("goodsdetail", goodsdto);
			model.addAttribute("interCheck", interdto);
			model.addAttribute("reviewDetail", reviewdto);
			model.addAttribute("reviewDetailList", reviewdetaillist);

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
