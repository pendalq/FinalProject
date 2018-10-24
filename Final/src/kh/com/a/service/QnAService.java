package kh.com.a.service;

import java.util.List;

import kh.com.a.model.BbsParam;
import kh.com.a.model.QnADto;

public interface QnAService {

	//QnAlist 처리
	
	public List<QnADto> getBbsList() throws Exception;
	
	public int getBbsCount(BbsParam param) throws Exception;
	
	public List<QnADto> getBbsPagingList(BbsParam param) throws Exception;

	
	//QnAlist 처리 끝
	
	//QnAwrite 처리 
	public boolean writeBbs(QnADto qna) throws Exception;
	//QnAwrite 처리 끝
	
	//QnAupdate 처리 
	public void updateBbs(QnADto qna)throws Exception;
	//QnAupdate 처리  끝
	
	//QnAdelete 처리
	public void deleteBbs(int seq) throws Exception;
	//QnAdelete 처리 끝
	
	//QnAdetail list 처리
	public QnADto getBbs(int seq) throws Exception;
	//QnAdetail list 처리 끝

	//조회수 , reply
	boolean readCount(int seq) throws Exception;
	
	public void reply(QnADto qna) throws Exception;
	

}
