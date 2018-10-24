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
	public List<GoodsDto> getGoodsAllList() throws Exception {

		List<GoodsDto> list = sqlSession.selectList(namespace + "getGoodsAllList");

		for (int i = 0; i < list.size(); i++) {
			System.out.println("DAO  getGoodsAllList[" + i + "]:" + list.get(i).toString());
		}

		return list;
	}

	@Override
	public List<GoodsDto> getGoodsPagingList(GoodsParam param) throws Exception {

		System.out.println("DAO GoodParam : " + param.toString());
		List<GoodsDto> list = sqlSession.selectList(namespace + "getGoodsPagingList", param);

		for (int i = 0; i < list.size(); i++) {
			System.out.println("DAO  getGoodsPagingList[" + i + "]:" + list.get(i).toString());
		}

		return list;
	}

	@Override
	public int getGoodsCount(GoodsParam param) throws Exception {
		
		int num = 0;
		num = sqlSession.selectOne(namespace + "getGoodsCount", param); 
		
		System.out.println("DAO  getGoodsCount : " + num);
		
		return num;
	}

}
