package com.controller.chatting;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChattingController {
	
	@RequestMapping(value="/chatting", method=RequestMethod.GET)
	public String Test() {		
		return "chatting/chattingForm";
	}
}
