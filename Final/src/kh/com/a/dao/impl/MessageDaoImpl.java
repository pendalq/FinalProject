package kh.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.MessageDao;
import kh.com.a.model.MessageDto;

@Repository
public class MessageDaoImpl implements MessageDao {
	
	@Autowired
	SqlSession sqlSession;
	
	private String namespace = "Message.";

	@Override
	public List<MessageDto> getMessageList(String receiveid) throws Exception {
		List<MessageDto> mlist = sqlSession.selectList(namespace + "getMessageList", receiveid);
		return mlist;
	}

	@Override
	public void writeMessage(MessageDto mdto) throws Exception {
		sqlSession.insert(namespace + "writeMessage", mdto);
	}
	
	
}
