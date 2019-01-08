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
	
	// 평점
	public List<Star_bulletin> scoreList(HashMap<String, Object> map){
		return sqlSession.selectList(strNameSpace+".scoreList", map);
	}
	
	// 이미지 불러오기 
	public List<Star_bulletin> imageList(HashMap<String, Object> map){
		return sqlSession.selectList(strNameSpace+".imageList", map);
	}
	
	//수정하기위해 해당 리뷰글 불러오기 
	public Star_bulletin reviewModify(Star_bulletin review) {
		return sqlSession.selectOne(strNameSpace+".reviewModify", review);
	}
	
	//리뷰 수정하기
	public void reviewModifyReq(Star_bulletin review) {
		sqlSession.update(strNameSpace+".reviewModifyReq", review);
	}
	
	// 리뷰 삭제하기 
	public void reviewDelete(Star_bulletin review) {
		sqlSession.delete(strNameSpace+".reviewDelete", review);
	}
	
	
	//모바일 리뷰쓰기
	public int m_writeReview(Star_bulletin review) {
		return sqlSession.insert(strNameSpace+".writeReview", review);		
	}
}
