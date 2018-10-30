package kh.com.a.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.RentalDao;
import kh.com.a.model.GoodsDto;
import kh.com.a.model.MemberDto;
import kh.com.a.model.RentalGoods;

@Repository
public class RentalDaoImpl implements RentalDao {
	
	@Autowired
	SqlSession sqlSession;
	
	private String namespace = "rental.";

	@Override
	public MemberDto getMemberInfo(String id) throws Exception {
		return sqlSession.selectOne( namespace + "getMember", id);
	}

	@Override
	public GoodsDto getGoodsInfo(int seq) throws Exception {
		return sqlSession.selectOne(namespace + "getGoodsDetail", seq);
	}

	@Override
	public void doRental(RentalGoods rental) throws Exception {
		sqlSession.insert( namespace +"doRental", rental);
	}

	@Override
	public RentalGoods getRentalInfo(int seq) throws Exception {
		return sqlSession.selectOne(namespace + "getRentalInfo", seq);
	}

	@Override
	public void updateSdate(RentalGoods rental) throws Exception {
		sqlSession.update(namespace + "updateSdate", rental);
	}

	@Override
	public void endRent(int seq) throws Exception {
		sqlSession.delete(namespace + "endRent", seq);
	}
}
