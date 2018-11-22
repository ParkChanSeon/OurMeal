package com.controller.store;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.all.model.Member;
import com.all.model.Store;
import com.service.store.StoreService;
import com.util.file.FileUploadService;
import com.util.file.FileVo;

@Controller
public class StoreInfoController {
	
	@Autowired
	private FileUploadService service;
	
	@Autowired
	private StoreService storeService;
	
	
	@RequestMapping(value="/storeInfo", method=RequestMethod.GET)
	public String storeInfo(HttpServletRequest req) {
	
		
		Member loginMember = (Member) req.getSession().getAttribute("User");
		
		
		Store store = storeService.selectStore(loginMember);
		System.out.println(store.getStore_code());
		
		req.setAttribute("store",store);
		
		
		
		
		return "/store/storeInfoForm";
	}
	
	
	
	@ModelAttribute("realPath")
	public String getRealPath(HttpServletRequest request) {
		// 실제 서버가 구동중인 경로를 반환    	
		String realPath = request.getRealPath("/WEB-INF/resources/upload/store");
		return realPath;
	}
	
	@RequestMapping(value="/storeInfo", method=RequestMethod.POST)
	public String storeInfoRegist(HttpServletRequest req, Model model, Store store, FileVo file, @ModelAttribute("realPath") String realPath) {
		Member loginMember = (Member) req.getSession().getAttribute("User");
		
		service.saveFile(realPath, file);
    	
    	System.out.println(realPath);
        String fileName = service.saveFile(realPath, file);
        long fileSize = file.getFile().getSize(); // 원본 파일 크기
        
      
        System.out.println("UPLOAD...FileName: "+fileName+", FileSize: "+fileSize);
		
        String store_image = realPath+"/"+fileName;
        
        store.setStore_image(store_image);
        store.setMember_id(loginMember.getMember_id());
        
        int count = storeService.storeInfo(store);
        
		
		return "/store/storeInfoSuccessForm";
	}
	
	

}
