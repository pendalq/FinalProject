package kh.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.ReviewDao;
import kh.com.a.insertPatemeter.getUrentalList;
import kh.com.a.model.ReviewDto;
import kh.com.a.model.ReviewParam;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	SqlSession sqlSession;

	private String namespace = "review.";

	// 게시물 10개 출력 및 페이징 처리
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
	
	@Override
	public List<ReviewParam> getReviewPagingListAjax(ReviewParam param) throws Exception {
		
		System.out.println("DAO GoodParam : " + param.toString());
		List<ReviewParam> list = sqlSession.selectList(namespace + "getReviewPagingListAjax", param);
		for (int i = 0; i < list.size(); i++) {
			System.out.println("DAO  getReviewPagingListAjax[" + i + "]:" + list.get(i).toString());
		}
		
		return list;
	}

	// 상품에 등록 된 리뷰게시물 개수 출력
	@Override
	public int getReviewCount(ReviewParam param) throws Exception {

		System.out.println("리뷰 카운터 메소드 전 입니다.");
		int num = 0;
		num = sqlSession.selectOne(namespace + "getReviewCount", param);
		System.out.println("DAO  getReviewCount : " + num);
		System.out.println("리뷰 카운터 메소드 후 입니다.");
		return num;
	}

	// 상품 리뷰의 평균 만족도를 출력
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

	// 리뷰 작성 전 상품 이름 출력
	@Override
	public String getGoodsName(int gseq) {
		
		String goodsName = sqlSession.selectOne(namespace + "getGoodsName", gseq);
		
		return goodsName;
	}

	// 리뷰 게시물 작성
	@Override
	public boolean reviewWrite(ReviewDto reviewDto) throws Exception {
		System.out.println("DAO reviewWrite :  " + reviewDto.toString());
		System.out.println("리뷰 작성 메소드 전 입니다.");
		int isS = sqlSession.insert(namespace + "reviewWrite", reviewDto);
		System.out.println("리뷰 카운터 메소드 후 입니다.");
		return isS > 0 ? true : false;
	}

	// 수정 할려고 하는 게시물 출력
	@Override
	public ReviewDto getReviewOne(int seq) {
		System.out.println("DAO 수정을 위한 게시물 출력 시퀀스 넘버 : " + seq);
		return sqlSession.selectOne(namespace + "getReviewOne", seq);
	}

	// 게시물 수정
	@Override
	public void updateReview(ReviewDto reviewDto) throws Exception {
		System.out.println("DAO  수정을 위한 게시물 확인(updateAf) : " + reviewDto.toString());
		sqlSession.update(namespace + "updateReview", reviewDto);

	}
	// 게시물 삭제
	@Override
	public void reviewDelete(int seq) {
		sqlSession.delete(namespace + "reviewDelete", seq);
	}

	// 리뷰 중복 작성을 막기 위한 작성한 리뷰 개수 출력
	@Override
	public int getReviewWriteCount(getUrentalList dto) throws Exception {
		System.out.println("DAO getReviewWriteCount id 확인 : " + dto.toString());
		int reWriteCount = sqlSession.selectOne(namespace + "getReviewWriteCount", dto);
		
		return reWriteCount;
	}
	

}
