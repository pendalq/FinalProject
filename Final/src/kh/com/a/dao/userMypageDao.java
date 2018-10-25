package kh.com.a.dao;

import java.util.List;

import kh.com.a.insertPatemeter.getUrentalList;
import kh.com.a.model.QnADto;
 
import kh.com.a.model.RentalGoods;

public interface userMypageDao {

	List<QnADto> getMyQnaList(String id) throws Exception;
	
	List<RentalGoods> Rental3(String id) throws Exception;
	
	RentalGoods getRentalDto(getUrentalList dto) throws Exception;

}
