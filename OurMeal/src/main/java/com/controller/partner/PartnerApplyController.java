package com.controller.partner;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.all.model.Member;
import com.all.model.Partner;
import com.service.partner.PartnerService;
import com.util.file.FileUploadService;
import com.util.file.FileVo;

@Controller
public class PartnerApplyController {

	@Autowired
	private PartnerService service;
	
	@Autowired
	private FileUploadService fileservice;
	
	@ModelAttribute("realPath")
	public String getRealPath(HttpServletRequest request) {
		// 실제 서버가 구동중인 경로를 반환    	
		String realPath = request.getRealPath("/WEB-INF/resources/partner/upload/");
		return realPath;
	}
	
	@RequestMapping(value="/partnerapply", method=RequestMethod.GET)
	public String PartnerInput() {
		System.out.println("파트너 신청 페이지");
		return "partner/partnerApply";
	}
	
	@RequestMapping(value="/partnerapply", method=RequestMethod.POST)
	public String PartnerApply(Partner partner, Model model, 
    		@RequestParam ArrayList<MultipartFile> files, 
    		@ModelAttribute("realPath") String realPath, HttpServletRequest request, HttpSession session) throws ParseException {		
		
		//사업자 등록일
		String partner_date = request.getParameter("partnerdate");

		System.out.println(partner_date);
		
		//로그인한 멤버 아이디
		Member session_member = (Member)session.getAttribute("User");
		partner.setMember_id(session_member.getMember_id());		
		
		//날짜 변환
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-mm-dd");		
		partner.setPartner_date(dt.parse(partner_date));
		
    	HashMap<String, Long> map = new HashMap<>();
    	
    	ArrayList<String> filenames = new ArrayList<>();
    	for( MultipartFile mf : files ) {
    		FileVo file = new FileVo();
    		file.setFile(mf);
    		
    		String filename = fileservice.saveFile(realPath, file);
    		filenames.add(filename);
    		System.out.println("실제 파일 이름 : " + filename);
    		map.put(mf.getOriginalFilename(), mf.getSize());
    	}
    	
    	if(files.size()==2) {
    		partner.setPartner_bl(filenames.get(0));
    		partner.setPartner_sd(filenames.get(1));
    	}    	

    	service.partnerRegist(partner);    	  	
    	
        model.addAttribute("uploadFiles", map);
        
		System.out.println("파트너 등록 페이지");
		return "/partner/partnerApply_ok";
	}
	
}
