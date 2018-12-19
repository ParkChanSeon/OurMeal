
package com.controller.search;

import com.all.model.*;
import com.service.store.StoreReviewService;
import com.service.store.StoreService;
import com.util.file.FileVo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SearchController {

	@Autowired
	StoreService service;
	@Autowired
	StoreReviewService reviewService;
	
	
	
	@RequestMapping(value = "/search", method=RequestMethod.GET)
	public String searchResult(Model model, HttpServletRequest req,@RequestParam("value") String value) {
		
		HashMap<String, Object> map = new HashMap<>() ;
		
		map.put("value", value);
		map.put("allergy",0);
		
		
		
		List<Store> testList = service.search(map);
		
		/*List<Store> storeList = new ArrayList();
		
		for(Store store : testList) {
			
			Star_bulletin review = new Star_bulletin();
			review.setStore_code(store.getStore_code());
			
			int recordCount = reviewService.reviewCount(review);
			store.setStore_reviewCount(recordCount);
			
			HashMap<String, Object> map_2 = new HashMap<>();
			
			map_2.put("store_code", store.getStore_code());
			
			// 별점 총점/평균을 구하기 위해 점수
			List<Star_bulletin> score_list = reviewService.scoreList(map_2);
			
			double score = 0;
			int i = 0;
			for(Star_bulletin sb : score_list) {
				
				score +=Double.parseDouble(sb.getSb_score());
				
			}
			
			double avg  = (double) score/(double)recordCount;
			
			
			
				String starAvg = String.format("%.1f", avg);
				store.setScore_avg(starAvg);
				storeList.add(store);
		}
		
		
		
		model.addAttribute("storeList",storeList);
		*/
		
		model.addAttribute("storeList",testList);
		
		model.addAttribute("value",value);
		
		return "search/searchForm";
	}
	
	
	
}
