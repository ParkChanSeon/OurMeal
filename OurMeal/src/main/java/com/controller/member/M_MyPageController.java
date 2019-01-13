package com.controller.member;



import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.all.model.Health;
import com.all.model.Member;
import com.google.gson.Gson;
import com.service.member.MemberService;
import com.util.file.FileUploadService;
import com.util.file.FileVo;

@RestController
public class M_MyPageController {
	
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
	
	
	@RequestMapping(value="/myPage/select", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String SelectMypageUser(String member_id) {
		Member member = new Member();
		
		System.out.println("앱 마이페이지 정보 출력");
		System.out.println(member_id);
		
		//앱에서 받은 아이디 정보를 넣어서 보내준다. 우선 임시로 아이디 값을 지정
		member.setMember_id(member_id);
		/*
		String date = member.getMember_date().toString();
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-mm-dd")
		*/
		
		member = service.myPage(member);

		Gson gson = new Gson();
		String strJson = gson.toJson(member);
		return strJson;
	}

	@RequestMapping(value="/myPage/profile_update", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String UpdateMyprofile(String name, String email, String phone, String birth,String member_id) throws ParseException {		
		Member member = new Member();
		
		System.out.println("앱 마이 페이지 업데이트");
		//앱에서 받은 아이디 정보를 넣어서 보내준다. 우선 임시로 아이디 값을 지정
			
		member.setMember_id(member_id);
		member.setMember_name(name);	
		member.setMember_email(email);	
		member.setMember_phone(phone);	
		member.setMember_birth(birth);
		
		String result = String.valueOf(service.memberUpdate(member));		
		
		return result;
	}

	@RequestMapping(value="/myPage/password_update", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String UpdatePassword(String realpw, String pw, String pwre, String member_id) throws ParseException {		
		Member member = new Member();
		System.out.println("앱 마이 페이지 비밀번호 업데이트");
		//앱에서 받은 아이디 정보를 넣어서 보내준다. 우선 임시로 아이디 값을 지정			
		member.setMember_id(member_id);
		member.setMember_pw(realpw);		
		
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
			member.setMember_pw(pw);
			result = String.valueOf(service.memberPasswordUpdate(member));	
		}
			
		return result;
	}
	
	@RequestMapping(value="/myPage/Health_Select", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String Health(String member_id) {
		System.out.println("신체 정보 조회");
		System.out.println("현재 로그인한 사람 아이디?" + member_id);
		
		Health health = new Health();
		health.setMember_id(member_id);
		
		//앱에서 보낸 아이디 정보를 보내서 기존 데이타가 있는지 체크한다.
		Health member_health = service.memberSelectHealth(health);		
		System.out.println("조회된 정보는?" + member_health);
		Gson gson = new Gson();
		
		return gson.toJson(member_health); 
	}
	
	//인서트아니면 업데이트
	@RequestMapping(value="/myPage/Health_IU", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String Health(String cm, String kg, String member_id) {
		System.out.println("신체 정보 등록 및 업데이트 하기");
		System.out.println("로그인 아이디" + member_id);
		
		Health health = new Health();
		health.setMember_id(member_id);
		health.setHealth_height(Double.parseDouble(cm));
		health.setHealth_weight(Double.parseDouble(kg));
		
		//앱에서 보낸 아이디 정보를 보내서 기존 데이타가 있는지 체크한다.
		Health member_health = service.memberSelectHealth(health);		
		System.out.println("조회된 정보는?" + member_health);
		Gson gson = new Gson();
		
		//기존에 데이터가 없다면 건강 정보를 인서트하고 그게 아니라면 업데이트 한후에 select결과를 전달. 안드로 전달
		if(member_health==null) {			
			service.memberAddHealth(health);
			Health result = new Health();
			result.setMember_id(member_id);
			result = service.memberSelectHealth(result);
			return gson.toJson(result);

		}else {//기존에 데이터가 있다면
			service.memberUpdateHealth(health);
			member_health = service.memberSelectHealth(member_health);
			return gson.toJson(member_health);
		}
	}
	
	@RequestMapping(value="/myPage/profile_image_upload", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String profile_image_upload(FileVo file, @ModelAttribute("realPath") String realPath, String member_id) {       
		Member member = new Member();
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
	

	@RequestMapping(value="/myPage/profile_image_select", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String profile_image_upload(String member_id) {
		System.out.println("프로필 이미지 가져오기");
		System.out.println(member_id);
		Member member = new Member();
		member.setMember_id(member_id);
		
		//개인 회원 파일 경로 가져오기
		member = service.selectProfileImage(member_id);
		
        Gson gson = new Gson();
        
        String image_path = null; 
        if(member!=null) {
        	image_path = member.getMember_image();
        	return gson.toJson(image_path);
        }else {
        	return null;
        }
        		
	}

}
