package kh.com.a.dao;

import kh.com.a.model.MemberDto;

public interface MemberDao {


	boolean addMember(MemberDto mem ) throws Exception;
	
	MemberDto login(MemberDto mem) throws Exception;

	int checkID(MemberDto mem) throws Exception;
	
	MemberDto getMemberInfo(String id) throws Exception;
}
