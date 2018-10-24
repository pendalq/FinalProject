package kh.com.a.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.RentalDao;
import kh.com.a.model.GoodsDto;
import kh.com.a.model.MemberDto;
import kh.com.a.service.RentalService;

@Service
public class RentalServiceImpl implements RentalService {
	
	@Autowired
	RentalDao rentalDao;

	@Override
	public MemberDto getMemberInfo(String id) throws Exception {
		return rentalDao.getMemberInfo(id);
	}

	@Override
	public GoodsDto getGoodsInfo(int seq) throws Exception {
		return rentalDao.getGoodsInfo(seq);
	}
	
}
