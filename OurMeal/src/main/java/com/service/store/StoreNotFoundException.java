package com.service.store;

import org.springframework.stereotype.Controller;

@Controller
public class StoreNotFoundException extends RuntimeException {

	
	
	public String storeNotFound() {
		
		return"exception/storeNotFoundForm";
	}

}
