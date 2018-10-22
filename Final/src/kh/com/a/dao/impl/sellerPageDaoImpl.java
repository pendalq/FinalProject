package kh.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.sellerPageDao;
import kh.com.a.model.QnADto;

@Repository
public class sellerPageDaoImpl implements sellerPageDao {

	@Autowired
	SqlSession sqlSession;
	
	private String namespace = "seller.";

	@Override
	public List<QnADto> getMyQnaList(String id) throws Exception {
		System.out.println(" sellerPageDaoImpl getMyQnaList");
		
		List<QnADto> qnaList = sqlSession.selectList( namespace + "getMyQnaList" ,id);
		
		System.out.println(" sellerPageDaoImpl  qnaList dadada" + qnaList);
		
		return qnaList;
	}
	
	
	
	
}
