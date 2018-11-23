package com.controller.store;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.Member;
import com.all.model.Partner;
import com.all.model.Store;
import com.service.partner.PartnerService;
import com.service.store.StoreService;

@Controller
public class StoreController {

	@Autowired
	private StoreService service;
	
	@RequestMapping(value="/storePage", method=RequestMethod.GET)
	public String PartnerPageView(Model model, HttpServletRequest req ,@RequestParam("store_code") String store_code) {
		System.out.println("파트너 페이지 이동 여기서 데이터가 있다면 ");
		
		Store store = new Store();
		store.setStore_code(store_code);
		
		store = service.selectStore(store);
		
		model.addAttribute("store",store);
		
		
		/*
		Member loginMember = (Member) req.getSession().getAttribute("User");
		
		 model.addAttribute("loginMember" , loginMember);
		
		
		model.addAttribute("store_title", "누나홀닭");
		model.addAttribute("store_address", "종로구 관철동 43-5");
		
		*/
		
		
		
		return "store/storerPageForm";//가게정보 뷰 페이지
	}
	
	
	/*
	@RequestMapping(value="/storePage", method=RequestMethod.POST)
	public String selectOne(Model model, @RequestParam("partner_id") String id) {
		
		Partner partner = new Partner();
		partner.setPartner_id(id);;
		
		model.addAttribute("partnerPage", service.partnerPage(partner));		
		return "store/storePageForm";
	}
	*/
	
	@RequestMapping(value="/storeTest")
	public String test () {
		
		return "/store/storeRegistForm";
	}

	
	
}
