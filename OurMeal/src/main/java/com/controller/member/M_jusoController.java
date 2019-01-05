package com.controller.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class M_jusoController {

	@RequestMapping(value="/m_juso")
	public String jusoPopup(HttpServletRequest request) {
		  
		return "/join/daum_juso";		
	}
}
