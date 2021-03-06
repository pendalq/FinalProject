package kh.com.a.service;

import kh.com.a.model.GoodsDto;
import kh.com.a.model.MemberDto;
import kh.com.a.model.RentalGoods;

public interface RentalService {

	public MemberDto getMemberInfo(String id) throws Exception;
	
	public GoodsDto getGoodsInfo(int seq) throws Exception;
	
	public void doRental(RentalGoods rental) throws Exception;
	
	public RentalGoods getRentalInfo(int seq) throws Exception;
	
	public void updateSdate(RentalGoods rental) throws Exception;
	
	public void endRent(int seq) throws Exception;
}
