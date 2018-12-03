package com.service.store;


import java.util.ArrayList;
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
	public List<Star_bulletin> allReview(Star_bulletin review) {
		return dao.allReview(review);
	}
	
}
