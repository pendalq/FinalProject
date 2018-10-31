package kh.com.a.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.com.a.model.BbsParam;
import kh.com.a.model.QnADto;
import kh.com.a.model.adminDto;
import kh.com.a.service.MemberService;
import kh.com.a.service.QnAService;
import kh.com.a.service.sellerPageService;
@Controller
public class QnAController {

	
	private static final Logger logger = LoggerFactory.getLogger(QnAController.class);
	
	
	@Autowired
	QnAService qnAService;
	@Autowired
	MemberService  memberService;
	

	
	@RequestMapping(value="QnAlist.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String bbsList(Model model, BbsParam param, HttpServletRequest req ) throws Exception{		
		logger.info("QnA 게시판을 불러오는 곳입니다.");
		
		if(req.getSession().getAttribute("loginAuth") != null) {
			model.addAttribute("loginAuth", (int)req.getSession().getAttribute("loginAuth"));
		}else { 
			return "redirect:/login.do";
		}
		// paging 처리
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn+1) * param.getRecordCountPerPage();
		/*
		  	0	
		  		0 * 10 + 1  -> 1
		  		0+1 * 10	-> 10
		  	1	
		  		1 * 10 + 1  -> 11
		  		1+1 * 10	-> 20
		  		
		  		[1][2][3][4][5][6][7][8][9][10]
		 */
		
		
		param.setStart(start);
		param.setEnd(end);
		
		List<QnADto> QnAlist = qnAService.getBbsPagingList(param);
		
		for (int i = 0; i < QnAlist.size(); i++) {
			System.out.println(QnAlist.get(i).toString());
		}
		// 글의 갯수
		int totalRecordCount = qnAService.getBbsCount(param);
		for (int i = 0; i < QnAlist.size(); i++) {
			QnAlist.get(i).setWdate(QnAlist.get(i).getWdate().substring(0, 10));
		}
		
		model.addAttribute("QnAlist", QnAlist);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
			
		// 선택한 카테고리와 검색한 단어를 설정 
		model.addAttribute("s_category", param.getS_category());
		model.addAttribute("s_keyword", param.getS_keyword());		
		
		return "QnAlist.tiles";
	}
	
	
	//detail 시작
	
	@RequestMapping(value = "QnADetail.do", 
			method = {RequestMethod.GET, RequestMethod.POST})
	public String QnADetail(int seq,Model model,HttpServletRequest req) throws Exception {
		logger.info(" QnA  !!!!!detail 로 이동합니다!!");
		QnADto qna=null;
		
		
		qnAService.readCount(seq);
		qna=qnAService.getBbs(seq);
		
		System.out.println("날짜 시간 안자른것 가져오기  == " + qna.getWdate());
		qna.setWdate(qna.getWdate().substring(0, 10));
		System.out.println(" 날짜 시간 자른것 가져오기 ==  " + qna.getWdate());
		
		List<adminDto> list = memberService.getMemberId();
		model.addAttribute("qna", qna);
		System.out.println("리스트가 잘 나오는지 확인좀 해보자 " + list.toString());
		model.addAttribute("list", list);
		model.addAttribute("auth", (int) req.getSession().getAttribute("loginAuth"));
		model.addAttribute("loginid",(String)req.getSession().getAttribute("loginID") );
		return "QnADetail.tiles";
	}
	
	
	//detail 끝
	//update 시작
	@RequestMapping(value = "QnAUpdate.do", 
			method = {RequestMethod.GET,RequestMethod.POST})
	public String QnAUpdate(QnADto qna, Model model)throws Exception {
		logger.info("updateview 로 이동합니다" + qna.toString());
	
		QnADto rbbs = qnAService.getBbs(qna.getSeq());
		model.addAttribute("bbs", rbbs);
		return "QnAUpdate.tiles";
	}
	
	@RequestMapping(value = "QnAUpdateAf.do", 
			method = RequestMethod.POST)
	public String QnAUpdateAf(QnADto qna,Model model) throws Exception {
		logger.info("QnAUpdateAf.do 처리   중입니다!!!!!!!");
		qnAService.updateBbs(qna);
		logger.info("QnAUpdateAf.do 처리    완료입니다!!!!!!!");
		return "redirect:/list.do";
	}
	//update 끝
	
	//replay 시작
	
	@RequestMapping(value = "QnAreply.do", 
			method = {RequestMethod.GET,RequestMethod.POST})
	public String QnAreply(QnADto qna, Model model,HttpServletRequest req)throws Exception {
		logger.info(" reply 합니다 합니다 합니다");
			
		QnADto rbbs = qnAService.getBbs(qna.getSeq());
		model.addAttribute("qna", rbbs);
		model.addAttribute("loginId", req.getSession().getAttribute("loginID"));
		return "QnAReply.tiles";
	}
	
	@RequestMapping(value = "QnAreplyAf.do", 
			method = {RequestMethod.GET,RequestMethod.POST})
	public String QnAreplyAf(QnADto qna, Model model) throws Exception {
		logger.info(" reply 올리셨네요 처리할게요!!!!");
			System.out.println("값이 나오는지 출력하는 곳 qna = " + qna.toString());
		qnAService.reply(qna);
		
			
		return "redirect:/QnAlist.do";
	}
	
	//replay 끝
	
	
	//write 시작
	
	@RequestMapping(value="QnAWrite.do", method = {RequestMethod.GET,	RequestMethod.POST})
	public String QnAWrite(Model model) {
		logger.info("QnAWrite 처리중입니다~~~~");
		
		return "QnAWrite.tiles";
	}
	
	
	@RequestMapping(value = "QnAWriteAf.do", 
			method = RequestMethod.POST)
	public String QnAWriteAf(QnADto qna, Model model) throws Exception {
		if(qna.getContent().equals("") || qna.getTitle().equals("")){
			return "QnAWrite.tiles";
		}
		logger.info("QnAwrite 사용자가 쓰고있습니다");
		qnAService.writeBbs(qna);
		return "redirect:/QnAlist.do";
	}
	
	//write 끝
	
	//delete 시작
	
	@RequestMapping(value = "QnADelete.do", 
			method = {RequestMethod.GET,RequestMethod.POST})
	public String QnADelete(QnADto qna, Model model) throws Exception{
		logger.info("삭제할겁니다아~~~~~~~~~~ ");
		
		qnAService.deleteBbs(qna.getSeq());
		return "redirect:/QnAlist.do";
	}
	//delete 끝
}
