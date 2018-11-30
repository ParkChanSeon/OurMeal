package com.all.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String strNameSpace = "com.jk.model.AdminMapper";

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 관리자로그인
	/*
	public Admin adminLogin(Admin admin) {
		return sqlSession.selectOne(strNameSpace + ".adminLogin", admin);
	}
	*/
	
	//관리자 로그인 체크
	/*
	public Admin adminLoginCheck(Admin admin) {
		return sqlSession.selectOne(strNameSpace + ".adminLoginCheck", admin);
	}
	*/
	
	public List<Object> partnerList(){
		return sqlSession.selectList(strNameSpace + ".partnerList");
	}
	
	public int memberConfirm(String id){
		return sqlSession.update(strNameSpace + ".memberConfirm", id);
	}	

}
