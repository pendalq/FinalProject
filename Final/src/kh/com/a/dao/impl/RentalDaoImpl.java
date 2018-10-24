package kh.com.a.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.RentalDao;

@Repository
public class RentalDaoImpl implements RentalDao {
	
	@Autowired
	SqlSession sqlSession;
	
	private String namespace = "rental.";
}
