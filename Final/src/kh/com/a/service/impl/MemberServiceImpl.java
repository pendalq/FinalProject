package kh.com.a.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.MemberDao;
import kh.com.a.model.MemberDto;
import kh.com.a.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao memberDao;
	
	@Override
	public boolean addMember(MemberDto mem) throws Exception {
		
		 
		System.out.println("addMember MemberServiceImpl = " + mem);
		
		return memberDao.addMember(mem);
	}

	
	@Override
	public MemberDto login(MemberDto mem) throws Exception {
		return memberDao.login(mem);
	}


	@Override
	public int checkID(MemberDto mem) throws Exception {
	  System.out.println(mem);
	  int i = memberDao.checkID(mem);
	  System.out.println(i + "i는");
		return memberDao.checkID(mem);
	}


	@Override
	public MemberDto getMemberInfo(String id) throws Exception {
		System.out.println(id);
		return memberDao.getMemberInfo(id);
	}
	
	
}
