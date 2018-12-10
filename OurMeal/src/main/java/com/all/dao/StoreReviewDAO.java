package com.all.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.all.model.Star_bulletin;

@Repository
public class StoreReviewDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String strNameSpace = "StoreReviewMapper";
	
	// 리뷰 쓰기
	public void writeReview(Star_bulletin review) {
		sqlSession.insert(strNameSpace+".writeReview", review);
		
	}
	
	// 리뷰 목록 불러오기
	public List<Star_bulletin> allReview(HashMap<String, Object> map) {
		return sqlSession.selectList(strNameSpace+".allReview", map);
	}
	
	// 게시글 카운트
	public int reviewCount(Star_bulletin review) {
		return sqlSession.selectOne(strNameSpace+".reviewCount", review);
	}
	
	
}
