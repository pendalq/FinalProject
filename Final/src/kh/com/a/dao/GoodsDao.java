package kh.com.a.dao;

import kh.com.a.model.GoodsDto;

public interface GoodsDao {

	public void insertGoods(GoodsDto dto) throws Exception;
	
	public GoodsDto getGoodsDetail(int seq) throws Exception;
	
}
