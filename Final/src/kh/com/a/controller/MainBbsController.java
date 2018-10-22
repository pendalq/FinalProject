package kh.com.a.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainBbsController {

	private static final Logger logger = LoggerFactory.getLogger(MainBbsController.class);
	
	@RequestMapping(value="main.do" , method= {RequestMethod.GET, RequestMethod.POST})
	public String gomain(HttpServletRequest req) {
		logger.info("mainController main.do" + new Date());
		
		logger.info("dto = " + req.getSession().getAttribute("loginID"));
		logger.info("dto = " + req.getSession().getAttribute("loginAuth"));
		
		return "main.tiles";
	}
}
