package kh.com.a.controller;



import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import kh.com.a.model.adminDto;
import kh.com.a.service.MemberService;
import kh.com.a.service.adminService;

@Controller
public class adminContorller {
	private static Logger logger = LoggerFactory.getLogger(GoodsController.class);

	@Autowired
	adminService adminService;
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="admin.do" , method= {RequestMethod.GET, RequestMethod.POST})
	public String admin(Model model) throws Exception {
		
		
		logger.info("빨리 관리자 페이지로 갑니다.");
		
		List<adminDto> adD=memberService.getMemberId();
		
		//adminDto 
		model.addAttribute("adD", adD);
		System.out.println("리스트에 값들이 뭐뭐 들어있는지 확인 하는 작업  adD  = " + adD.toString());
		
		return "adminMyPage.tiles";
	}
	
	@RequestMapping(value="adminAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String adminAf(Model model , adminDto dto) throws Exception{
		logger.info("해당 id에 대한 auth 값을 변경합니다");
			System.out.println("id = " + dto.getId()  + " , " + "auth = " + dto.getAuth());
					
			
			adminService.updateMemauth(dto);
		
		
		return "redirect:/admin.do";
		
	}
	
	
}
