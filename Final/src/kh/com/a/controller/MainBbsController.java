package kh.com.a.controller;

import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
		logger.info("MainBbsController getMainGoodsList " + new Date());

		List<GoodsDto> recentGoodsList = mainbbsservice.getRecentGoods();
		model.addAttribute("mainbbslist", recentGoodsList);

		List<GoodsDto> popularGoodsList = mainbbsservice.getPopularGoods();
		model.addAttribute("mainbbslist2", popularGoodsList);

		List<ReviewDto> reviewList = mainbbsservice.getReviewforMain();
		model.addAttribute("reviewlist", reviewList);
		
		
		for (int i = 0; i < reviewList.size(); i++) {
			reviewList.get(i).setWdate(reviewList.get(i).getWdate().substring(0, 10));
		}
		
		
		
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
			
	//		System.out.println("dto = " + reviewdto.getWdate());
			for (int i = 0; i < reviewdetaillist.size(); i++) {
				reviewdetaillist.get(i).setWdate(reviewdetaillist.get(i).getWdate().substring(0, 10));
			}
			
			goodsdto.setWdate(goodsdto.getWdate().substring(0, 10));
			
			
			
			model.addAttribute("goodsdetail", goodsdto);
			model.addAttribute("interCheck", interdto);
			model.addAttribute("reviewDetail", reviewdto);
			model.addAttribute("reviewDetailList", reviewdetaillist);

		//	if (id != null) {
				model.addAttribute("loginID", id);
				model.addAttribute("loginAuth", (int) req.getSession().getAttribute("loginAuth"));
	//		} 
				return "goodsdetail.tiles";
		} else {
			
			GoodsDto goodsdto = mainbbsservice.getGoodsDetail(seq);
			ReviewDto reviewdto = mainbbsservice.getReviewDetail(seq);
			List<ReviewDto> reviewdetaillist = mainbbsservice.getReviewDetailList(seq);
		//	System.out.println("제품 정보가 나오는지 확인 하기 = " + goodsdto.toString());
			
			for (int i = 0; i < reviewdetaillist.size(); i++) {
				reviewdetaillist.get(i).setWdate(reviewdetaillist.get(i).getWdate().substring(0, 10));
			}
			
			goodsdto.setWdate(goodsdto.getWdate().substring(0, 10));
			
			model.addAttribute("goodsdetail", goodsdto);
			model.addAttribute("reviewDetail", reviewdto);
			model.addAttribute("reviewDetailList", reviewdetaillist);
			
			
			return "goodsdetail.tiles";
		}
		
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
	
	
	@Autowired
	JavaMailSender mailSender;
	
	@RequestMapping(value="sendMail.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String sendMail(HttpServletRequest req) {
		String setfrom = "tstqpwo@gmail.com";
		String toWho=req.getParameter("subscribe");
		String title = "더함의 소식을 받아봐주셔서 감사합니다^^";
		String content = "메일 발송 진짜 되는지 궁금해서 이메일 적으셨죠? 된답니당ㅎ";
		
		
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(setfrom);
			messageHelper.setTo(toWho);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			
			
			mailSender.send(message);
			
		} catch (MessagingException e) {
			e.printStackTrace();
			System.out.println(e);
		}
		
		return "main.tiles";
	}
}
