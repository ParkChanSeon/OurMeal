package com.all.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.all.model.Star_bulletin;

@Repository
public class StoreReviewCountDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String strNameSpace = "StoreReviewMapper";
	
	// 가게 게시글 가져오기
	public List<Star_bulletin> storeCodeReview (HashMap<String, Object> map) {
		return sqlSession.selectList(strNameSpace+".storeCodeReview", map);
	}
	
	// 가게별로 게시글 갯수 구하기
	public List<Star_bulletin> storeStarBulletinReview (HashMap<String, Object> map) {
		return sqlSession.selectList(strNameSpace+".storeStarBulletinReview", map);
	}
}
