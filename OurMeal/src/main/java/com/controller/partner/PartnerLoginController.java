package com.controller.partner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.all.model.Partner;
import com.service.partner.PartnerService;

@Controller
public class PartnerLoginController {
	
	@Autowired
	private PartnerService service;

	@RequestMapping(value = "/partnerLogin", method = RequestMethod.GET)
	public String partnerLoginForm() {
		
		return "partner/partnerLoginForm";
	}

	@RequestMapping(value = "/partnerLogin", method = RequestMethod.POST)
	public String select(Model model, Partner partner) {
		
		return "main/loginSuccessForm";
	}

}
