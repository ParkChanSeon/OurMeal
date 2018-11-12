package com.all.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.all.model.Admin;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String strNameSpace = "com.jk.model.AdminMapper";

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 관리자로그인
	public Admin adminLogin(Admin admin) {
		return sqlSession.selectOne(strNameSpace + ".adminLogin", admin);
	}

}
