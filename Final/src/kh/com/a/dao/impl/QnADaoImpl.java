package kh.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.QnADao;
import kh.com.a.model.BbsParam;
import kh.com.a.model.QnADto;

@Repository
public class QnADaoImpl implements QnADao {
	
	
	@Autowired
	SqlSession sqlSession;

	private String namespace = "QnA.";
	
	@Override
	public List<QnADto> getBbsList() throws Exception {
		List<QnADto> list = sqlSession.selectList(namespace + "getBbsList");		
		return list;
	}

	@Override
	public List<QnADto> getBbsPagingList(BbsParam param) throws Exception {
		List<QnADto> list = sqlSession.selectList(namespace + "getBbsPagingList", param);
		return list;
	}

	@Override
	public int getBbsCount(BbsParam param) throws Exception {
		int num = 0;
		num = sqlSession.selectOne(namespace + "getBbsCount", param); 
		return num;
	}
	// 리스트 끝

	@Override
	public boolean writeBbs(QnADto qna) throws Exception {
		sqlSession.insert(namespace+"writeBbs",qna);		
		return true;
	}

	@Override
	public void updateBbs(QnADto qna) throws Exception {
		sqlSession.update(namespace+"updateBbs",qna);
		
	}

	@Override
	public void deleteBbs(int seq) throws Exception {
		sqlSession.update(namespace+"deleteBbs", seq);
		
	}

	@Override
	public QnADto getBbs(int seq) throws Exception {
		return sqlSession.selectOne(namespace+"getBbs", seq);
	}


	@Override
	public void replyBbsUpdate(QnADto qna) throws Exception {
		sqlSession.update(namespace+"replyBbsUpdate", qna);
		
		
	}

	@Override
	public void replyBbsInsert(QnADto qna) throws Exception {
		sqlSession.insert(namespace+"replyBbsInsert", qna);

	}
	
	
	

}
