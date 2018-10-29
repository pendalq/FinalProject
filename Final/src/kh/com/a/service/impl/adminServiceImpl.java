package kh.com.a.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.adminDao;
import kh.com.a.model.adminDto;
import kh.com.a.service.adminService;

@Service
public class adminServiceImpl implements adminService {

	@Autowired
	adminDao adminDao;

	@Override
	public void updateMemauth(adminDto dto) throws Exception {
		adminDao.updateMemauth(dto);
		
	}
}
