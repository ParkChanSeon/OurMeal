package com.controller.partner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.Partner;
import com.service.partner.PartnerService;

@Controller
public class PartnerPageController {
	
	@Autowired
	private PartnerService service;
	
	@RequestMapping(value="/partnerPage", method=RequestMethod.GET)
	public String PartnerPageView(Model model) {
		System.out.println("파트너 페이지 이동 여기서 데이터가 있다면 ");
		
		//select를 날려서 데이터가 있다면 partnerPageForm 페이지로 데이터가 없다면 등록 페이지로
		
		//수정은 partnerPageForm에서 partnerUpdateForm에서 수정이 적용되도록 버튼 처리
		//return "partner/partnerRegistForm"; //파트너 등록 페이지
		return "partner/partnerPageForm";//파트너 뷰 페이지
	}
	
	@RequestMapping(value="/partnerPage", method=RequestMethod.POST)
	public String selectOne(Model model, @RequestParam("partner_id") String id) {
		System.out.println("제가 양아치라서요. ");
		Partner partner = new Partner();
		partner.setPartner_id(id);;
		
		model.addAttribute("partnerPage", service.partnerPage(partner));		
		return "partner/partnerPageForm";
	}

}
