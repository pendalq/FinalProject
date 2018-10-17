package kh.com.a.service;

import java.util.List;

import kh.com.a.model.MessageDto;

public interface MessageService {

	public List<MessageDto> getMessageList(String receiveid) throws Exception;
	
	public void writeMessage(MessageDto mdto) throws Exception;
	
}
