package com.controller.article.free;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.all.model.FreeArticle;
import com.service.articles.FreeArticleService;
import com.util.file.FileUploadService;
import com.util.file.FileVo;

@Controller
public class FreeWriteController {

	@Autowired
	private FreeArticleService service;
	@Autowired
	private FileUploadService fileService;
	
	@ModelAttribute("realPath")
	public String getRealPath(HttpServletRequest request) {
		// 실제 서버가 구동중인 경로를 반환    	
		String realPath = request.getRealPath("/WEB-INF/resources/upload/freeArticle");
		return realPath;
	}
	
	@RequestMapping(value="/freeWriteSuccess", method=RequestMethod.POST)
	public String freeWrite(Model model, FreeArticle freeArticle, HttpServletRequest request,
		FileVo file, @ModelAttribute("realPath") String realPath ) {

		if(file.getFile().getSize() != 0) {
	        String fileName = fileService.saveFile(realPath, file);
			String saveDir = "/resources/upload/freeArticle";
	        String fm_image = saveDir+"/"+fileName;
	        freeArticle.setFb_image(fm_image);
		 service.freeWrite(freeArticle);
		}
		return "success/freeArticleWriteSuccessForm";
	}
}
