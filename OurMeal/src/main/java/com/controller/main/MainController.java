package com.controller.main;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.all.model.MainView;
import com.all.model.Star_bulletin;
import com.all.model.StoreReviewCount;
import com.google.gson.Gson;
import com.service.member.MemberService;
import com.service.store.StoreReviewCountService;
import com.service.store.StoreService;

@RestController
public class MainController {

	@Autowired
	private MemberService mainservice;
	
	@Autowired
	private StoreService storeService;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public void main(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		System.out.println("Rest 컨트롤러 이용");

        //[ SCORE = 평균 평가 점수 | BULLETIN = 댓글 수 | NEWEST = 최근 등록일 | RANDOM = 랜덤 ]
		String [] data_check = { "SCORE", "BULLETIN", "NEWEST", "RANDOM"};				
		List<MainView> mainScore = mainservice.mainView(data_check[0]);		
		List<MainView> mainBulletin = mainservice.mainView(data_check[1]);		
		List<MainView> mainNewest = mainservice.mainView(data_check[2]);		
		List<MainView> mainList = mainservice.mainView(data_check[3]);
				
		request.setAttribute("mainScore", mainScore);
		request.setAttribute("mainBulletin", mainBulletin);
		request.setAttribute("mainNewest", mainNewest);
		request.setAttribute("mainList", mainList);
		
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
		
		
	
	
	@RequestMapping(value="/m_main", method=RequestMethod.GET,produces="text/plain;charset=UTF-8")
	public String m_main(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		System.out.println("Rest 컨트롤러 이용");

        //[ SCORE = 평균 평가 점수 | BULLETIN = 댓글 수 | NEWEST = 최근 등록일 | RANDOM = 랜덤 ]
		String [] data_check = { "SCORE", "BULLETIN", "NEWEST", "RANDOM"};				
		List<MainView> mainScore = mainservice.mainView(data_check[0]);		
		List<MainView> mainBulletin = mainservice.mainView(data_check[1]);		
		List<MainView> mainNewest = mainservice.mainView(data_check[2]);		
		List<MainView> mainList = mainservice.mainView(data_check[3]);
				
		System.out.println("mainScore size = "+mainScore.size());
		System.out.println("mainBulletin size = "+mainBulletin.size());
		System.out.println("mainNewest size = "+mainNewest.size());
		System.out.println("mainList size = "+mainList.size());
		
		
		
		
		Gson gson = new Gson();	
		
		
		
		HashMap <String,Object> returnMap = new HashMap<>();
		
		returnMap.put("mainScore", mainScore);
		returnMap.put("mainBulletin", mainBulletin);
		returnMap.put("mainNewest", mainNewest);
		// returnMap.put("mainList", mainList);
		
		
		String strJson = gson.toJson(returnMap);
		
		return strJson;
	}
	
			
		

}
