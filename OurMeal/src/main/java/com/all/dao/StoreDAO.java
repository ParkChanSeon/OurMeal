package com.all.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.all.model.JoinRequest;
import com.all.model.Member;
import com.all.model.Store;

@Repository
public class StoreDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String strNameSpace = "com.jk.model.StoreMapper";
	
	// 파트너로 멤버 타입 변경시 가게 페이지를 생성해 준다
	public int storeRegist(Member member) {
	return sqlSession.insert(strNameSpace + ".storeRegist", member);
	}

	// 가게 정보 수정
	
	public int storeInfo(Store store) {
		
		return sqlSession.update(strNameSpace + ".storeInfo", store);
	}
	
	public Store selectStore(Member member) {
		return sqlSession.selectOne(strNameSpace + ".selectStore", member);
	}
	
	

}
