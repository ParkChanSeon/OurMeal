package com.service.store;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.dao.StoreReviewDAO;
import com.all.model.Star_bulletin;

@Service
public class StoreReviewService {

	@Autowired
	private StoreReviewDAO dao;
	
	public void writeReview(Star_bulletin review) {
		
		dao.writeReview(review);
	}
	
}
