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
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.cj.fabric.xmlrpc.base.Member;

import kh.com.a.model.MemIdCheck;
import kh.com.a.model.MemberDto;
import kh.com.a.service.MemberService;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService memberService;
	
	
	
	@RequestMapping(value="login.do" , method={RequestMethod.GET, RequestMethod.POST})
	public String login() {
		logger.info("MemberController login.do" + new Date());
		
		return "login.tiles";
	}
	
	@RequestMapping(value="regi.do", method={RequestMethod.GET, RequestMethod.POST})
	public String regi() {
		logger.info("MemberController regi" + new Date());	
		
		return "regi.tiles";		
	}
	
	@RequestMapping(value="regiAF.do", method={RequestMethod.GET, RequestMethod.POST})
	public String regiAf(MemberDto mem) throws Exception{
		logger.info("MemberController regiAf" + new Date());		
		
		
		boolean b = memberService.addMember(mem);
		logger.info("bbbbbbb==" + b);	
		
		if(b) {
			return "login.tiles";
		}else {
			return "regi.tiles";
		}
	}			

	
	@RequestMapping(value="loginAF.do" , method={RequestMethod.GET, RequestMethod.POST})
	public String loginAf(HttpServletRequest req , MemberDto mdto) throws Exception {
		logger.info("MemberController loginAF" + new Date());
		
		MemberDto login = null;
		login = memberService.login(mdto);
		
		logger.info("loginAF" + login);
		
		if(login != null && !login.getId().equals("")) {
			logger.info("loginAF 성공");
			req.getSession().setAttribute("login", login );
			return "main.tiles";	   
			
		}else {
			logger.info("loginAF 실패");
			req.getSession().invalidate();
			return "login.tiles";	  
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="checkID.do", method={RequestMethod.GET, RequestMethod.POST})
	public MemIdCheck checkID(MemberDto mdto) {
		logger.info("MemberController checkID" + new Date());
		
		System.out.println(mdto);
		
		int count  = memberService.checkID(mdto);
		MemIdCheck mic = new MemIdCheck();
		logger.info("checkID.do count: " + count);
		
		if(count>0){
			mic.setMessage("YES");
		}else {
			mic.setMessage("NO");
		}
		
		return mic;
	}
	
 	@RequestMapping(value="mypage.do" , method= {RequestMethod.GET, RequestMethod.POST})
 	public String mypage() {
 		logger.info("MemberController mypage.do" + new Date());
		
		return "mypage.tiles";
 	}
 	
}	