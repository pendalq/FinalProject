package kh.com.a.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.GoodsDao;
import kh.com.a.model.GoodsDto;

@Repository
public class GoodsDaoImpl implements GoodsDao {

	@Autowired
	SqlSession sqlSession;
	 
	private String namespace = "goods.";

	@Override
	public void insertGoods(GoodsDto dto) throws Exception {
		sqlSession.insert( namespace + "writeGoods", dto);
	}
}
