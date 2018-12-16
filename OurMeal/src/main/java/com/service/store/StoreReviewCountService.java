package com.service.store;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.dao.StoreReviewCountDAO;
import com.all.model.Star_bulletin;
import com.all.model.StoreReviewCount;

@Service
public class StoreReviewCountService {

	@Autowired
	private StoreReviewCountDAO dao;
	
	// 가게별로 게시글 가져오기
	public List<Star_bulletin> storeCodeReview (HashMap<String, Object> map) {
		return this.dao.storeCodeReview(map);
	}
	
	// 가게별로 게시글 갯수 구하기
	public List<Star_bulletin> storeStarBulletinReview (HashMap<String, Object> map) {
		return this.dao.storeStarBulletinReview(map);
	}
}
