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

import kh.com.a.insertPatemeter.getUrentalList;
import kh.com.a.model.BbsParam;
import kh.com.a.model.GoodsDto;
import kh.com.a.model.MemberDto;
import kh.com.a.model.QnADto;
import kh.com.a.model.RentalGoods;
import kh.com.a.service.GoodsService;
import kh.com.a.service.sellerPageService;

@Controller
public class sellerPageController {

	private static final Logger logger = LoggerFactory.getLogger(sellerPageController.class);

	@Autowired
	sellerPageService sServ;

	@RequestMapping(value = "sellerpage.do", method = { RequestMethod.GET, RequestMethod.POST })
	// public String sellerRental(Model model, HttpServletRequest req ,int seq )
	// throws Exception{
	public String sellerpage(BbsParam param, Model model, HttpServletRequest req) throws Exception {
		logger.info("sellerPageController sellerpage.do" + new Date());
		// 자신이 문의한 전체개수

		// String id = ((MemberDto) req.getSession().getAttribute("login")).getId();
		String id = (String) req.getSession().getAttribute("loginID");

		// paging 처리
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn + 1) * param.getRecordCountPerPage();
		/*
		 * 0 0 * 10 + 1 -> 1 0+1 * 10 -> 10 1 1 * 10 + 1 -> 11 1+1 * 10 -> 20
		 * 
		 * [1][2][3][4][5][6][7][8][9][10]
		 */

		param.setStart(start);
		param.setEnd(end);
		param.setId(id);

		// 사용자 rental list >>판매자
		List<GoodsDto> rental3 = sServ.Rental3(id);
		model.addAttribute("srental3", rental3);
		logger.info("rental3=" + rental3);

		// 페이징도 불러오기
		// 사용자 qna list
		// List<QnADto> qnaList = sServ.getMyQnaList(id);
		// 자신이 올린 글의 갯수 확인
		System.out.println(" 파람값이 들어있는지 확인 합니다."+ param.toString());
		List<QnADto> myqnalist = sServ.getBbsPagingList(param);

		for (int i = 0; i < myqnalist.size(); i++) {
			System.out.println(myqnalist.get(i).toString());
		}
		// 글의 갯수
		int totalRecordCount = sServ.getBbsCount(param);

		model.addAttribute("myqnalist", myqnalist);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		logger.info("myqnalist=" + myqnalist);

		return "sellerpage.tiles";
	}

	@RequestMapping(value = "sellerRental.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String sellerRental(int seq) throws Exception {

		return "redirect:/goodsdetail.do?seq=" + seq;
	}

	@RequestMapping(value = "lentManage.do", method = { RequestMethod.GET, RequestMethod.POST })
	// public String lentManage(Model model, HttpServletRequest req ) throws
	// Exception{
	public String lentManage(Model model, HttpServletRequest req) throws Exception {
		logger.info("sellerPageController lentManage.do" + new Date());

		String id = (String) req.getSession().getAttribute("loginID");

		// SELECT R.SEQ , R.ID AS SU_ID , M.ADDRESS , M.PHONE , G.TITLE , R.WDATE ,
		// R.SDATE , M.NAME
		List<RentalGoods> manageRentalList = sServ.manageRentalList(id);
		model.addAttribute("manageRentalList", manageRentalList);

		return "lentManage.tiles";

	}

}
