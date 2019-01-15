package com.controller.store;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.all.model.Food_menu;
import com.google.gson.Gson;
import com.service.store.MenuService;

@RestController
public class M_StoreMenuController {

	@Autowired
	private MenuService menuService;
	
	@RequestMapping(value="/m/menuInfo", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String menuInfo(String id, String store_code) {
		System.out.println("메뉴 정보 조회 시작");
		System.out.println(id);
		System.out.println(store_code);
		
		//알러지 코드 저장
		HashMap<String, String> allergy = new HashMap<>();
		allergy.put("3", "메밀");
		allergy.put("4", "밀");
		allergy.put("5", "대두");
		allergy.put("6", "견과류");
		allergy.put("7", "복숭아");
		allergy.put("8", "토마토");
		allergy.put("9", "돼지고기");
		allergy.put("10", "쇠고기");
		allergy.put("11", "닭고기");
		allergy.put("12", "고등어");
		allergy.put("13", "새우");
		allergy.put("14", "홍합");
		allergy.put("15", "전복");
		allergy.put("16", "굴");
		allergy.put("17", "조개류");
		allergy.put("18", "게");
		allergy.put("19", "오징어");
		allergy.put("20", "계란");
		allergy.put("21", "우유");
		
		Food_menu menu = new Food_menu();
		menu.setStore_code(store_code);
		
		List<Food_menu> menulist = menuService.selectStoreMenu(menu);

		if(menulist!=null) {
			Gson gson = new Gson();
			String[] serach_allergy_data = null;			
			
			for(int i = 0; i<menulist.size(); i++) {
				serach_allergy_data = menulist.get(i).getFm_allergy().split(",");
				
				String allergy_result = "";
				for(int j = 0; j<serach_allergy_data.length; j++) {
					allergy_result += allergy.get(serach_allergy_data[j])+ " ";					
				}				
				menulist.get(i).setFm_allergy(allergy_result);
			}
			
			//리스트 목록에 알러지 정보가 잘 들어갔는지 확인
			/*
			for (Food_menu food_menu : menulist) {
				System.out.println(food_menu.getFm_allergy());
			}
			*/
			
			//메뉴 정보 가공 완료후 안드로이드 gson으로 전송
			System.out.println("메뉴 갯수 확인 : " + menulist.size());
			return gson.toJson(menulist);
			
		}else {
			return null;
		}
	}
	
}
