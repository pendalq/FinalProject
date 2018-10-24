package kh.com.a.service;

import kh.com.a.model.MemberDto;

public interface MemberService {
	
	public boolean addMember(MemberDto mem) throws Exception;
	
	public MemberDto login(MemberDto mem) throws Exception;

	public int checkID(MemberDto mem) throws Exception;
	
	public MemberDto getMemberInfo(String id) throws Exception;

}
