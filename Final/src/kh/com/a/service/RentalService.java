package kh.com.a.service;

import kh.com.a.model.GoodsDto;
import kh.com.a.model.MemberDto;

public interface RentalService {

	public MemberDto getMemberInfo(String id) throws Exception;
	
	public GoodsDto getGoodsInfo(int seq) throws Exception;
	
}
