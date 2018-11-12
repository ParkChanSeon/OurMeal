package com.controller.partner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.all.model.Partner;
import com.service.partner.PartnerService;

@Controller
public class partnerRegistController {
	
	@Autowired
	private PartnerService service;
	
	@RequestMapping(value="/partnerRegist", method=RequestMethod.GET)
    public String partnerRegist(){
        return "partner/partnerRegistForm";
    }
	
	@RequestMapping(value="/partnerRegist", method=RequestMethod.POST)
	public String insert(Model model, Partner partner) {
		System.out.println("partnerRegist");
		
		model.addAttribute("partnerRegist", service.partnerRegist(partner));	
		return "main/registSuccessForm";
	}

}
