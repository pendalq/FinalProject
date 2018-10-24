package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.NoticeDao;
import kh.com.a.model.BbsParam;
import kh.com.a.model.NoticeDTO;
import kh.com.a.service.NoitceService;

@Service
public class NoticeServiceImpl implements NoitceService {

	@Autowired
	NoticeDao NoticeDao;

//list
	@Override
	public List<NoticeDTO> getNoticelist() throws Exception {

		return NoticeDao.getNoticelist();
	}
	
	
	@Override
	public List<NoticeDTO> getBbsPagingList(BbsParam param) throws Exception {
		return NoticeDao.getBbsPagingList(param);
	}

	@Override
	public int getBbsCount(BbsParam param) throws Exception {
		return NoticeDao.getBbsCount(param);
	}
//list end

//view
	@Override
	public void readCount(int seq) throws Exception {

		NoticeDao.readCount(seq);

	}

	@Override
	public NoticeDTO getviewlist(int seq)  throws Exception{

		return NoticeDao.getviewlist(seq);
	}
//view end

	// update
	@Override
	public void updateNotice(NoticeDTO dto) throws Exception {
		NoticeDao.updateNotice(dto);

	}

	// update end
//write 
	@Override
	public void writelist(NoticeDTO dto) throws Exception {
		NoticeDao.writelist(dto);

	}
//write end
//delete

	@Override
	public void deletelist(int seq) throws Exception {
		NoticeDao.deletelist(seq);
		
	}

	// delete end

}
