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

import kh.com.a.model.MemberDto;
import kh.com.a.model.MessageDto;
import kh.com.a.service.MessageService;

@Controller
public class MessageController {

	private static Logger logger = LoggerFactory.getLogger(GoodsController.class);
	
	@Autowired
	MessageService messageService;
	
	@RequestMapping(value="message.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String message(Model model, HttpServletRequest req) throws Exception{
		
		logger.info("MessageController messageswrite " + new Date());
		
		//String id = ((MemberDto)req.getAttribute("login")).getId();
		String id= "id2";
		List<MessageDto> mlist = messageService.getMessageList(id);
		
		model.addAttribute("mlist", mlist);
		
		return "message.tiles";
	}
	
	@RequestMapping(value="messagewrite.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String messagewrite(Model model, MessageDto mdto) throws Exception {
		
		logger.info("MessageController messageswrite " + new Date());
		
		model.addAttribute("mdto", mdto);
				
		return "messagewrite.tiles";
	}
	
	@RequestMapping(value="messagewriteAf.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String messagewriteAf(Model model, MessageDto mdto) throws Exception {
		
		logger.info("MessageController messageswriteAf " + new Date());
		
		messageService.writeMessage(mdto);
		
		return "redirect:/message.do";
	}
	
	@RequestMapping(value="messagedetail.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String messagedetail(Model model, int seq) {
		
		logger.info("MessageController messageswriteAf " + new Date());
		
		
		
		return "messagedetail.tiles";
	}
	
}
