package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.MainBbsDao;
import kh.com.a.model.GoodsDto;
import kh.com.a.model.InterDto;
import kh.com.a.model.ReviewDto;
import kh.com.a.service.MainBbsService;

@Service
public class MainBbsServiceImpl implements MainBbsService {
	@Autowired
	MainBbsDao mainbbsdao;

	@Override
	public List<GoodsDto> getRecentGoods() throws Exception {
		return mainbbsdao.getRecentGoods();
	}

	@Override
	public List<GoodsDto> getPopularGoods() throws Exception {
		return mainbbsdao.getPopularGoods();
	}

	@Override
	public GoodsDto getGoodsDetail(int seq) throws Exception {
		System.out.println(seq);
		return mainbbsdao.getGoodsDetail(seq);
	}

	@Override
	public boolean putInterest(InterDto idto) throws Exception {
		return mainbbsdao.putInterest(idto);
	}
	
	@Override
	public InterDto interCheck(InterDto idto) throws Exception{
		return mainbbsdao.interCheck(idto);
	}

	@Override
	public boolean delInterest(InterDto idto) throws Exception {
		return mainbbsdao.delInterest(idto);
	}

	@Override
	public List<ReviewDto> getReviewforMain() throws Exception {
		return mainbbsdao.getReviewforMain();
	}

	@Override
	public ReviewDto getReviewDetail(int seq) throws Exception {
		return mainbbsdao.getReviewDetail(seq);
	}

	@Override
	public List<ReviewDto> getReviewDetailList(int seq) throws Exception {
		return mainbbsdao.getReviewDetailList(seq);
	}

	@Override
	public List<InterDto> youAreInterestedIn(String id) throws Exception {
		return mainbbsdao.youAreInterestedIn(id);
	}
	
	
}
