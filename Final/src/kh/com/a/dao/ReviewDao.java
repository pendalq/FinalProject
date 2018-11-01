package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.ReviewDto;
import kh.com.a.model.ReviewParam;

public interface ReviewDao {

	// 게시물 10개 출력 및 페이징 처리 
	List<ReviewDto> getReviewPagingList(ReviewParam param) throws Exception;

	// 상품에 등록 된 리뷰게시물 개수 출력
	int getReviewCount(ReviewParam param) throws Exception;

	// 상품 리뷰의 평균 만족도를 출력
	double getLikedAvg(ReviewParam param) throws Exception;

	// 리뷰 작성 전 상품 이름 출력
	String getGoodsName(int gseq);

	// 리뷰 게시물 작성
	boolean reviewWrite(ReviewDto reviewDto) throws Exception;

	// 수정 할려고 하는 게시물 출력
	ReviewDto getReviewOne(int seq) throws Exception;

	// 게시물 수정
	void updateReview(ReviewDto reviewDto) throws Exception;

	// 게시물 삭제
	void reviewDelete(int seq);
}