package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.GoodsDto;
import kh.com.a.model.InterDto;
import kh.com.a.model.ReviewDto;

public interface MainBbsDao {
	List<GoodsDto> getRecentGoods() throws Exception;
	List<GoodsDto> getPopularGoods() throws Exception;
	List<ReviewDto> getReviewforMain() throws Exception;
	
	GoodsDto getGoodsDetail(int seq) throws Exception;
	InterDto interCheck(InterDto idto) throws Exception;
	ReviewDto getReviewDetail(int seq) throws Exception;
	List<ReviewDto> getReviewDetailList(int seq) throws Exception;
	
	boolean putInterest(InterDto idto) throws Exception;
		
	boolean delInterest(InterDto idto) throws Exception;
	
	List<InterDto> youAreInterestedIn(String id) throws Exception;
	
	void goodsDel(int seq) throws Exception;
}
