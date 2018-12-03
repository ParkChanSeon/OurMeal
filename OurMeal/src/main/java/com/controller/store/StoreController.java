package com.controller.store;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		
		model.addAttribute("menuList", menuService.selectStoreMenu(menu));
		
		model.addAttribute("store",store);
		
		
		Star_bulletin review = new Star_bulletin();
		review.setStore_code(store_code);
		
		List<Star_bulletin> list  = reviewService.allReview(review);
		
		model.addAttribute("list",list);
		

		
		return "store/storerPageForm";//가게정보 뷰 페이지
	}
	
	
	
}
