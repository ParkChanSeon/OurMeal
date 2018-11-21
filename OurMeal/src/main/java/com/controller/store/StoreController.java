package com.controller.store;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.Partner;
import com.service.partner.PartnerService;

@Controller
public class StoreController {

	@Autowired
	private PartnerService service;
	
	@RequestMapping(value="/storePage", method=RequestMethod.GET)
	public String PartnerPageView(Model model) {
		System.out.println("파트너 페이지 이동 여기서 데이터가 있다면 ");
		
		
		
		model.addAttribute("store_title", "누나홀닭");
		model.addAttribute("store_address", "종로구 관철동 43-5");
		
		
		//select를 날려서 데이터가 있다면 partnerPageForm 페이지로 데이터가 없다면 등록 페이지로
		
		//수정은 partnerPageForm에서 partnerUpdateForm에서 수정이 적용되도록 버튼 처리
		//return "partner/partnerRegistForm"; //파트너 등록 페이지
		return "store/storerPageForm";//파트너 뷰 페이지
	}
	
	@RequestMapping(value="/storePage", method=RequestMethod.POST)
	public String selectOne(Model model, @RequestParam("partner_id") String id) {
		System.out.println("제가 양아치라서요. ");
		Partner partner = new Partner();
		partner.setPartner_id(id);;
		
		model.addAttribute("partnerPage", service.partnerPage(partner));		
		return "store/storePageForm";
	}
	
	
	@RequestMapping(value="/storeTest")
	public String test () {
		
		return "/store/storeRegistForm";
	}

	
	
}
