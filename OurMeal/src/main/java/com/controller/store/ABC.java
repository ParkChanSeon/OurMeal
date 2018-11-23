package com.controller.store;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.util.file.FileUploadService;
import com.util.file.FileVo;

@Controller
public class ABC {

	@Autowired
	private FileUploadService service;
	
	@RequestMapping(value="/abc", method=RequestMethod.GET)
	public String storeInfo() {
		
		return "/store/uploadForm";
	}
	
	@ModelAttribute("realPath")
	public String getRealPath(HttpServletRequest request) {
		// 실제 서버가 구동중인 경로를 반환    	
		String realPath = request.getRealPath("/WEB-INF/resources/upload/store");
		return realPath;
	}
	
	@RequestMapping(value="/abc", method=RequestMethod.POST)
	public String storeInfoRegist(Model model, FileVo file, @ModelAttribute("realPath") String realPath) {
		System.out.println("리얼패스 : " + realPath);
		
		service.saveFile(realPath, file);
    	
    	System.out.println(realPath);
        String fileName = file.getFile().getOriginalFilename(); // 원본 파일명
        long fileSize = file.getFile().getSize(); // 원본 파일 크기
        
       System.out.println("UPLOAD...FileName: "+fileName+", FileSize: "+fileSize);
		
		
		
		
		return "/store/storeInfoSuccessForm";
	}
	
	
	
}
