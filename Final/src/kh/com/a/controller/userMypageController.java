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

import kh.com.a.insertPatemeter.getUrentalList;
import kh.com.a.model.MemberDto;
import kh.com.a.model.QnADto;
import kh.com.a.model.RentalGoods;
import kh.com.a.service.MemberService;
import kh.com.a.service.userMypageService;

@Controller
public class userMypageController {

	private static final Logger logger = LoggerFactory.getLogger(userMypageController.class);
	
	@Autowired
	userMypageService userMyServ;
	
	
 	@RequestMapping(value="mypage.do" , method= {RequestMethod.GET, RequestMethod.POST})
 	public String mypage(Model model,HttpServletRequest req) throws Exception {
 		logger.info("userMypageController mypage.do" + new Date());

 		//String id = ((MemberDto) req.getSession().getAttribute("login")).getId();
 		String id =	(String) req.getSession().getAttribute("loginID");
 
 		//사용자 rental list
 		List<RentalGoods> rental3 = userMyServ.Rental3(id);
 		model.addAttribute("srental3", rental3);
 		logger.info( "srental3=" + rental3);
 		
 		
 		//사용자 qna list
 		List<QnADto> qnaList = userMyServ.getMyQnaList(id);
 		model.addAttribute("myqnalist", qnaList);
 		logger.info( "qnaList=" + qnaList);

 		
 		return "mypage.tiles";
 	}

	
	@RequestMapping(value="userRental.do" ,method={RequestMethod.GET, RequestMethod.POST})
	public String userRental(Model model,HttpServletRequest req ,int seq) throws Exception {
		logger.info("userMypageCtrl userRental.do" + new Date());
		
		//insert parameter
		String id =	(String) req.getSession().getAttribute("loginID");
		getUrentalList dto = new getUrentalList(id,seq);
		logger.info( "getUrentalList는" + dto);
			
		//mypage.jsp > retal detail.jsp
		RentalGoods rDetail = userMyServ.getRentalDto(dto);
		model.addAttribute("rDetail", rDetail);
		logger.info( "rDetail=" + rDetail);

		return "userRental.tiles";
		
	}


}
