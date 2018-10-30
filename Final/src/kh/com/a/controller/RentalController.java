package kh.com.a.controller;

import java.util.Calendar;
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
		
		if(status.equals("startRent")) {
			
			Calendar cal = Calendar.getInstance();
			
			RentalGoods rental = rentalService.getRentalInfo(seq);
			
			int year = cal.get(cal.YEAR);
			int month = cal.get(cal.MONTH) + 1;
			int date = cal.get(cal.DATE) - 1;
			
			System.out.println("" + year + "/" + month + "/" + date);
			
			month = month + Integer.parseInt(rental.getTerm());
			
			if(month > 12) {
				month = month - 12;
				year++;
			}
			
			System.out.println("" + year + "-" + month + "-" + date);
			if(month < 10) {
				if(month == 2 && date > 28) {
					month++;
					date = date - 28;
					rental.setRe_turn("" + year + "-0" + month + "-" + date);
				}else {
					rental.setRe_turn("" + year + "-0" + month + "-" + date);
				}
			}else {
				rental.setRe_turn("" + year + "-" + month + "-" + date);
			}
			
			rentalService.updateSdate(rental);
			
		}else if(status.equals("endRent")){
			rentalService.endRent(seq);
		}
		
		return "redirect:/lentManage.do";
	}
	
}
