package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.MessageDto;

public interface MessageDao {

	public List<MessageDto> getMessageList(String receiveid) throws Exception;

	public void writeMessage(MessageDto mdto) throws Exception;
}
