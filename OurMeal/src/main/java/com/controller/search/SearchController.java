

package com.controller.search;

import com.all.model.*;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class SearchController {
	
	
	
	
	
	
	// 테스트용 
	// 임시로 만들어놓
	@RequestMapping(value="/map" )
	public String searchResult(HttpServletRequest req) {
		
		ArrayList <Test> test = new ArrayList<>();
			
			
		test.add(new Test(1,"중국집","가게정보 안알랴쥼...","종로구 관철동 43-6"));
	
	/*	test.add(new Test(2,"일식집","가게정보 안알랴쥼...","종로구 관철동 43-5"));
		
		test.add(new Test(3,"일식집","가게정보 안알랴쥼...","종로구 관철동 43-4"));
		
		test.add(new Test(4,"일식집","가게정보 안알랴쥼...","종로구 관철동 16-10"));*/
		
		
		req.setAttribute("test",test);
		
		
	
		
		
		return "/search/searchResultForm";
	}
}
