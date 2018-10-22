package kh.com.a.controller;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kh.com.a.arrow.FUpUtil;
import kh.com.a.model.GoodsDto;
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
	
	
	@RequestMapping(value="goodswriteAf.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String goodswriteAf(Model model, GoodsDto dto, HttpServletRequest req, 
			@RequestParam(value="fileload", required=false)MultipartFile fileload) throws Exception {
		
		logger.info("GoodsController goodswriteAf " + new Date());
		
		System.out.println(dto.toString());
		
		dto.setImageName(fileload.getOriginalFilename());
		
		String fupload = req.getServletContext().getRealPath("/upload");
		
		String f = dto.getImageName();
		String newFile = FUpUtil.getNewFile(f);
		String imageFilename = "<img src='/Final/upload/"+ newFile +"'>";
		dto.setImageName(imageFilename);
		
		File file = new File(fupload + "/" + newFile);		
		logger.info("경로와 파일명:" + fupload + "/" + newFile);
		
		goodsService.insertGoods(dto);
		 
		//실제로 업로드 되는 부분		
		FileUtils.writeByteArrayToFile(file, fileload.getBytes());
		
		return "redirect:/goodswrite.do";
	}
	
}
