package com.controller.member;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
public class M_jusoController {

	@RequestMapping(value="/m_juso")
	public String jusoPopup() {
		
		
		return "/join/daum_juso";		
	}
	
	
}
