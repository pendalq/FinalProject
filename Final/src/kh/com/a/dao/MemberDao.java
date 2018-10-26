package kh.com.a.dao;

import kh.com.a.model.MemberDto;

public interface MemberDao {


	boolean addMember(MemberDto mem ) throws Exception;
	
	MemberDto login(MemberDto mem) throws Exception;

	int checkID(MemberDto mem);

	MemberDto getmemDto(String id) throws Exception;
	
	MemberDto updatememDto(MemberDto mem) throws Exception;
}
