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
import kh.com.a.model.GoodsDto;
import kh.com.a.model.MemberDto;
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
	 		List<GoodsDto> rental3 = sServ.Rental3(id);
	 		model.addAttribute("srental3", rental3);
	 		logger.info( "rental3=" + rental3);
	 		
	 		
	 		
	 		
	 		//사용자 qna list
	 		List<QnADto> qnaList = sServ.getMyQnaList(id);
	 		for (int i = 0; i < qnaList.size(); i++) {
				qnaList.get(i).setWdate(qnaList.get(i).getWdate().substring(0, 10));
			}
	 		model.addAttribute("myqnalist", qnaList);
	 		logger.info( "qnaList=" + qnaList);

			
			return "sellerpage.tiles";
		} 
	 
	 @RequestMapping(value="sellerRental.do" , method= {RequestMethod.GET, RequestMethod.POST})
	 public String sellerRental() {
		 
		 
		 return "goodsdetail.tiles";
	 }
	 
/*	@RequestMapping(value="sellerRental.do" , method= {RequestMethod.GET, RequestMethod.POST})
	public String sellerRental(Model model, HttpServletRequest req ,int seq ) throws Exception{
		logger.info("sellerPageController sellerRental.do" + new Date());
	
		//seller rental ing  detail
		GoodsDto sellerRentalDetail = sServ.GoodsDto(seq);
		model.addAttribute("sellerGoodsDto", sellerRentalDetail);
		
	//	return "sellerRental.tiles";
	}*/
	
	@RequestMapping(value="lentManage.do" ,method= {RequestMethod.GET, RequestMethod.POST})
	//public String lentManage(Model model, HttpServletRequest req ) throws Exception{
	public String lentManage(Model model , HttpServletRequest req) throws Exception{
		logger.info("sellerPageController lentManage.do" + new Date());
		
		String id =	(String) req.getSession().getAttribute("loginID");
		
		//SELECT R.SEQ , R.ID AS SU_ID , M.ADDRESS , M.PHONE , G.TITLE , R.WDATE , R.SDATE , M.NAME
		List<RentalGoods> manageRentalList = sServ.manageRentalList(id);
		model.addAttribute("manageRentalList", manageRentalList);
		
		 
			 		
		return "lentManage.tiles";

	}

}
