package kh.com.a.controller;

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
import kh.com.a.service.GoodsService;
import kh.com.a.service.MainBbsService;
import kh.com.a.service.MemberService;
import kh.com.a.service.RentalService;
import kh.com.a.service.impl.GoodsServiceImpl;
import kh.com.a.service.impl.MainBbsServiceImpl;
import kh.com.a.service.impl.MemberServiceImpl;

@Controller
public class RentalController {
	
	private static Logger logger = LoggerFactory.getLogger(RentalController.class);
	
	@Autowired
	RentalService rentalService;
	
	@RequestMapping(value="rental.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String rental(Model model, int seq, HttpServletRequest req) throws Exception {
		
		String id = (String) req.getSession().getAttribute("loginID");
		System.out.println(id);
		System.out.println(seq);
		
		GoodsDto goods = rentalService.getGoodsInfo(seq);
		MemberDto buyer = rentalService.getMemberInfo(id);
		
		model.addAttribute("goods", goods);
		model.addAttribute("buyer", buyer);
			
		return "payment.tiles";
	}
	
}
