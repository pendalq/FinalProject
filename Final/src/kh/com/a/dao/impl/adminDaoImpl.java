package kh.com.a.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.adminDao;
import kh.com.a.model.adminDto;

@Repository
public class adminDaoImpl implements adminDao{

	@Autowired
	SqlSession sqlSession;
	
	private String namespace = "admin.";

	@Override
	public void updateMemauth(adminDto dto) throws Exception {
		sqlSession.update(namespace + "updateMemauth", dto);
		
	}
	
	
	
	
}
