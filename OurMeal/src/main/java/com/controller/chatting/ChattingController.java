package com.controller.chatting;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChattingController {
	
	@RequestMapping(value="/chatting", method=RequestMethod.GET)
	public String Test() {
		System.out.println("이페이지를 타는지 보자.");
		return "chatting/chattingForm";
	}
}
