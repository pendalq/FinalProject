package kh.com.a.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.MemberDao;
import kh.com.a.model.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSession sqlSession;
	
	private String namespace = "Member.";
	
	@Override
	public boolean addMember(MemberDto mem) throws Exception {
				
		int n = sqlSession.insert(namespace + "addMember", mem); 
		
		System.out.println("addMember n = " + n );
		return n>0?true:false;
	}
	
	@Override
	public MemberDto login(MemberDto mem) throws Exception {

		return sqlSession.selectOne(namespace + "login" , mem);
	}

	@Override
 
	public int checkID(MemberDto mem) {	
		System.out.println("MemberDaoImpl num");
		
		int num = sqlSession.selectOne(namespace + "checkID", mem);
		
		System.out.println("MemberDaoImpl num = " + num);
		
		return num;
	}

	@Override
	public MemberDto getmemDto(String id) throws Exception {
		
		
		System.out.println("MemberDaoImpl mem = " + id);
		
		MemberDto MemberDto = sqlSession.selectOne(namespace +"getmemDto", id);
		
		System.out.println("MemberDaoImpl MemberDto = " + MemberDto);
		
		return MemberDto;
	}

	@Override
	public MemberDto updatememDto(MemberDto mem) throws Exception {
		System.out.println("MemberDaoImpl MemberDto = " + mem);
		
		MemberDto updatememDto = sqlSession.selectOne(namespace + "udateMem" ,mem);
		
		return updatememDto;
	}
	
	
	
	
	
}
