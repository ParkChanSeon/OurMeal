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
	
	
	@RequestMapping(value="/myPage/select", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String SelectMypageUser() {
		Member member = new Member();
		
		System.out.println("앱 마이페이지 정보 출력");
		
		//앱에서 받은 아이디 정보를 넣어서 보내준다. 우선 임시로 아이디 값을 지정
		String id = "TEST01";
		member.setMember_id(id);
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
	public String UpdateMyprofile(String name, String email, String phone, String birth) throws ParseException {		
		Member member = new Member();
		
		System.out.println("앱 마이 페이지 업데이트");
		//앱에서 받은 아이디 정보를 넣어서 보내준다. 우선 임시로 아이디 값을 지정
		String id = "TEST01";
			
		member.setMember_id(id);
		member.setMember_name(name);	
		member.setMember_email(email);	
		member.setMember_phone(phone);	
		member.setMember_birth(birth);
		
		String result = String.valueOf(service.memberUpdate(member));		
		
		return result;
	}

	@RequestMapping(value="/myPage/password_update", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String UpdatePassword(String realpw, String pw, String pwre) throws ParseException {		
		Member member = new Member();
		System.out.println("앱 마이 페이지 비밀번호 업데이트");
		//앱에서 받은 아이디 정보를 넣어서 보내준다. 우선 임시로 아이디 값을 지정
		String id = "TEST01";
			
		member.setMember_id(id);
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
	
	@RequestMapping(value="/myPage/Health", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String Health(String cm, String kg) {
		Member member = new Member();		

		//앱에서 받은 아이디 정보를 넣어서 보내준다. 우선 임시로 아이디 값을 지정
		String id = "TEST03";
		member.setMember_id(id);
		
		//SELECT 데이터가 있다면 member_health에 select 결과를 넣어준다.
		Health member_health = null;
		
		System.out.println("키 정보" + cm);
		System.out.println("몸무게 정보 " + kg);
		
		//앱에서 받은 정보를 모델에 넣어준다.
		Health health = new Health();
		
		//키와 몸무게 정보가 없다면 패스
		if(cm!=null && kg !=null) {
			health.setHealth_height(Double.parseDouble(cm));
			health.setHealth_weight(Double.parseDouble(kg));	
		}
				 
		
		String result = "0";
		Gson gson = new Gson();
		
		health.setMember_id(member.getMember_id());
		member_health = service.memberSelectHealth(health);		
		
		//insert
		if(member_health==null) {
			
			//data insert
			service.memberAddHealth(health);
			
			//insert 하고 나서 안드로이드 화면에 보여주기 위해 result 값 담음
			System.out.println("insert 후 데이터 : " + result);
			
			member_health = service.memberSelectHealth(health);
			result = gson.toJson(member_health);

		}else {
			result = gson.toJson(member_health);
		}
		
		return result;
	}
	
	@RequestMapping(value="/myPage/profile_image_upload", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
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
	

	@RequestMapping(value="/myPage/profile_image_select", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String profile_image_upload(String id) {       
		Member member = new Member();
		String member_id = "TEST01";
		member.setMember_id(member_id);
		
		//개인 회원 파일 경로 가져오기
		member = service.selectProfileImage(member_id);
		
        Gson gson = new Gson();
        
        return gson.toJson(member.getMember_image());		
	}

}
