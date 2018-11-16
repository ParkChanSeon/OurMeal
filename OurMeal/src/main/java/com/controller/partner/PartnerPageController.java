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
		System.out.println("파트너 페이지 이동");
		return "partner/partnerPageForm";
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
