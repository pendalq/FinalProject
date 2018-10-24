package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.BbsParam;
import kh.com.a.model.NoticeDTO;


public interface NoticeDao {

	// 공지 리스트
	public List<NoticeDTO> getNoticelist() throws Exception;

	public List<NoticeDTO> getBbsPagingList(BbsParam param) throws Exception;

	public int getBbsCount(BbsParam param) throws Exception;

	// view list
	public void readCount(int seq) throws Exception;

	public NoticeDTO getviewlist(int seq) throws Exception;
	// view end

	// update
	public void updateNotice(NoticeDTO dto) throws Exception;

	// update end
	// write
	public void writelist(NoticeDTO dto) throws Exception;

	// write end
	// delete
	public void deletelist(int seq) throws Exception;
	// delete end
}
