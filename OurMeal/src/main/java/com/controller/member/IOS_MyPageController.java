package com.controller.member;



import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.all.model.Health;
import com.all.model.Member;
import com.google.gson.Gson;
import com.service.member.MemberService;
import com.util.file.FileUploadService;
import com.util.file.FileVo;

@RestController
public class IOS_MyPageController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private FileUploadService fileservice;
	
	@ModelAttribute("realPath")
	public String getRealPath(HttpServletRequest request) {
		// 실제 서버가 구동중인 경로를 반환    	mypage/mobile_upload/
		String realPath = request.getRealPath("/WEB-INF/resources/mypage/upload/");
		System.out.println(realPath);
		return realPath;
	}
	
	
	@RequestMapping(value="/ios_profile_update", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String UpdateMyprofile(@RequestParam Map<String,String> map) throws ParseException {		
		Member member = new Member();
		
		System.out.println("앱 마이 페이지 업데이트");
		//앱에서 받은 아이디 정보를 넣어서 보내준다. 우선 임시로 아이디 값을 지정
	
			
		member.setMember_id(map.get("id"));
		member.setMember_name(map.get("name"));	
		member.setMember_email(map.get("email"));	
		member.setMember_phone(map.get("phone"));	
		member.setMember_birth(map.get("birth"));
		member.setMember_address(map.get("address"));
		
		String result = String.valueOf(service.memberUpdate(member));		
		
		return result;
	}

	@RequestMapping(value="/ios_password_update", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String UpdatePassword(@RequestParam Map<String,String> map) throws ParseException {		
		Member member = new Member();
		System.out.println("앱 마이 페이지 비밀번호 업데이트");
		//앱에서 받은 아이디 정보를 넣어서 보내준다. 우선 임시로 아이디 값을 지정
		String id = map.get("id");
		String pw = map.get("pw");
		String new_pw = map.get("new_pw");
			
		member.setMember_id(id);
		member.setMember_pw(pw);		
		
		/*
		System.out.println(realpw);
		System.out.println(pw);
		System.out.println(pwre);
		*/
		
		Member pw_check = service.memberPasswordCheck(member);
		
		String result;
		
		if(pw_check==null) {
			//기존 비밀번호가 틀릴때.
			result = "0";
		}else {
			//새로운 비밀번호 적용 
			member.setMember_pw(new_pw);
			result = String.valueOf(service.memberPasswordUpdate(member));	
		}
		
	System.out.println(result);
			
		return result;
	}
	
	
	@RequestMapping(value="/ios_profile_image_upload", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String profile_image_upload(FileVo file, @ModelAttribute("realPath") String realPath) {       
		Member member = new Member();
		String member_id = "TEST01";
		member.setMember_id(member_id);
		
		//파일 업로드
		String fileName = fileservice.saveFile(realPath, file);
		member.setMember_image("/resources/mypage/upload/"+fileName);
        long fileSize = file.getFile().getSize(); // 원본 파일 크기       
        
        //System.out.println("모바일 이미지 서버 저장 경로 : " + realPath);
        System.out.println("UPLOAD...FileName: "+fileName+", FileSize: "+fileSize);
        
        int check = service.memberProfileImageUpload(member);
        
        String upload_after_path = member.getMember_image();
        Gson gson = new Gson();
        
        if(check==1) {
        	return gson.toJson(upload_after_path); 
        }else {
        	 return gson.toJson(check);
        }        
		
	}
	

	
}
