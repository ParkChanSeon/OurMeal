
package com.controller.search;

import com.all.model.*;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SearchController {

	
	
	
	@RequestMapping(value = "/search")
	public String searchResult(HttpServletRequest req) {

		ArrayList<Test> test = new ArrayList<>();
		
		  test.add(new Test(1,"중국집","가게정보 안알려","서울특별시 중구 태평로1가"));
		 
		  test.add(new Test(2,"일식집","안알려줌","종로구 관철동 43-5"));
		  
		  test.add(new Test(3,"미국집","가게정보 비밀","종로구 관철동 43-4"));
		  
		  test.add(new Test(4,"우리집","비 밀","학의로 46"));
		 

		
		
		/*ArrayList<String> store_title = new ArrayList<>();
		ArrayList<String> store_info = new ArrayList<>();
		ArrayList<String> store_loc = new ArrayList<>();

		store_title.add("중국집");
		store_info.add("가게정보");
		store_loc.add("학의로 46");
		
		store_title.add("일식집");
		store_info.add("가게정보 비밀");
		store_loc.add("종로구 관철동 43-6");*/

	

		/*req.setAttribute("store_title", store_title);
		req.setAttribute("store_info", store_info);
		req.setAttribute("store_loc", store_loc);
		*/
		  req.setAttribute("test", test);
		
		return "/search/searchForm";
	}
}
