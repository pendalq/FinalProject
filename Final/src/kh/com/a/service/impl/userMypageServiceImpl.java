package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.userMypageDao;
import kh.com.a.insertPatemeter.getUrentalList;
import kh.com.a.model.BbsParam;
import kh.com.a.model.QnADto;
import kh.com.a.model.RentalGoods;
import kh.com.a.service.userMypageService;

@Service
public class userMypageServiceImpl implements userMypageService {

	@Autowired
	userMypageDao uMDao;

	@Override
	public List<QnADto> getMyQnaList(String id) throws Exception {
			
		return uMDao.getMyQnaList(id);
	}

	@Override
	public List<RentalGoods> Rental3(String id) throws Exception {
		System.out.println(" userMypageServiceImpl Rental3입니다");
		return uMDao.Rental3(id);
		
	}

	@Override
	public RentalGoods getRentalDto(getUrentalList dto) throws Exception{
		System.out.println(" userMypageServiceImpl getRentalDto입니다");
		
		return uMDao.getRentalDto(dto); 
	}

	@Override
	public List<QnADto> getBbsPagingList(BbsParam param) throws Exception {
		
		return uMDao.getBbsPagingList(param);
	}

	@Override
	public int getBbsCount(BbsParam param) throws Exception {
		
		return uMDao.getBbsCount(param);
	}

 
	
	
	
	
}
