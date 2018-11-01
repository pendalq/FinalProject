package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.ReviewDao;
import kh.com.a.model.ReviewDto;
import kh.com.a.model.ReviewParam;
import kh.com.a.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDao reviewDao;

	// 게시물 10개 출력 및 페이징 처리 .
	@Override
	public List<ReviewDto> getReviewPagingList(ReviewParam param) throws Exception {

		return reviewDao.getReviewPagingList(param);
	}

	// 상품에 등록 된 리뷰게시물 개수 출력
	@Override
	public int getReviewCount(ReviewParam param) throws Exception {

		return reviewDao.getReviewCount(param);
	}

	// 상품 리뷰의 평균 만족도를 출력
	@Override
	public double getLikedAvg(ReviewParam param) throws Exception {

		return reviewDao.getLikedAvg(param);
	}

	// 리뷰 작성 전 상품 이름 출력
	@Override
	public String getGoodsName(int gseq) {
		
		return reviewDao.getGoodsName(gseq);
	}

	// 리뷰 게시물 작성
	@Override
	public boolean reviewWrite(ReviewDto reviewDto) throws Exception {
		
		return reviewDao.reviewWrite(reviewDto);
	}

	// 수정 할려고 하는 게시물 출력
	@Override
	public ReviewDto getReviewOne(int seq) throws Exception {
		
		System.out.println("DAO 수정을 위한 게시물 번호 확인 :" + seq);
		return reviewDao.getReviewOne(seq);
	}
	
	// 게시물 수정 
	@Override
	public void updateReview(ReviewDto reviewDto) throws Exception {

		reviewDao.updateReview(reviewDto);
	}

	// 게시물 삭제 
	@Override
	public void reviewDelete(int seq) {

		reviewDao.reviewDelete(seq);

	}

}
