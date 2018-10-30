package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.BbsParam;
import kh.com.a.model.QnADto;

public interface QnADao {

	public List<QnADto> getBbsList() throws Exception;

	public List<QnADto> getBbsPagingList(BbsParam param) throws Exception;

	public int getBbsCount(BbsParam param) throws Exception;
	// 리스트 끝

	public boolean writeBbs(QnADto qna) throws Exception;

	public void updateBbs(QnADto qna) throws Exception;

	public void deleteBbs(int seq) throws Exception;

	public QnADto getBbs(int seq) throws Exception;

	public boolean readCount(int seq) throws Exception;

	public void replyBbsUpdate(QnADto qna) throws Exception;

	public void replyBbsInsert(QnADto qna) throws Exception;
	

}
