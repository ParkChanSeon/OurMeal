package com.controller.partner;

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
	public String PartnerApply(Model model, 
    		@RequestParam ArrayList<MultipartFile> files, 
    		@ModelAttribute("realPath") String realPath, HttpServletRequest request, HttpSession session) {
    	
		//로그인한 멤버 아이디
		Member session_member = (Member)session.getAttribute("User");
		//member.setMember_id(session_member.getMember_id());
		
		//사업자 번호
		String buisnessNo = request.getParameter("buisnessNo");
						
    	HashMap<String, Long> map = new HashMap<>();
    	
    	for( MultipartFile mf : files ) {
    		FileVo file = new FileVo();
    		file.setFile(mf);
    		
    		String filename = fileservice.saveFile(realPath, file);
    		
    		System.out.println("실제 파일 경로 : " + realPath);    		
    		System.out.println("실제 파일 이름 : " + filename);
    		map.put(mf.getOriginalFilename(), mf.getSize());
    	}
    	
    	//INSERT 해야할 내용 정리 member_id, 파일 이름, 파일 이름 무조건 2개 
    	
/*
				파트너 전환시
				- 사업자 번호
				- 사업자 등록증 사본
				- 영업신고증 사본
				(관리자가 확인후 승인 하는 방식으로 )
				파트너 테이블에 인서트
				멤버타입 1 로 변환
				스토어 테이블에 인서트 (프로시져)
				
				partner 테이블에 데이터가 있다면 승인 여부를 체크 할수 있다.
				CREATE TABLE partner (
		member_id		VARCHAR(20)     NOT NULL	PRIMARY KEY		COMMENT '사업자 아이디'
	,	partner_crn		VARCHAR(20)     NOT NULL    				COMMENT '사업자 등록번호'
    ,	partner_bl		VARCHAR(300)	NOT NULL					COMMENT	'사업자 등록증'
    ,	partner_sd		VARCHAR(300)	NOT NULL					COMMENT '영업 신고서'
    ,	partner_date	DATE			NOT NULL					COMMENT '사업자 등록일'
);

 * */    	
    	
        model.addAttribute("uploadFiles", map);
        
		System.out.println("파트너 등록 페이지");
		return "partner/partnerApply";
	}
	
}
