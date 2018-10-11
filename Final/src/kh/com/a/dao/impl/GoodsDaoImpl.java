package kh.com.a.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.GoodsDao;

@Repository
public class GoodsDaoImpl implements GoodsDao {

	@Autowired
	SqlSession sqlSession;
	
	private String namespace = "Goods.";
}
