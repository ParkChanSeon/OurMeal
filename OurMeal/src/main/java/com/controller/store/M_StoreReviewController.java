package com.controller.store;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.all.model.Member;
import com.all.model.Star_bulletin;
import com.all.model.Store;
import com.google.gson.Gson;
import com.service.store.StoreReviewService;
import com.service.store.StoreService;
import com.util.file.FileUploadService;
import com.util.file.FileVo;

@RestController
public class M_StoreReviewController {

	
	@Autowired
	private StoreReviewService service;
	
	@Autowired
	private FileUploadService fileService;
	
	@ModelAttribute("realPath")
	public String getRealPath(HttpServletRequest request) {
		// 실제 서버가 구동중인 경로를 반환    	
		String realPath = request.getRealPath("/WEB-INF/resources/upload/store");
		return realPath;
	}
	
	@RequestMapping(value="/store/write_review", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String writeReviewReq(FileVo file, @ModelAttribute("realPath") String realPath, String store_code, String content, String id, String sb_number) {		
		
		System.out.println("리뷰 등록 시작");
		System.out.println(id);
		System.out.println(store_code);
		System.out.println(content);
		System.out.println(sb_number);
		
		Star_bulletin review = new Star_bulletin();
		review.setMember_id(id);
		review.setStore_code(store_code);
		review.setSb_content(content);
		review.setSb_score(sb_number);
		
    	realPath += "/"+review.getStore_code()+"/review";
    	System.out.println("서버 저장경로 :" + realPath);
    	
    	if(file!=null) {
    		if(file.getFile().getSize() != 0) {
    			String fileName = fileService.saveFile(realPath, file);
    			String saveDir = "/resources/upload/store/"+review.getStore_code()+"/review";
    			String sb_image = saveDir+"/"+fileName;
    			review.setSb_image(sb_image);
    			System.out.println("파일 저장 " + sb_image);
        	}
    	}
    	
      
       int result = service.m_writeReview(review);
       
       Gson gson = new Gson();
       
       return gson.toJson(result);
	}	
	
	/*
	@RequestMapping(value="/m_reviewModify", method=RequestMethod.GET)
	public String storeInfoRegist(HttpServletRequest req, Model model,
			@RequestParam("sb_no") String sb_no) {		
		
		Star_bulletin review = new Star_bulletin();
		Store store = new Store();
		
		review.setSb_no(sb_no);
		
		review = service.reviewModify(review);
		store.setStore_code(review.getStore_code());
		
		store = storeService.selectStore(store);
		
		model.addAttribute("review",review );
		model.addAttribute("store_title",store.getStore_title());
		
    	return "store/reviewModifyForm";
	}
	
	
	@RequestMapping(value="/m_reviewModify", method=RequestMethod.POST)
	@ResponseBody
	public Object reviewModify(HttpServletRequest req, Model model, Star_bulletin review, FileVo file, 
			@ModelAttribute("realPath") String realPath){
			
		
		
		
		realPath += "/"+review.getStore_code()+"/review";
    	
    	if(file.getFile().getSize() != 0 ) {
        String fileName = fileService.saveFile(realPath, file);
        long fileSize = file.getFile().getSize(); // 원본 파일 크기
        
      
        
		String saveDir = "/resources/upload/store/"+review.getStore_code()+"/review";
        String sb_image = saveDir+"/"+fileName;
       
        review.setSb_image(sb_image);
        
    	}
    	
       service.reviewModifyReq(review);
    	
       model.addAttribute("return","ok");
       
		return "";
	
	}
	
	@RequestMapping(value="/m_reviewDelete", method=RequestMethod.POST)
	@ResponseBody
	public Object reviewDelete(@RequestParam Map<String,Object> info){
			
		String sb_no = (String)info.get("sb_no");
		
		System.out.println("리뷰삭제 번호 : " +sb_no);
		
		Star_bulletin review = new Star_bulletin();
		review.setSb_no(sb_no);
		
		service.reviewDelete(review);
		
		return "";
	
	}
	*/
	
	
	
	
}
