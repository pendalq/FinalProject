package kh.com.a.service;

import java.util.List;

import kh.com.a.model.MessageDto;

public interface MessageService {

	public List<MessageDto> getMessageList(String receiveid) throws Exception;
	
	public void writeMessage(MessageDto mdto) throws Exception;
	
	public MessageDto getMessage(int seq) throws Exception;
	
	public List<MessageDto> getSendList(String sendid) throws Exception;
	
	public void rdelMessage(String[] delSeq) throws Exception;
	
	public void sdelMessage(String[] delSeq) throws Exception;
}
