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

	@Override
	public boolean reviewWrite(ReviewDto reviewDto) throws Exception {
		return reviewDao.reviewWrite(reviewDto);
	}

	@Override
	public List<ReviewDto> getReviewPagingList(ReviewParam param) throws Exception {
		// TODO Auto-generated method stub
		return reviewDao.getReviewPagingList(param);
	}

	@Override
	public int getReviewCount(ReviewParam param) throws Exception {
		// TODO Auto-generated method stub
		return reviewDao.getReviewCount(param);
	}

	@Override
	public double getLikedAvg(ReviewParam param) throws Exception {
		// TODO Auto-generated method stub
		return reviewDao.getLikedAvg(param);
	}

	@Override
	public ReviewDto getReviewOne(int seq) throws Exception {
		System.out.println("DAO 수정을 위한 게시물 번호 확인 :" + seq);
		return reviewDao.getReviewOne(seq);
	}

	@Override
	public void updateReview(ReviewDto reviewDto) throws Exception {
		
		reviewDao.updateReview(reviewDto);
	}

	@Override
	public void reviewDelete(int seq) {
		
		reviewDao.reviewDelete(seq);
		
	}

}
