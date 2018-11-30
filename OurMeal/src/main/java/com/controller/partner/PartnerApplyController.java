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
    	
    	/*
    	System.out.println("회원아이디 : " + partner.getMember_id());
    	System.out.println("사업자 번호 : " + partner.getPartner_crn());
    	System.out.println("사업자 등록증 : " + partner.getPartner_bl());
    	System.out.println("영업 신고서  : " + partner.getPartner_sd());
    	System.out.println("사업자 등록일 : " + partner.getPartner_date());
    	*/
    	service.partnerRegist(partner); 
    	
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
*/    	
    	
        model.addAttribute("uploadFiles", map);
        
		System.out.println("파트너 등록 페이지");
		return "partner/partnerApply";
	}
	
}
