package kh.com.a.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.GoodsDao;
import kh.com.a.model.GoodsDto;
import kh.com.a.service.GoodsService;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	GoodsDao goodsDao;

	@Override
	public void insertGoods(GoodsDto dto) throws Exception {
		goodsDao.insertGoods(dto);
	}
	
}
