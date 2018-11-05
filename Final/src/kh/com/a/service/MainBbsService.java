package kh.com.a.service;

import java.util.List;

import kh.com.a.model.GoodsDto;
import kh.com.a.model.InterDto;
import kh.com.a.model.ReviewDto;

public interface MainBbsService {
	public List<GoodsDto> getRecentGoods() throws Exception;
	public List<GoodsDto> getPopularGoods() throws Exception;
	public List<ReviewDto> getReviewforMain() throws Exception;
	
	
	public GoodsDto getGoodsDetail(int seq) throws Exception;
	public InterDto interCheck(InterDto idto) throws Exception;
	public ReviewDto getReviewDetail(int seq) throws Exception;
	public List<ReviewDto> getReviewDetailList(int seq) throws Exception;
	
	public boolean putInterest(InterDto idto) throws Exception;
		
	public boolean delInterest(InterDto idto) throws Exception;
	
	
	public List<InterDto> youAreInterestedIn(String id) throws Exception;
	
	
	public void goodsDel(int seq) throws Exception;
	
}
