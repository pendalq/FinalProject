package kh.com.a.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public MessageDto getMessage(int seq) throws Exception {
		return sqlSession.selectOne(namespace + "getMessage", seq);
	}

	@Override
	public List<MessageDto> getSendList(String sendid) throws Exception {
		List<MessageDto> slist = sqlSession.selectList(namespace + "getSendList", sendid);
		return slist;
	}

	@Override
	public void rdelMessage(String[] delSeq) throws Exception {
		List<String> delSeqlist = new ArrayList<>();
		for(String item:delSeq) {
			delSeqlist.add(item);
		}
		Map<String, List<String>> delSeqMap = new HashMap<>();
		
		delSeqMap.put("delSeq", delSeqlist);
		
		sqlSession.update(namespace + "rdelMessage", delSeqMap);
	}

	@Override
	public void sdelMessage(String[] delSeq) throws Exception {
		List<String> delSeqlist = new ArrayList<>();
		for(String item:delSeq) {
			delSeqlist.add(item);
		}
		Map<String, List<String>> delSeqMap = new HashMap<>();
		
		delSeqMap.put("delSeq", delSeqlist);
		
		sqlSession.update(namespace + "sdelMessage", delSeqMap);
	}
	
	
}
