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

	private static final Logger logger = LoggerFactory.getLogger(GoodsListController.class);

	@Autowired
	GoodsListService goodsListService;

	@RequestMapping(value = "goodslist.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String goodsAllList(Model model, GoodsParam param) throws Exception {
		logger.info("GoodsListController AllList" + new Date());

		System.out.println("controller check Befor : " + param.toString());

		// paging 처리
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn + 1) * param.getRecordCountPerPage();
		System.out.println("controller   sn: " + sn + " start: " + start + " end: " + end + "    paging1 ");

		param.setStart(start);
		param.setEnd(end);

//		 category가 all로 들어올 경우 category null로 초기화
		if (param.getSearchNum() == 1) {
			param.setCategory(null);
			param.setKeyword(null);
			param.setOptions(null);
		} else if (param.getKeyword() != null && param.getKeyword() != "") {
			param.setSearchNum(2);
			param.setCategory(null);
			param.setOptions(null);
		} else if (param.getSearchNum() == 3) {
			param.setKeyword(null);
			param.setOptions(null);
		} else if (param.getSearchNum() == 4) {
			if(param.getOptions() != null) {
				String options[] = param.getOptions().split("/");
				if(options.length == 3) {
					param.setOption1(options[0]);
					param.setOption2(options[1]);
					param.setOption3(options[2]);
				}else if(options.length == 2) {
					param.setOption1(options[0]);
					param.setOption2(options[1]);
				}else if(options.length == 1) {
					param.setOption1(options[0]);
				}
			}
		}

		System.out.println("controller check After : " + param.toString());

		// 총 글의 갯수
		int totalRecordCount = goodsListService.getGoodsCount(param);

		// 게시물 받아옴
		List<GoodsDto> goodsList = goodsListService.getGoodsPagingList(param);
		model.addAttribute("goods", goodsList);
		System.out.println("controller   goodList success");

		System.out.println("options :" + param.getOptions());
		System.out.println("category:" + param.getCategory());
		System.out.println("keyword:" + param.getKeyword());
		System.out.println("searchNum:" + param.getSearchNum());

		// paging 처리 2
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 15);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		System.out.println(
				"recordCountPerPage: " + param.getRecordCountPerPage() + " totalRecordCount: " + totalRecordCount);

		// 선택한 카테고리와 검색한 단어를 설정
		model.addAttribute("category", param.getCategory());
		model.addAttribute("keyword", param.getKeyword());
		// searchNum 초기화
		param.setSearchNum(0);
		model.addAttribute("searchNum", param.getSearchNum());

		// 카테고리 한글이름으로 보냄
		if (param.getCategory() != null) {
			if (param.getCategory().equals("정수기")) {
				model.addAttribute("categoryName", "정수기 옵션");
			} else if (param.getCategory().equals("냉장고")) {
				model.addAttribute("categoryName", "냉장고 옵션");
			} else if (param.getCategory().equals("TV")) {
				model.addAttribute("categoryName", "TV 옵션");
			}else {
				model.addAttribute("categoryName", "옵션");
			}
		} else {
			model.addAttribute("categoryName", "옵션");
		}

		return "goodsList.tiles";
	}
}
