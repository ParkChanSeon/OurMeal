package com.controller.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StoreMenueController {
	
	
	
	@RequestMapping(value="/storeMenu", method=RequestMethod.GET)
	public String storeInfo() {
	
		
		return "/store/storeMenuForm";
	}
	
	
	

}
