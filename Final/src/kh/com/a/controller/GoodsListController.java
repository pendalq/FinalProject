package kh.com.a.controller;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.com.a.model.GoodsDto;
import kh.com.a.model.GoodsParam;
import kh.com.a.service.GoodsListService;

@Controller
public class GoodsListController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	GoodsListService goodsListService;
	

	@RequestMapping(value = "goodsList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String goodsAllList(Model model, GoodsParam param) throws Exception {
		logger.info("GoodsAllListController AllList" + new Date());
		
		// paging 처리
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn + 1) * param.getRecordCountPerPage();
		System.out.println("controller   sn: " + sn + " start: " + start + " end: " + end + "    paging1 ");

		param.setStart(start);
		param.setEnd(end);
		
		// category가 all로 들어올 경우 category null로 초기화
		if (param.getCategory() == "all") {
			param.setCategory(null);
			param.setKeyword(null);
			param.setOptions(null);
		}
		
		System.out.println("controller check : " + param.toString());
		

		// 총 글의 갯수
		int totalRecordCount = goodsListService.getGoodsCount(param);
		
		// 게시물 받아옴
		List<GoodsDto> goodsList = goodsListService.getGoodsPagingList(param);
		model.addAttribute("goods", goodsList);
		System.out.println("controller   goodList success");

		System.out.println("options :  " + param.getOptions());
		System.out.println("category:  " + param.getCategory());
		System.out.println("keyword:  " + param.getKeyword());

		// paging 처리 2
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 15);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		System.out.println(
				"recordCountPerPage: " + param.getRecordCountPerPage() + " totalRecordCount: " + totalRecordCount);

		// 선택한 카테고리와 검색한 단어를 설정
		model.addAttribute("category", param.getCategory());
		model.addAttribute("keyword",param.getKeyword());

		return "goodsList.tiles";
	}
}
