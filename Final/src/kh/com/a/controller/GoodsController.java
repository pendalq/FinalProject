package kh.com.a.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kh.com.a.service.GoodsService;

@Controller
public class GoodsController {

	private static Logger logger = LoggerFactory.getLogger(GoodsController.class);
	
	@Autowired
	GoodsService goodsService;
	
}
