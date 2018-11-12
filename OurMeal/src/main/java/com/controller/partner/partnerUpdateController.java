package com.controller.partner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.service.partner.PartnerService;

@Controller
public class partnerUpdateController {
	
	@Autowired
	private PartnerService service;
	
	@RequestMapping(value="/partnerUpdate", method=RequestMethod.GET)
    public String partnerUpdateForm(){
        return "partner/partnerUpdate";
    }

}
