package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
 
import kh.com.a.dao.sellerPageDao;
import kh.com.a.model.GoodsDto;
import kh.com.a.model.QnADto;
import kh.com.a.model.RentalGoods;
import kh.com.a.service.sellerPageService;

@Repository
public class sellerPageServiceImpl implements sellerPageService{

	@Autowired
	sellerPageDao sdao;

	@Override
	public List<QnADto> getMyQnaList(String id) throws Exception {
		
		return sdao.getMyQnaList(id);
	}

	@Override
	public List<GoodsDto> Rental3(String id) throws Exception {
		System.out.println(" sellerPageServiceImpl Rental3입니다" + id);
		
		
		return sdao.Rental3(id);
	}

	@Override
	public List<RentalGoods> manageRentalList(String id) throws Exception {
		System.out.println(" sellerPageServiceImpl manageRentalList입니다" + id);
		
		
		return sdao.manageRentalList(id);
	}

	@Override
	public GoodsDto GoodsDto(int seq) throws Exception {
		
		
		return sdao.GoodsDto(seq);
	}
	
	
 
	
	
}
