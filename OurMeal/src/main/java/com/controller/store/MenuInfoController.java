package com.controller.store;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.Food_menu;
import com.all.model.Member;
import com.all.model.Store;
import com.service.store.MenuService;
import com.service.store.StoreService;
import com.util.file.FileUploadService;
import com.util.file.FileVo;

@Controller
public class MenuInfoController {

	
	@Autowired
	private MenuService menuService;
	@Autowired
	private FileUploadService service;
	
	@RequestMapping(value="/menuInfo", method=RequestMethod.POST)
	public String menuInfo(HttpServletRequest req, Model model) {

		Food_menu menu = new Food_menu();
		
		menu.setStore_code((String)req.getParameter("store_code2").trim());
		
		System.out.println("store_code : " + menu.getStore_code());
		
		
		
		
		model.addAttribute("menuList", menuService.selectStoreMenu(menu) );
	
		
		
		return "/store/menuInfoForm";
	}
	
	
	
	@ModelAttribute("realPath1")
	public String getRealPath(HttpServletRequest request) {
		// 실제 서버가 구동중인 경로를 반환    	
		String realPath = request.getRealPath("/WEB-INF/resources/upload/store/menu");
		return realPath;
	}
	
	@RequestMapping(value="/menuInfoUpdate", method=RequestMethod.POST)
	public String storeInfoRegist(HttpServletRequest req, Model model, Store store, FileVo file, @ModelAttribute("realPath") String realPath) {
		Member loginMember = (Member) req.getSession().getAttribute("User");
		
		
    	System.out.println(realPath);
    	
    	if(file.getFile().getSize() != 0) {
        String fileName = service.saveFile(realPath, file);
        long fileSize = file.getFile().getSize(); // 원본 파일 크기
        
      
        System.out.println("UPLOAD...FileName: "+fileName+", FileSize: "+fileSize);
		String saveDir = "/resources/upload/store";
        String store_image = saveDir+"/"+fileName;
        System.out.println(store_image);
        store.setStore_image(store_image);
    	}
    	
    	
        store.setMember_id(loginMember.getMember_id());
        
        
        
       model.addAttribute("store", store);
		return "/store/storeInfoSuccessForm";
	}
	


}
