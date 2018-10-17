package kh.com.a.dao;

import kh.com.a.model.MemberDto;

public interface MemberDao {


	boolean addMember(MemberDto mem ) throws Exception;
	
	public MemberDto login(MemberDto mem) throws Exception;

	public int checkID(MemberDto mem);
}
