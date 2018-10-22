package kh.com.a.service;

import java.util.List;

import kh.com.a.model.QnADto;

public interface sellerPageService {

	public List<QnADto> getMyQnaList(String id) throws Exception;
}
