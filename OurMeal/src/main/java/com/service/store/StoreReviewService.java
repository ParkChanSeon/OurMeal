package com.service.store;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.dao.StoreReviewDAO;
import com.all.model.Star_bulletin;

@Service
public class StoreReviewService {

	@Autowired
	private StoreReviewDAO dao;
	
	// 리뷰쓰기
	public void writeReview(Star_bulletin review) {
		
		dao.writeReview(review);
	}
	
	// 리뷰 목록 불러오기 (storePage 에서 사용)
	public List<Star_bulletin> allReview(HashMap<String, Object> map) {
		return dao.allReview(map);
	}
	
	public int reviewCount(Star_bulletin review) {
		return this.dao.reviewCount(review);
	}
	
	public List<Star_bulletin> scoreList(HashMap<String, Object> map){
		return this.dao.scoreList(map);
	}
	
	public List<Star_bulletin> imageList(HashMap<String, Object> map){
		return this.dao.imageList(map);
	}
	
	//수정하기위해 해당 리뷰글 불러오기 
	public Star_bulletin reviewModify(Star_bulletin review) {
		return this.dao.reviewModify(review);
	}
	

	//리뷰 수정하기
	public void reviewModifyReq(Star_bulletin review) {
		this.dao.reviewModifyReq(review);
	}
	
	// 리뷰 삭제하기 
		public void reviewDelete(Star_bulletin review) {
			this.dao.reviewDelete(review);
		}
	
	
}
