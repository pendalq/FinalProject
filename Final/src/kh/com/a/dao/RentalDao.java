package kh.com.a.dao;

import kh.com.a.model.GoodsDto;
import kh.com.a.model.MemberDto;
import kh.com.a.model.RentalGoods;

public interface RentalDao {

	public MemberDto getMemberInfo(String id) throws Exception;
	
	public GoodsDto getGoodsInfo(int seq) throws Exception;
	
	public void doRental(RentalGoods rental) throws Exception;
}
