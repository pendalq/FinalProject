package kh.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.ReviewDao;
import kh.com.a.model.ReviewDto;
import kh.com.a.model.ReviewParam;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	SqlSession sqlSession;

	private String namespace = "review.";

	// 리뷰 10개 출력
	@Override
	public List<ReviewDto> getReviewPagingList(ReviewParam param) throws Exception {

		// 다오 파라메타 확인
		System.out.println("DAO GoodParam : " + param.toString());
		List<ReviewDto> list = sqlSession.selectList(namespace + "getReviewPagingList", param);
		for (int i = 0; i < list.size(); i++) {
			System.out.println("DAO  getReviewPagingList[" + i + "]:" + list.get(i).toString());
		}

		return list;
	}

	// 리뷰 카운트
	@Override
	public int getReviewCount(ReviewParam param) throws Exception {

		System.out.println("리뷰 카운터 메소드 전 입니다.");
		int num = 0;
		num = sqlSession.selectOne(namespace + "getReviewCount", param);
		System.out.println("DAO  getReviewCount : " + num);
		System.out.println("리뷰 카운터 메소드 후 입니다.");
		return num;
	}

	// 리뷰 평점 평균 구함.
	@Override
	public double getLikedAvg(ReviewParam param) throws Exception {
		System.out.println("리뷰 평점 평균 구하기 전 입니다.");
		double likedAvg = 0;
		try {
			likedAvg = sqlSession.selectOne(namespace + "getLikedAvg", param);
			
		} catch (NullPointerException e) {
			likedAvg = 0;
		}
		System.out.println("리뷰 평점 평균 구하기 후 입니다.");
		return likedAvg;
	}

	// 리뷰 작성
	@Override
	public boolean reviewWrite(ReviewDto reviewDto) throws Exception {
		System.out.println("DAO reviewWrite :  " + reviewDto.toString());
		System.out.println("리뷰 작성 메소드 전 입니다.");
		int isS = sqlSession.insert(namespace + "reviewWrite", reviewDto);
		System.out.println("리뷰 카운터 메소드 후 입니다.");
		return isS > 0 ? true : false;
	}

	@Override
	public ReviewDto getReviewOne(int seq) {
		return sqlSession.selectOne(namespace + "getReviewOne", seq);
	}
	
	@Override
	public void updateReview(ReviewDto reviewDto) throws Exception {
		System.out.println("DAO  수정을 위한 게시물 확인(updateAf) : " + reviewDto.toString());
		sqlSession.update(namespace +"updateReview", reviewDto);
		
	}

	@Override
	public void reviewDelete(int seq) {
		sqlSession.delete(namespace + "reviewDelete", seq);
		
	}



}
