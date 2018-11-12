package com.controller.partner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.service.partner.PartnerService;

@Controller
public class PartnerDeleteController {
	
	@Autowired
	private PartnerService service;
	
	@RequestMapping(value="/partnerDelete", method=RequestMethod.GET)
    public String partnerDeleteForm(){
        return "main/deleteSuccessForm";
    }

}
