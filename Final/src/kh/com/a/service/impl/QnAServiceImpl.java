package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.NoticeDao;
import kh.com.a.dao.QnADao;
import kh.com.a.model.BbsParam;
import kh.com.a.model.QnADto;
import kh.com.a.service.QnAService;

@Service
public class QnAServiceImpl implements QnAService {

	@Autowired
	QnADao QnAdao;

	@Override
	public List<QnADto> getBbsList() throws Exception {
		return QnAdao.getBbsList();
	}

	@Override
	public List<QnADto> getBbsPagingList(BbsParam param) throws Exception {
		return QnAdao.getBbsPagingList(param);
	}

	@Override
	public int getBbsCount(BbsParam param) throws Exception {
		return QnAdao.getBbsCount(param);
	}

	// 리스트 끝
	// write , update ,delete , get , readcount ,reply
	@Override
	public boolean writeBbs(QnADto qna) throws Exception {
		return QnAdao.writeBbs(qna);
	}

	@Override
	public void updateBbs(QnADto qna) throws Exception {
		QnAdao.updateBbs(qna);

	}

	@Override
	public void deleteBbs(int seq) throws Exception {
		QnAdao.deleteBbs(seq);

	}

	@Override
	public QnADto getBbs(int seq) throws Exception {
		return QnAdao.getBbs(seq);
	}

	@Override
	public boolean readCount(int seq) throws Exception {

		return QnAdao.readCount(seq);
	}

	@Override
	public void reply(QnADto qna) throws Exception {
		QnAdao.replyBbsUpdate(qna);
		QnAdao.replyBbsInsert(qna);

	}

}
