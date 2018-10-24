package kh.com.a.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.RentalDao;
import kh.com.a.model.GoodsDto;
import kh.com.a.model.MemberDto;

@Repository
public class RentalDaoImpl implements RentalDao {
	
	@Autowired
	SqlSession sqlSession;
	
	private String namespace = "rental.";

	@Override
	public MemberDto getMemberInfo(String id) throws Exception {
		return sqlSession.selectOne("Member.getMember", id);
	}

	@Override
	public GoodsDto getGoodsInfo(int seq) throws Exception {
		return sqlSession.selectOne("goods.getGoodsDetail", seq);
	}
}
