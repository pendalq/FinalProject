package kh.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.NoticeDao;
import kh.com.a.model.BbsParam;
import kh.com.a.model.NoticeDTO;



@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	SqlSession sqlSession;

	private String namespace = "Notice.";
//list
	@Override
	public List<NoticeDTO> getNoticelist() throws Exception{
		System.out.println(getClass().getSimpleName() + "list()");
		
		List<NoticeDTO> list=  sqlSession.selectList(namespace+"list");
		 return list;
	}
	
	@Override
	public List<NoticeDTO> getBbsPagingList(BbsParam param) throws Exception {
		List<NoticeDTO> list = sqlSession.selectList(namespace + "getBbsPagingList", param);
		return list;
	}

	@Override
	public int getBbsCount(BbsParam param) throws Exception {
		int num = 0;
		num = sqlSession.selectOne(namespace + "getBbsCount", param); 
		return num;
	}
//list end
	
//view
	@Override
	public void readCount(int seq) throws Exception {
		System.out.println(getClass().getSimpleName() + "readCount하는 것");
		sqlSession.update(namespace+"readCount",seq);
		
	}

	@Override
	public NoticeDTO getviewlist(int seq) throws Exception {
		System.out.println(getClass().getSimpleName() + "view");
		return sqlSession.selectOne(namespace + "getviewlist", seq);
	}
//view end

	//update 
	@Override
	public void updateNotice(NoticeDTO dto) throws Exception {
		sqlSession.update(namespace + "updateNotice", dto);
		
	}
	//update end
	//write 
	@Override
	public void writelist(NoticeDTO dto) {
	
		sqlSession.insert(namespace + "writelist", dto);
		
	}
	//write end
	//delete

	@Override
	public void deletelist(int seq) {
		sqlSession.update(namespace + "deletelist", seq);
		
	}
	
	//delete end
	

}
