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
import kh.com.a.model.BbsParam;
import kh.com.a.model.GoodsDto;
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
 	public String mypage(BbsParam param,Model model,HttpServletRequest req) throws Exception {
 		logger.info("userMypageController mypage.do" + new Date());

 		//String id = ((MemberDto) req.getSession().getAttribute("login")).getId();
 		String id =	(String) req.getSession().getAttribute("loginID");
 
 		//사용자 rental list
 		List<RentalGoods> rental3 = userMyServ.Rental3(id);

 		model.addAttribute("srental3", rental3);
 		logger.info( "srental3=" + rental3);
 		
 	// paging 처리
 			int sn = param.getPageNumber();
 			int start = (sn) * param.getRecordCountPerPage() + 1;
 			int end = (sn + 1) * param.getRecordCountPerPage();
 			/*
 			 * 0 0 * 10 + 1 -> 1 0+1 * 10 -> 10 1 1 * 10 + 1 -> 11 1+1 * 10 -> 20
 			 * 
 			 * [1][2][3][4][5][6][7][8][9][10]
 			 */

 			param.setStart(start);
 			param.setEnd(end);
 			param.setId(id);

 			// 페이징도 불러오기
 			// 사용자 qna list
 			// List<QnADto> qnaList = sServ.getMyQnaList(id);
 			// 자신이 올린 글의 갯수 확인
 			System.out.println(" 파람값이 들어있는지 확인 합니다."+ param.toString());
 			List<QnADto> myqnalist = userMyServ.getBbsPagingList(param);

 			for (int i = 0; i < myqnalist.size(); i++) {
 				System.out.println(myqnalist.get(i).toString());
 			}
 			// 글의 갯수
 			int totalRecordCount = userMyServ.getBbsCount(param);

 			model.addAttribute("myqnalist", myqnalist);
 			model.addAttribute("pageNumber", sn);
 			model.addAttribute("pageCountPerScreen", 10);
 			model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
 			model.addAttribute("totalRecordCount", totalRecordCount);
 		logger.info( "qnaList=" + myqnalist);

 		
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
		
		rDetail.setSdate(rDetail.getSdate().substring(0, 10));
		rDetail.setRe_turn(rDetail.getRe_turn().substring(0, 10));
		
		model.addAttribute("rDetail", rDetail);
		logger.info( "rDetail=" + rDetail);

		return "userRental.tiles";
		
	}


}
