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

import kh.com.a.model.QnADto;
import kh.com.a.model.RentalGoods;
import kh.com.a.service.sellerPageService;

@Controller
public class sellerPageController {

	private static final Logger logger = LoggerFactory.getLogger(sellerPageController.class);
	
	
	 @Autowired
	 sellerPageService sServ;
	 
	 @RequestMapping(value="sellerpage.do" , method= {RequestMethod.GET, RequestMethod.POST})
		//public String sellerRental(Model model, HttpServletRequest req ,int seq ) throws Exception{
		  public String sellerpage(Model model,HttpServletRequest req) throws Exception{
			logger.info("sellerPageController sellerpage.do" + new Date());
		
			
			//String id = ((MemberDto) req.getSession().getAttribute("login")).getId();
	 		String id =	(String) req.getSession().getAttribute("loginID");
	 
	 		//사용자 rental list  >>판매자
	 		/*List<RentalGoods> rental3 = sServ.Rental3(id);
	 		model.addAttribute("rental3", rental3);
	 		logger.info( "rental3=" + rental3);
	 		
	 		*/
	 		//사용자 qna list
	 		List<QnADto> qnaList = sServ.getMyQnaList(id);
	 		model.addAttribute("myqnalist", qnaList);
	 		logger.info( "qnaList=" + qnaList);

			
			return "sellerpage.tiles";
		} 
	 
	@RequestMapping(value="sellerRental.do" , method= {RequestMethod.GET, RequestMethod.POST})
	//public String sellerRental(Model model, HttpServletRequest req ,int seq ) throws Exception{
	  public String sellerRental() throws Exception{
		logger.info("sellerPageController sellerRental.do" + new Date());
	
		return "sellerRental.tiles";
	}


}
