package kh.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.sellerPageDao;
import kh.com.a.model.BbsParam;
import kh.com.a.model.GoodsDto;
import kh.com.a.model.MemberDto;
import kh.com.a.model.QnADto;
import kh.com.a.model.RentalGoods;


@Repository
public class sellerPageDaoImpl implements sellerPageDao {

	@Autowired
	SqlSession sqlSession;
	
	private String namespace = "seller.";

	@Override
	public List<QnADto> getMyQnaList(String id) throws Exception {
		System.out.println(" sellerPageDaoImpl getMyQnaList");
		
		List<QnADto> qnaList = sqlSession.selectList( namespace + "getMyQnaList" ,id);
		
		System.out.println(" sellerPageDaoImpl  qnaList dadada" + qnaList);
		
		return qnaList;
	}

	@Override
	public List<GoodsDto> Rental3(String id) throws Exception {
		System.out.println(" sellerPageDaoImpl SELLERRental3입니다" + id);
		
		List<GoodsDto> sellerRental3 = sqlSession.selectList(namespace + "SRental3" , id);
		System.out.println(" sellerPageDaoImpl sellerRental3 " + sellerRental3);
		
		return sellerRental3;
	}
	
	//판매자 렌탈 디테일 
		@Override
		public GoodsDto GoodsDto(int seq) throws Exception {
			System.out.println(" sellerPageDaoImpl GoodsDto입니다" + seq);
			
			GoodsDto GoodsDto = sqlSession.selectOne(namespace + "GoodsDto", seq);
			
			return GoodsDto;
		}
		

	@Override
	public List<RentalGoods> manageRentalList(String id) throws Exception{
		System.out.println(" sellerPageDaoImpl GoodsDto입니다" + id);
		
		List<RentalGoods> GoodsDto = sqlSession.selectList(namespace + "lentmanage" , id);
		System.out.println(" sellerPageDaoImpl GoodsDto " + GoodsDto.toString());
		
		
		
		return GoodsDto;
	}

	@Override
	public List<QnADto> getBbsPagingList(BbsParam param) throws Exception {
		System.out.println(" sellerPageDaoImpl getMyQnaList 가져오기");
		List<QnADto> list = sqlSession.selectList(namespace + "getBbsPagingList", param);
		System.out.println(" 판매자페이지 내보내 버리기");
		return list;
	}

	@Override
	public int getBbsCount(BbsParam param) throws Exception {
		int num = 0;
		System.out.println(" sellerPageDaoImpl getMyQnaList 카운트 받아오기");
		num = sqlSession.selectOne(namespace + "getBbsCount", param); 
		System.out.println("판매자페이지 카운트 내보내 버리기");
		return num;
	}
	
	
	
	
	
}
