package com.controller.join;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class JoinController {

	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String addressTest2() {
		
		return "/join/joinForm";
	}
	
	
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String addressTest() {
		
		
	     
		
		
		return "addressTest";
	}
	
	
	
}