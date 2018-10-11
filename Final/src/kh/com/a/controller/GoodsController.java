package kh.com.a.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.com.a.service.GoodsService;

@Controller
public class GoodsController {

	private static Logger logger = LoggerFactory.getLogger(GoodsController.class);
	
	@Autowired
	GoodsService goodsService;
	
	@RequestMapping(value="goodswrite.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String goodswrite(Model model) throws Exception {
		
		logger.info("GoodsController goodswrite " + new Date());
		
		model.addAttribute("doc_title", "상품 등록");
		
		return "goodswrite.tiles";
	}
	
}
