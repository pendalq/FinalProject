package kh.com.a.service;

import java.util.List;

import kh.com.a.model.GoodsDto;
import kh.com.a.model.GoodsParam;

public interface GoodsListService {

	List<GoodsDto> getGoodsAllList() throws Exception;

	List<GoodsDto> getGoodsPagingList(GoodsParam param) throws Exception;

	int getGoodsCount(GoodsParam param) throws Exception;
}
