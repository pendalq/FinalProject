package kh.com.a.service;

import java.util.List;

import kh.com.a.model.ReviewDto;
import kh.com.a.model.ReviewParam;

public interface ReviewService {

	boolean reviewWrite(ReviewDto reviewDto) throws Exception;

	List<ReviewDto> getReviewPagingList(ReviewParam param)throws Exception;

	int getReviewCount(ReviewParam param)throws Exception;

	double getLikedAvg(ReviewParam param) throws Exception;

	ReviewDto getReviewOne(int seq)throws Exception;
	
	void updateReview(ReviewDto reviewDto) throws Exception;

	void reviewDelete(int seq);

	

}
