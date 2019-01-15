package com.controller.main;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.all.model.MainView;
import com.google.gson.Gson;
import com.service.member.MemberService;

@RestController
public class M_MainController {

	@Autowired MemberService mainservice;
	
	@RequestMapping(value="/m/m_main", method=RequestMethod.GET,produces="text/plain;charset=UTF-8")
	public String m_main(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		System.out.println("안드로이드 메인 데이타 가져오기 시작.");

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
		
		System.out.println("Storecode 체크 1 " + mainScore.get(0).getStore_code());
		System.out.println("Storecode 체크 2 " + mainScore.get(1).getStore_code());
		Gson gson = new Gson();	

		HashMap <String,List<MainView>> returnMap = new HashMap<>();
		
		returnMap.put("mainScore", (List<MainView>) mainScore);
		returnMap.put("mainBulletin", (List<MainView>) mainBulletin);
		returnMap.put("mainNewest", (List<MainView>) mainNewest);
		// returnMap.put("mainList", mainList);	
		
		String strJson = gson.toJson(returnMap);
		
		return strJson;
	}
}
