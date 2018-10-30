package kh.com.a.service;

import java.util.List;

import kh.com.a.insertPatemeter.getUrentalList;
import kh.com.a.model.BbsParam;
import kh.com.a.model.QnADto;
import kh.com.a.model.RentalGoods;

public interface userMypageService {

	public List<QnADto> getMyQnaList(String id) throws Exception;
	
	public List<RentalGoods> Rental3(String id) throws Exception;
 
	public RentalGoods getRentalDto(getUrentalList dto) throws Exception;
	
	public List<QnADto> getBbsPagingList(BbsParam param) throws Exception;
	
	public int getBbsCount(BbsParam param) throws Exception;
		
}
