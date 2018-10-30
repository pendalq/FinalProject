package kh.com.a.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.com.a.model.GoodsDto;
import kh.com.a.model.MemberDto;
import kh.com.a.model.RentalGoods;
import kh.com.a.service.RentalService;

@Controller
public class RentalController {
	
	private static Logger logger = LoggerFactory.getLogger(RentalController.class);
	
	@Autowired
	RentalService rentalService;
	
	@RequestMapping(value="rental.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String rental(Model model, int seq, HttpServletRequest req) throws Exception {
		
		logger.info("RentalController rental " + new Date());
		
		String id = (String) req.getSession().getAttribute("loginID");
		System.out.println(id);
		System.out.println(seq);
		
		GoodsDto goods = rentalService.getGoodsInfo(seq);
		MemberDto buyer = rentalService.getMemberInfo(id);
		
		
		System.out.println("goods = " + goods.toString());
		System.out.println("memberDto = " + buyer.toString());
		
		model.addAttribute("goods", goods);
		model.addAttribute("buyer", buyer);
			
		return "payment.tiles";
	}
	
	@RequestMapping(value="paysuccess.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String paysuccess(RentalGoods rental) throws Exception {
		
		logger.info("RentalController paysuccess " + new Date());
		
		rentalService.doRental(rental);
		
		return "redirect:/mainbbslist.do";
	}
	
	@RequestMapping(value="RenstalStatusUpdate.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String rentalstatusupdate(int seq, String status, Model model) throws Exception {
		
		logger.info("RentalController rentalstatusupdate " + new Date());
		
		if(status.equals("rental_ing")) {
		
		Date rdate = new Date();
		
		RentalGoods rental = rentalService.getRentalInfo(seq);
		
		rdate.setMonth(rdate.getMonth() + Integer.parseInt(rental.getTerm()));
		
		System.out.println("" + rdate.getYear() + "/" + rdate.getMonth() + "/" + rdate.getDate());
		
		rental.setRe_turn("" + rdate.getYear() + "/" + rdate.getMonth() + "/" + rdate.getDate());
		
		rentalService.updateSdate(rental);
		
		}else {
			return "redirect:/lentManage.do";
		}
		return "redirect:/mainbbslist.do";
	}
	
}
