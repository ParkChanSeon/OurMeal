package com.controller.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class M_StoreMenueController {
	
	
	
	@RequestMapping(value="/m_storeMenu", method=RequestMethod.GET)
	public String storeInfo() {
	
		
		return "/store/storeMenuForm";
	}
	
	
	

}
