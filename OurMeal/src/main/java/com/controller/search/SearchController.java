

package com.controller.search;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class SearchController {
	
	
	
	
	
	
	// 테스트용 
	// 임시로 만들어놓
	@RequestMapping(value="/map" )
	public String searchResult() {
		
		
		
		
		
		
		return "/search/searchResultForm";
	}
}
