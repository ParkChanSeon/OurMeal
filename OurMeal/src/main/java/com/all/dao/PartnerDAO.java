package com.all.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.all.model.Partner;

@Repository
public class PartnerDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String strNameSpace = "com.jk.model.PartnerMapper";
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int getRecordCount() {
		return sqlSession.selectOne(strNameSpace + ".count");
	}
	
	public List<Partner> selectList() {
		return sqlSession.selectList(strNameSpace + ".allRecord");
	}
	
	public Partner selectOne(Partner partner) {
		return sqlSession.selectOne(strNameSpace + ".oneRecord", partner);
	}
	
	public int insert(Partner partner) {
		return sqlSession.insert(strNameSpace + ".insert", partner);
	}
	
	public int deleteOne(Partner partner) {
		return sqlSession.delete(strNameSpace + ".deleteOne", partner);
	}

}
