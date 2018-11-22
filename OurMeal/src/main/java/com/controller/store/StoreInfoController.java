package com.controller.store;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.all.model.Store;
import com.util.file.FileVo;

@Controller
public class StoreInfoController {
	
	
	
	@RequestMapping(value="/storeInfo", method=RequestMethod.GET)
	public String storeInfo() {
	
		
		return "/store/storeInfoForm";
	}
	
	
	
	@ModelAttribute("realPath")
	public String getRealPath(HttpServletRequest request) {
		// 실제 서버가 구동중인 경로를 반환    	
		String realPath = request.getRealPath("/WEB-INF/resources/upload/store");
		return realPath;
	}
	
	@RequestMapping(value="/storeInfo", method=RequestMethod.POST)
	public String storeInfoRegist(Model model,Store store, FileVo file, @ModelAttribute("realPath") String realPath) {
		
		String fileName = file.getFile().getOriginalFilename(); // 원본 파일명
	
		
		
		
		
		
		
		
		
		
		return "/store/storeInfoSuccessForm";
	}
	
	

}
