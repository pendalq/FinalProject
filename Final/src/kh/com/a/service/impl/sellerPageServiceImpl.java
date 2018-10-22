package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
 
import kh.com.a.dao.sellerPageDao;
import kh.com.a.model.QnADto;
import kh.com.a.service.sellerPageService;

@Repository
public class sellerPageServiceImpl implements sellerPageService{

	@Autowired
	sellerPageDao sdao;

	@Override
	public List<QnADto> getMyQnaList(String id) throws Exception {
		
		return sdao.getMyQnaList(id);
	} 
	
	
}
