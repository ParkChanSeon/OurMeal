package com.controller.main;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.all.model.Star_bulletin;
import com.all.model.StoreReviewCount;
import com.service.store.StoreReviewCountService;
import com.service.store.StoreService;

@RestController
public class MainController {

	@Autowired
	private StoreReviewCountService service;
	
	@Autowired
	private StoreService storeService;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public void main(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		System.out.println("Rest 컨트롤러 이용");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/main.jsp");
		dispatcher.forward(request, response);	
	}
		
	/*@RequestMapping(value="/storecode", method=RequestMethod.POST)
	public void storeCodeReview(HttpServletRequest request, Model model) throws IOException, ServletException {
		
		String store_code = request.getParameter("code");
		String store_count = request.getParameter("count");
		
		StoreReviewCount reviewCount = new StoreReviewCount();
		
		reviewCount.setStore_code(store_code);
		reviewCount.setStore_count(store_count);
	
		HashMap<String, Object> map = null;
		service.storeCodeReview(map);
	}*/
		
		
		
	
		
		// 스토어 코드, 리뷰갯수
		
		//1. 모델 변수로 스토어 코드, 리뷰갯수
		
		//2. 리뷰개수 비교해서 많은 6개를 뽑아
		
		//3. store 정보 6개를 
		
		
	
			
		

}
