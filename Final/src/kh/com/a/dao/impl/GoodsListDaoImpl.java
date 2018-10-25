package kh.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.GoodsListDao;
import kh.com.a.model.GoodsDto;
import kh.com.a.model.GoodsParam;

@Repository
public class GoodsListDaoImpl implements GoodsListDao {

	@Autowired
	SqlSession sqlSession;

	private String namespace = "goodsList.";

	@Override
	// 총 게시물 출력 ( 사용 안함 )
	public List<GoodsDto> getGoodsAllList() throws Exception {

		List<GoodsDto> list = sqlSession.selectList(namespace + "getGoodsAllList");

		for (int i = 0; i < list.size(); i++) {
			System.out.println("DAO  getGoodsAllList[" + i + "]:" + list.get(i).toString());
		}

		return list;
	}

	@Override
	// 요청 된 게시물 15개 출
	public List<GoodsDto> getGoodsPagingList(GoodsParam param) throws Exception {

		// 다오 파라메타 확인 
		System.out.println("DAO GoodParam : " + param.toString());
		
		List<GoodsDto> list = sqlSession.selectList(namespace + "getGoodsPagingList", param);

		for (int i = 0; i < list.size(); i++) {
			System.out.println("DAO  getGoodsPagingList[" + i + "]:" + list.get(i).toString());
		}

		return list;
	}

	@Override
	// 요청 된 게시물 갯수 출력 
	public int getGoodsCount(GoodsParam param) throws Exception {
		
		int num = 0;
		num = sqlSession.selectOne(namespace + "getGoodsCount", param); 
		
		System.out.println("DAO  getGoodsCount : " + num);
		
		return num;
	}

}
