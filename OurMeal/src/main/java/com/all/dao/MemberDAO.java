package com.all.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.all.model.*;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String strNameSpace = "com.jk.model.MemberMapper";

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 회원가입
	public int memberRegist(Member member) {
		return sqlSession.insert(strNameSpace + ".memberRegist", member);
	}

	// 회원로그인
	public Member memberLogin(Member member) {
		return sqlSession.selectOne(strNameSpace + ".memberLogin", member);
	}

	// 마이페이지
	public Member myPage(Member member) {
		return sqlSession.selectOne(strNameSpace + ".myPage", member);
	}
	
	// 회원정보수정
	public int memberUpdate(Member member) {
		return sqlSession.update(strNameSpace + ".memberUpdate", member);
	}

	// 회원탈퇴
	public int memberDelete(Member member) {
		return sqlSession.delete(strNameSpace + ".memberDelete", member);
	}

}
