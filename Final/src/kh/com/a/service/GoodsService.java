package kh.com.a.service;

import kh.com.a.model.GoodsDto;

public interface GoodsService {

	public void insertGoods(GoodsDto dto) throws Exception;
	
	public GoodsDto getGoodsdetail(int seq) throws Exception;
}
