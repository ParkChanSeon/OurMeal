package com.controller.store;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.all.model.Member;
import com.all.model.Star_bulletin;
import com.all.model.Store;
import com.service.store.StoreReviewService;
import com.util.file.FileUploadService;
import com.util.file.FileVo;

@Controller
public class StoreReviewController {

	
	@Autowired
	private StoreReviewService service;
	@Autowired
	private FileUploadService fileService;
	
	@RequestMapping(value="/writeReviewFrom", method=RequestMethod.POST)
	public String writeReviewForm(Model model,HttpServletRequest req) {
		
		
		
		req.setAttribute("store_code", req.getParameter("store_code"));
		req.setAttribute("store_title", req.getParameter("store_title"));
		
		
		return "store/writeReviewForm";
	}
	
	@ModelAttribute("realPath")
	public String getRealPath(HttpServletRequest request) {
		// 실제 서버가 구동중인 경로를 반환    	
		String realPath = request.getRealPath("/WEB-INF/resources/upload/store");
		return realPath;
	}
	
	@RequestMapping(value="/writeReviewReq", method=RequestMethod.POST)
	public String storeInfoRegist(HttpServletRequest req, Model model, Star_bulletin review, FileVo file, 
			@ModelAttribute("realPath") String realPath) {		
		
    	realPath += "/"+review.getStore_code()+"/review";
    	System.out.println("서버 저장경로 :" + realPath);
    	
    	if(file.getFile().getSize() != 0) {
        String fileName = fileService.saveFile(realPath, file);
        long fileSize = file.getFile().getSize(); // 원본 파일 크기
        
      
        
		String saveDir = "/resources/upload/store/"+review.getStore_code()+"/review";
        String sb_image = saveDir+"/"+fileName;
       
        review.setSb_image(sb_image);
    	}
    	
        
       service.writeReview(review);
        
       
		return "redirect:" + "/storePage/?store_code=" + req.getParameter("store_code");
	}
	
	
	
	
}
