package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.GoodsListDao;
import kh.com.a.model.GoodsDto;
import kh.com.a.model.GoodsParam;
import kh.com.a.service.GoodsListService;

@Service
public class GoodsListServiceImpl implements GoodsListService {
	
	@Autowired
	GoodsListDao goodsListDao;

	@Override
	public List<GoodsDto> getGoodsAllList() throws Exception {
		return goodsListDao.getGoodsAllList();
	}

	@Override
	public List<GoodsDto> getGoodsPagingList(GoodsParam param) throws Exception {
		return goodsListDao.getGoodsPagingList(param);
	}

	@Override
	public int getGoodsCount(GoodsParam param) throws Exception {
		return goodsListDao.getGoodsCount(param);
	}

}
