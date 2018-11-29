package com.controller.store;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.StringTokenizer;

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
		
		
		
		model.addAttribute("store_code",(String)req.getParameter("store_code2").trim() );
		model.addAttribute("menuList", menuService.selectStoreMenu(menu) );
	
		
		
		return "/store/menuInfoForm";
	}
	
	
	
	@ModelAttribute("realPath1")
	public String getRealPath(HttpServletRequest request) {
		// 실제 서버가 구동중인 경로를 반환    	
		String realPath = request.getRealPath("/WEB-INF/resources/upload/store");
		return realPath;
	}
	
	
	//메뉴중 하나를 골라 정볼르 수정할때
	@RequestMapping(value="/menuModify", method=RequestMethod.POST)
	public String menuInfo(HttpServletRequest req) {
		
		Food_menu menu = new Food_menu();
		
		String store_code = req.getParameter("store_code");
		String fm_code = req.getParameter("fm_code");
		menu.setStore_code(store_code);
		menu.setFm_code(fm_code);
		
		
		
		req.setAttribute("allergy", menuService.callAllergy());
		
		Food_menu myMenu =  (Food_menu) menuService.selectMenu(menu);
		
		System.out.println("test1: " + myMenu.getFm_allergy());
		String allergy = myMenu.getFm_allergy();
		
		String[] AllergyArray = allergy.split(",");
		
		ArrayList<String> checkedAllergy = new ArrayList<>();
		
		for(int i =0 ; i < AllergyArray.length; i++) {
			checkedAllergy.add(AllergyArray[i]);
			System.out.println(AllergyArray[i]);
		}
		
		 
		 /*
		 StringTokenizer tokenizer = new StringTokenizer(allergy, ",");
		 for (int i = 0; tokenizer.hasMoreTokens(); i++) {
	            System.out.println(i + "번째 : " + tokenizer.nextToken());
	            checkedAllergy.add(tokenizer.nextToken());
	        }
		*/
		
		
		req.setAttribute("checkedAllergy", checkedAllergy);

		req.setAttribute("menu", myMenu);
		
		return "/store/menuModifyForm";
	}
	
	
	// 메뉴 정보 수정 요청
	@RequestMapping(value="/menuModifyReq", method=RequestMethod.POST)
	public String menuModifyReq(HttpServletRequest req,Model model, Food_menu menu,
			FileVo file, @ModelAttribute("realPath1") String realPath) {
		
		
		realPath += "/"+menu.getStore_code()+"/menu";
		System.out.println("파일 사이즈 :"+ file.getFile().getSize());
		if(file.getFile().getSize() != 0) {
	        String fileName = service.saveFile(realPath, file);
	        long fileSize = file.getFile().getSize(); // 원본 파일 크기
	        
	      
	        System.out.println("UPLOAD...FileName: "+fileName+", FileSize: "+fileSize);
			String saveDir = "/resources/upload/store/"+menu.getStore_code()+"/menu";
	        String fm_image = saveDir+"/"+fileName;
	        System.out.println(fm_image);
	        
	        menu.setFm_image(fm_image);
	    	}
		
		
		String [] allergy = req.getParameterValues("allergy");
		
		String selectedAllergy ="";
		
		if(allergy != null ) {
		for(int i = 0; i < allergy.length;i++) {
			selectedAllergy += (allergy[i]+",");
		}
		
		
		selectedAllergy=selectedAllergy.substring(0, selectedAllergy.length()-1);
		
		
		} else {
			selectedAllergy ="없음";
		}
		System.out.println(selectedAllergy);
		
		menu.setFm_allergy(selectedAllergy);
		
		
		System.out.println(menu.getFm_name());

		System.out.println(menu.getFm_info());

		System.out.println(menu.getFm_kcal());

		System.out.println(menu.getFm_code());
		
		System.out.println(menu.getFm_image());
		menuService.modifyMenu(menu);
		
		req.setAttribute("store_code", menu.getStore_code());
		
		return "/store/menuModifySuccessForm";
	}
	
	
	
	// 메뉴 삭제
	@RequestMapping(value="/menuInfoDelete", method=RequestMethod.POST)
	public String menuDelete(HttpServletRequest req, Food_menu menu) {
		
		menuService.menuDelete(menu);
		
		req.setAttribute("store_code", menu.getStore_code());
		
		return "/store/menuDeleteSuccessForm";
	}
	
	
	// 메뉴 등록폼 호출
		@RequestMapping(value="/addMenu", method=RequestMethod.POST)
		public String addMenu(HttpServletRequest req) {
			
		System.out.println("/addMenu : " + req.getParameter("store_code"));
			req.setAttribute("store_code", req.getParameter("store_code"));
			
			
			req.setAttribute("allergy", menuService.callAllergy());
			return "/store/addMenuForm";
		}
	
		// 메뉴등록 요청
		@RequestMapping(value="/addMenuReq", method=RequestMethod.POST)
		public String addMenuReq(HttpServletRequest req, Model model, Food_menu menu,
				FileVo file, @ModelAttribute("realPath1") String realPath) {
			
		
			realPath += "/"+menu.getStore_code()+"/menu";
			System.out.println("파일 사이즈 :"+ file.getFile().getSize());
			if(file.getFile().getSize() != 0) {
		        String fileName = service.saveFile(realPath, file);
		        long fileSize = file.getFile().getSize(); // 원본 파일 크기
		        
		      
		        // System.out.println("UPLOAD...FileName: "+fileName+", FileSize: "+fileSize);
				String saveDir = "/resources/upload/store/"+menu.getStore_code()+"/menu";
		        String fm_image = saveDir+"/"+fileName;
		        
		        
		        menu.setFm_image(fm_image);
		    	}
			
			
			String [] allergy = req.getParameterValues("allergy");
			
			String selectedAllergy ="";
			
			if(allergy != null ) {
			for(int i = 0; i < allergy.length;i++) {
				selectedAllergy += (allergy[i]+",");
			}
			
			selectedAllergy=selectedAllergy.substring(0, selectedAllergy.length()-1);
			
			} else {
				selectedAllergy ="없음";
			}
			
			menu.setFm_allergy(selectedAllergy);
			
			System.out.println("등록 요청 ====");
			System.out.println(menu.getStore_code());
			System.out.println(menu.getFm_name());

			System.out.println(menu.getFm_info());

			System.out.println(menu.getFm_kcal());

			System.out.println(menu.getFm_code());
			
			System.out.println(menu.getFm_image());
			
			req.setAttribute("store_code", menu.getStore_code());
			menuService.addMenu(menu);
			
			
			return "/store/addMenuSuccessForm";
		}
		
		
		public ArrayList<String> stringTokenizer(String str) {
	       
			ArrayList<String> allergy = null;
	        StringTokenizer tokenizer = new StringTokenizer(str, ",");
	        for (int i = 0; tokenizer.hasMoreTokens(); i++) {
	            System.out.println(i + "번째 : " + tokenizer.nextToken());
	            allergy.add(tokenizer.nextToken());
	        }
	        return allergy;
	        
	    }
	
	

}
