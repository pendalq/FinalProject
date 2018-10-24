package kh.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.MainBbsDao;
import kh.com.a.model.GoodsDto;
import kh.com.a.model.InterDto;
import kh.com.a.model.ReviewDto;

@Repository
public class MainBbsDaoImpl implements MainBbsDao {
	
	
	@Autowired
	SqlSession sqlSession;
	
	private String namespace = "goods.";
	private String namespace2 = "inter.";
	private String namespace3 = "review.";

	@Override
	public List<GoodsDto> getRecentGoods() throws Exception {
		List<GoodsDto> rlist = sqlSession.selectList(namespace + "getRecentGoods");
		return rlist;
	}

	@Override
	public List<GoodsDto> getPopularGoods() throws Exception {
		List<GoodsDto> plist = sqlSession.selectList(namespace + "getPopularGoods");
		return plist;
	}

	@Override
	public GoodsDto getGoodsDetail(int seq) throws Exception {
		return sqlSession.selectOne(namespace+"getGoodsDetail", seq);
	}

	@Override
	public boolean putInterest(InterDto idto) throws Exception {
		sqlSession.insert(namespace2 + "putInterest", idto);
		return true;
	}

	@Override
	public InterDto interCheck(InterDto idto) throws Exception {
		
		return sqlSession.selectOne(namespace2 + "interCheck", idto);	
	}

	@Override
	public boolean delInterest(InterDto idto) throws Exception {
		int result = sqlSession.delete(namespace2 + "delInterest", idto);
		return result > 0 ? true : false;
	}

	@Override
	public List<ReviewDto> getReviewforMain() throws Exception {
		List<ReviewDto> reviewlist = sqlSession.selectList(namespace3 + "getReviewforMain");
		return reviewlist;
	}

	@Override
	public ReviewDto getReviewDetail(int seq) throws Exception {
		return sqlSession.selectOne(namespace3 + "getReviewDetail", seq);
	}

	@Override
	public List<ReviewDto> getReviewDetailList(int seq) throws Exception {
		List<ReviewDto> reviewdetaillist = sqlSession.selectList(namespace3 + "getReviewDetailList", seq);
		return reviewdetaillist;
	}
	
	
	


}
