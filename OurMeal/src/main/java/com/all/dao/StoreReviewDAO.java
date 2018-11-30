package com.all.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.all.model.Star_bulletin;

@Repository
public class StoreReviewDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String strNameSpace = "StoreReviewMapper";
	
	
	public void writeReview(Star_bulletin review) {
		sqlSession.insert(strNameSpace+".writeReview", review);
		
	}
	
	
}
