package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.MessageDao;
import kh.com.a.model.MessageDto;
import kh.com.a.service.MessageService;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	MessageDao messageDao;

	@Override
	public List<MessageDto> getMessageList(String receiveid) throws Exception {
		return messageDao.getMessageList(receiveid);
	}

	@Override
	public void writeMessage(MessageDto mdto) throws Exception {
		messageDao.writeMessage(mdto);
	}
	
}
