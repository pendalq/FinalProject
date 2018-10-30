package kh.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.userMypageDao;
import kh.com.a.insertPatemeter.getUrentalList;
import kh.com.a.model.BbsParam;
import kh.com.a.model.QnADto;
import kh.com.a.model.RentalGoods;

@Repository
public class userMypageDaoImpl implements userMypageDao{
	
	@Autowired
	SqlSession sqlSession;
	
	private String namespace = "uMypage.";

	@Override
	public List<QnADto> getMyQnaList(String id) throws Exception {
		System.out.println(" userMypageDaoImpl getMyQnaList");
		
		
		
		List<QnADto> qnaList = sqlSession.selectList( namespace + "getMyQnaList" ,id);
		
		System.out.println(" userMypageDaoImpl  qnaList dadada" + qnaList);
		
		return qnaList;
	}

	@Override
	public List<RentalGoods> Rental3(String id) throws Exception {
		System.out.println(" userMypageDaoImpl Rental3입니다" + id);
		
		List<RentalGoods> Rental3 = sqlSession.selectList(namespace + "Rental3" , id);
		System.out.println(" userMypageDaoImpl Rental3 rarara " + Rental3);
		
		return Rental3;
	}

	@Override
	public RentalGoods getRentalDto(getUrentalList dto) throws Exception {
		System.out.println(" getRentalDto 는  " + dto);
		
		RentalGoods getRentalDto = sqlSession.selectOne( namespace + "getUrentalDto", dto);
		System.out.println(" getRentalDto 는 " + getRentalDto);
		
		return getRentalDto;
	}

	@Override
	public List<QnADto> getBbsPagingList(BbsParam param) throws Exception {
		System.out.println(" sellerPageDaoImpl getMyQnaList 가져오기");
		List<QnADto> list = sqlSession.selectList(namespace + "getBbsPagingList", param);
		System.out.println("  마이페이지에 내보내 버리기");
		return list;
	}

	@Override
	public int getBbsCount(BbsParam param) throws Exception {
		int num = 0;
		System.out.println(" sellerPageDaoImpl getMyQnaList 카운트 받아오기");
		num = sqlSession.selectOne(namespace + "getBbsCount", param); 
		System.out.println("마이페이지 카운트 내보내 버리기");
		return num;
	}
	
	
	
	
	
}
