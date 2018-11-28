package com.find.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.all.model.*;

@Repository
public class FindDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String strNameSpace = "com.jk.model.MemberFindMapper";

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
		
	// 아이디 찾기
	public Member findId(Member member) {
		return sqlSession.selectOne(strNameSpace + ".findId", member);
	}
	
	// 비밀번호 찾기
	public Member findPw(Member member) {
		return sqlSession.selectOne(strNameSpace + ".findPw", member);
	}
}
