package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.BbsParam;
import kh.com.a.model.GoodsDto;
import kh.com.a.model.QnADto;
import kh.com.a.model.RentalGoods;

public interface sellerPageDao {

	List<QnADto> getMyQnaList(String id) throws Exception;
	

	//판매자가 등록한 렌탈 제품 
	List<GoodsDto> Rental3(String id) throws Exception;
		
	//판매자가 등록한 렌탈 제품 LIST DETAIL
	GoodsDto GoodsDto(int seq) throws Exception;
	
	
	//판매자 대여관리
	List<RentalGoods> manageRentalList(String id) throws Exception;
	
	public List<QnADto> getBbsPagingList(BbsParam param) throws Exception;
		
	
	public int getBbsCount(BbsParam param) throws Exception;

}
