package kh.com.a.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.com.a.model.BbsParam;
import kh.com.a.model.NoticeDTO;
import kh.com.a.model.QnADto;
import kh.com.a.service.NoitceService;

@Controller
public class NoitceController {

	private static final Logger logger = LoggerFactory.getLogger(NoitceController.class);

	@Autowired
	NoitceService NoitceService;
	
	@RequestMapping(value = "Noticelist.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String list(Model model,BbsParam param) throws Exception {

		// service의 list() 호출해서 처리된 데이터를 model에 담는다.
		logger.info("listview 로 이동합니다!!!!!!!!!!!!!!");
		//페이징 처리
		
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
				
		//페이징 처리 끝
				
		List<NoticeDTO> noticelist = NoitceService.getNoticelist();
			/*System.out.println(noticelist.get(0).toString());*/
			
				int totalRecordCount = NoitceService.getBbsCount(param);
				List<NoticeDTO> NoticeList = NoitceService.getBbsPagingList(param);
				model.addAttribute("noticelist", noticelist);
				model.addAttribute("NoticeList", NoticeList);
					
				model.addAttribute("pageNumber", sn);
				model.addAttribute("pageCountPerScreen", 10);
				model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
				model.addAttribute("totalRecordCount", totalRecordCount);
				
				return "Noticelist.tiles";
	} // end of list()
	
	
	@RequestMapping(value="view.do" , method = { RequestMethod.GET, RequestMethod.POST })
	public String view(Model model , int seq) throws Exception {
		logger.info("view로 이동합니다");
			NoticeDTO dto = null;
			dto=NoitceService.getviewlist(seq);
			NoitceService.readCount(seq);
			
			System.out.println(dto.toString() + "view 를 불러왔을 떄 dto");
			
			model.addAttribute("dto", dto);
			
		
		return "view.tiles";
	}
	

	@RequestMapping(value="update.do" ,method= {RequestMethod.GET, RequestMethod.POST})
	public String update(Model model,NoticeDTO dto) throws Exception {
		
		logger.info("writeview 로 이동합니다");
		
		System.out.println(dto.toString() + " view 에서 받아온 dto값들 ");
		dto=NoitceService.getviewlist(dto.getSeq());
		model.addAttribute("dto", dto);
		
		return "update.tiles";
	}
	
	@RequestMapping(value="updateAf.do" ,method= {RequestMethod.GET, RequestMethod.POST})
	public String updateAf(Model model,NoticeDTO dto) throws Exception {
		
		logger.info("수정된 사항을 가지고 view  로 이동합니다");
		System.out.println("view 에서 받아온 데이터들을 보여줄게  " +dto.toString()  );
		
		NoitceService.updateNotice(dto);
		
		
		return "redirect:/Noticelist.do";
	}

	//write
	@RequestMapping(value="write.do" ,method= {RequestMethod.GET, RequestMethod.POST})
	public String write()  throws Exception{
		
		logger.info("writeview 로 이동합니다");
		
		return "write.tiles";
	}
	
	@RequestMapping(value="writeAf.do" , method= {RequestMethod.GET, RequestMethod.POST})
	public String writeAf(Model model, NoticeDTO dto) throws Exception {
		System.out.println("writeAf 로 들어왔습니다");
		if(dto.getContent().equals("") || dto.getTitle().equals("")){
			System.out.println("내용이 없기 때문에 다시 쓰세요");
			return "write.tiles";
		}
		
		logger.info("writeAf 입니다 ");
		NoitceService.writelist(dto);
		
		return "redirect:/Noticelist.do";
	}
	//write end
	//delete
	@RequestMapping(value="delete.do" , method= {RequestMethod.GET, RequestMethod.POST})
	public String delete(Model model,int seq) throws Exception {
		logger.info("게시물을 삭제 시키겠습니다 DB 에는 남기겠습니다.");
		
		NoitceService.deletelist(seq);
		
		return "redirect:/Noticelist.do";
	}
	
	//delete end
	
}
