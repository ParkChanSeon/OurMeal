package com.controller.main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.Member;

@Controller
public class MainPageController {
	
	@RequestMapping(value="/mainPage", method=RequestMethod.GET)
	public String mainForm() {
		return "mainForm";
	}

}
