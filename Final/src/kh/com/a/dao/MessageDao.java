package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.MessageDto;

public interface MessageDao {

	public List<MessageDto> getMessageList(String receiveid) throws Exception;

	public void writeMessage(MessageDto mdto) throws Exception;
	
	public MessageDto getMessage(int seq) throws Exception;
	
	public List<MessageDto> getSendList(String sendid) throws Exception;
	
	public void rdelMessage(String[] delSeq) throws Exception;
	
	public void sdelMessage(String[] delSeq) throws Exception;
}
