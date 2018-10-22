package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.QnADto;

public interface sellerPageDao {

	List<QnADto> getMyQnaList(String id) throws Exception;
	
	
}
