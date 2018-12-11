package com.controller.store;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.all.model.Food_menu;
import com.all.model.Member;
import com.all.model.Partner;
import com.all.model.Star_bulletin;
import com.all.model.Store;
import com.service.partner.PartnerService;
 import com.service.store.MenuService;
import com.service.store.StoreReviewService;
import com.service.store.StoreService;

@Controller
public class StoreController {

	@Autowired
	private StoreService service;
	@Autowired
	private MenuService menuService;
	@Autowired
	private StoreReviewService reviewService;
	
	@Autowired
	private Store store;
	
	@Autowired
	private Food_menu menu;
	
	
	@RequestMapping(value="/storePage", method=RequestMethod.GET)
	public String PartnerPageView(Model model, HttpServletRequest req ,@RequestParam("store_code") String store_code) {
			
		store.setStore_code(store_code);
		
		store = service.selectStore(store);
		
		menu.setStore_code(req.getParameter("store_code"));
		
		
		// 알러지 불러오기
		
List <Food_menu>menuList = null;
		
		menuList = (List <Food_menu>)menuService.selectStoreMenu(menu);
		
		String [] allergy;
		
		String all = "";
		
		for(int i = 0 ;i < menuList.size(); i++) {
			allergy = menuList.get(i).getFm_allergy().split(",");
			
			for(int j = 0 ; j < allergy.length; j ++) {
				System.out.println(allergy[j]);
				switch(allergy[j]) {
				case "3":
					allergy[j] = "메밀";
					break;
					
				case "4":
					allergy[j] = "밀";
					break;
					
					
				case "5":
					allergy[j] = "대두";
					break;
					
				case "6":
					allergy[j] = "견과류";
					break;
					
					
				case "7":
					allergy[j] = "복숭아";
					break;
					
				case "8":
					allergy[j] = "토마토";
					break;
					
				case "9":
					allergy[j] = "돼지고기";
					break;
					
				case "10":
					allergy[j] = "쇠고기";
					break;
					
				case "11":
					allergy[j] = "닭고기";
					break;
					
				case "12":
					allergy[j] = "고등어";
					break;
					
				case "13":
					allergy[j] = "새우";
					break;
					
				case "14":
					allergy[j] = "홍합";
					break;
					
				case "15":
					allergy[j] = "전복";
					break;
					
				case "16":
					allergy[j] = "굴";
					break;
					
				case "17":
					allergy[j] = "조개류";
					break;
					
				case "18":
					allergy[j] = "게";
					break;
					
				case "19":
					allergy[j] = "오징어";
					break;
					
					
				case "20":
					allergy[j] = "계란";
					break;
					
				case "21":
					allergy[j] = "우유";
					break;
					
				default : allergy[j] = "없음";
				
				}
				
				all += allergy[j]+",";
			}
			
			all = all.substring(0, all.length()-1);
			menuList.get(i).setFm_allergy(all);
			all = "";
			
		}
		
		model.addAttribute("menuList", menuList);
		
		model.addAttribute("store",store);
		
		
		Star_bulletin review = new Star_bulletin();
		review.setStore_code(store_code);
		
		
		int page = 1;
		if (req.getParameter("page") != null) {
			page = Integer.parseInt(req.getParameter("page"));
		}

		// 게시물 5개씩 보이기
		int count = 5;

		HashMap<String, Object> map = new HashMap<>();
		map.put("start",(page - 1) * count);
		map.put("end", count);
		map.put("store_code", store_code);
		
		
		List<Star_bulletin> list  = reviewService.allReview(map);
		
		
		
		
		model.addAttribute("list",list);
		model.addAttribute("size",list.size());
		int recordCount = reviewService.reviewCount(review);
		model.addAttribute("reviewCount", recordCount); // 해당되는 범위의 게시글을 리스트로 받아온다
		
		double score = 0;
		for(Star_bulletin sb : list) {
			score += Double.parseDouble(sb.getSb_score());
			
		}
		System.out.println("총합 : " + score);
		
		double avg  = score/recordCount;
		System.out.println(avg);
		
			String starAvg = String.format("%.1f", avg);
			System.out.println("평점 : "+ starAvg +"점");
		
		
		
		return "store/storerPageForm";//가게정보 뷰 페이지
	}
	
	
	
	
	@RequestMapping(value="/storePage/reviewAdd", method=RequestMethod.POST)
	@ResponseBody
	public Object reviewAdd(@RequestParam Map<String,Object> info, HttpServletRequest req){
			
		Star_bulletin review = new Star_bulletin();
		
		String store_code = (String) info.get("store_code");
		int num = Integer.parseInt((String) info.get("num"));
		
		System.out.println(store_code + "////"+ num);
		
		

		// 게시물 5개씩 보이기
		int count = 5;

		HashMap<String, Object> map = new HashMap<>();
		map.put("start",num);
		map.put("end", count);
		map.put("store_code", store_code);
		
		
		List<Star_bulletin> list  = reviewService.allReview(map);
		
		
		review.setStore_code(store_code);
		
		
		
		
		Map<String, Object> data = new HashMap<String, Object>();
		
		if(list.size() == 5) 
		data.put("code", "ok");
		else 
		data.put("code","no");
		
		data.put("list", list);
		data.put("size", list.size());
		Member loginMember;
		if((req.getSession().getAttribute("User")) != null) {
			loginMember = (Member) req.getSession().getAttribute("User");
			String loginMember_id = loginMember.getMember_id();
			data.put("loginMember", loginMember_id);
		}
		
		
		return data;
	
	}
	
	
}
