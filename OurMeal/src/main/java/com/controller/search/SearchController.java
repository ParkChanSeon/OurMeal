
package com.controller.search;

import com.all.model.*;
import com.service.store.StoreService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SearchController {

	@Autowired
	StoreService service;
	
	
	@RequestMapping(value = "/search", method=RequestMethod.GET)
	public String searchResult(Model model, HttpServletRequest req,@RequestParam("value") String value) {
		
		HashMap<String, Object> map = new HashMap<>() ;
		
		map.put("value", value);
		map.put("allergy",0);
		
		System.out.println("컨트롤러 : "+value);
		
		List<Store> storeList = service.search(map);
		
		
		
		model.addAttribute("storeList",storeList);
		model.addAttribute("value",value);
		
		
		return "search/searchForm";
	}
}
