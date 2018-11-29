package com.controller.store;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.all.model.Member;
import com.all.model.Star_bulletin;
import com.service.store.StoreReviewService;

@Controller
public class StoreReviewController {

	@Autowired
	private StoreReviewService service;
	
	
	@RequestMapping(value="/writeReviewFrom", method=RequestMethod.POST)
	public String writeReviewForm(Model model,HttpServletRequest req) {
		
		
		
		req.setAttribute("store_code", req.getParameter("store_code"));
		req.setAttribute("store_title", req.getParameter("store_title"));
		
		
		return "store/writeReviewForm";
	}
	
}
