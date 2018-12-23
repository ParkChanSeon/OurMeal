package com.controller.member;



import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.all.model.Member;
import com.google.gson.Gson;
import com.service.member.MemberService;

@RestController
public class M_MyPageController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/myPage/select", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String SelectMypageUser() {
		Member member = new Member();
		
		System.out.println("이곳을 오는지 확인");
		
		//앱에서 받은 아이디 정보를 넣어서 보내준다. 우선 임시로 아이디 값을 지정
		String id = "test1";
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
		
		System.out.println(" 업데이트 시작");
		//앱에서 받은 아이디 정보를 넣어서 보내준다. 우선 임시로 아이디 값을 지정
		String id = "test1";
			
		member.setMember_id(id);
		member.setMember_name(name);	
		member.setMember_email(email);	
		member.setMember_phone(phone);	
		member.setMember_birth(birth);	
				
		System.out.println("업데이트 끝.");
		
		String result = String.valueOf(service.memberUpdate(member));		
		
		return result;
	}

	@RequestMapping(value="/myPage/password_update", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String UpdatePassword(String realpw, String pw, String pwre) throws ParseException {		
		Member member = new Member();
		
		System.out.println(" 패스워드 업뎃 시작");
		System.out.println(realpw);
		System.out.println(pw);
		System.out.println(pwre);
		//앱에서 받은 아이디 정보를 넣어서 보내준다. 우선 임시로 아이디 값을 지정
		String id = "test1";
			
		member.setMember_id(id);
		member.setMember_pw(realpw);		
		
		Member pw_check = service.memberPasswordCheck(member);
		
		String result;
		
		if(pw_check!=null) {
			//새로운 비밀번호 적용 
			member.setMember_pw(pw);
			result = String.valueOf(service.memberPasswordUpdate(member));	
		}else {
			result = "0";
		}
						
		System.out.println("패스워드 업뎃 끝.");
			
		return result;
	}
	

}
