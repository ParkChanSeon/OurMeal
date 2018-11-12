package com.all.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.all.model.*;

import java.util.*;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String strNameSpace = "com.jk.model.MemberMapper";
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int getRecordCount() {
		return sqlSession.selectOne(strNameSpace + ".count");
	}
	
	public List<Member> selectList() {
		return sqlSession.selectList(strNameSpace + ".allRecord");
	}
	
	//마이페이지
	public Member myPage(Member member) {
		return sqlSession.selectOne(strNameSpace + ".myPage", member);
	}
	
	//회원가입
	public int regist(Member member) {
		return sqlSession.insert(strNameSpace + ".regist", member);
	}
	
	public int deleteOne(Member member) {
		return sqlSession.delete(strNameSpace + ".deleteOne", member);
	}
	
}











