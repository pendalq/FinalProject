package kh.com.a.service;

import java.util.List;

import kh.com.a.model.BbsParam;
import kh.com.a.model.NoticeDTO;



public interface NoitceService {

	//list
		//공지 리스트
		//int getNoticeCount(NoticePg noticePg);
		public List<NoticeDTO> getNoticelist() throws Exception;
		
		public int getBbsCount(BbsParam param) throws Exception;
		
		public List<NoticeDTO> getBbsPagingList(BbsParam param) throws Exception;

	//list end
	
	//view 
		 //view 로 이동했을 때 readCount + 1
		public void readCount(int seq) throws Exception;
	     //해당 게시글에 대한 자료 DB 에서 뽑아 오기
		public NoticeDTO getviewlist(int seq) throws Exception;
	//view end

		//update
		public void updateNotice(NoticeDTO dto) throws Exception;
		//update end
		//write
		public void writelist(NoticeDTO dto) throws Exception ;
		//write end
		//delete 
		public void deletelist(int seq) throws Exception;
		//delete end
	 
}
