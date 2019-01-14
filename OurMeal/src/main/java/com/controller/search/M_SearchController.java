package com.controller.search;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.all.model.Star_bulletin;
import com.all.model.Store;
import com.google.gson.Gson;
import com.service.store.StoreReviewService;
import com.service.store.StoreService;

@RestController
public class M_SearchController {
	
	@Autowired
	StoreService service;
	@Autowired
	StoreReviewService reviewService;
	
	@RequestMapping(value="/m/search", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String searchResult(String search) {
		System.out.println("검색 조회 시작");
		System.out.println("검색어 : " + search);
		
		
		if(search.trim().length()>0) {
			HashMap<String, Object> map = new HashMap<>() ;
			
			map.put("value", search);
			map.put("allergy",0);
			

			List<Store> search_result_list = service.search(map);
			if(search_result_list!=null) {
				ArrayList<Store> storeList = new ArrayList();
				
				for(Store store : search_result_list) {
					
					Star_bulletin review = new Star_bulletin();
					review.setStore_code(store.getStore_code());
					
					int recordCount = reviewService.reviewCount(review);
					store.setStore_reviewCount(recordCount);
					storeList.add(store);
				}
				
				Gson gson = new Gson();
				
				//검색 조회 끝
				return gson.toJson(storeList);				
			}else {
				return null;
			}
	
		}else {
			return null;
		}
 
	}
}
