package kh.com.a.service;

import java.util.List;

import kh.com.a.model.GoodsDto;
import kh.com.a.model.QnADto;
import kh.com.a.model.RentalGoods;

public interface sellerPageService {

	public List<QnADto> getMyQnaList(String id) throws Exception;
	
	public List<GoodsDto> Rental3(String id) throws Exception;
	
	public GoodsDto GoodsDto(int seq) throws Exception;
	
	public List<RentalGoods> manageRentalList(String id) throws Exception;

	
}
