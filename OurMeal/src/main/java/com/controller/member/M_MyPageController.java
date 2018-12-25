package com.controller.member;



import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.all.model.Health;
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
		System.out.println("앱 마이 페이지 칼로리 정보 출력 및 인서트");
		//앱에서 받은 아이디 정보를 넣어서 보내준다. 우선 임시로 아이디 값을 지정
		String id = "TEST01";
			
		member.setMember_id(id);
		member.setMember_pw(realpw);		
		
		Member pw_check = service.memberPasswordCheck(member);
		
		String result;
		
		if(pw_check!=null) {
			//새로운 비밀번호 적용 
			member.setMember_pw(pw);
			result = String.valueOf(service.memberPasswordUpdate(member));	
		}else {
			//기존 비밀번호가 틀릴때.
			result = "0";
		}
			
		return result;
	}
	
	@RequestMapping(value="/myPage/Health", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String Health(String cm, String kg) {
		Member member = new Member();		

		//앱에서 받은 아이디 정보를 넣어서 보내준다. 우선 임시로 아이디 값을 지정
		String id = "TEST01";
		member.setMember_id(id);
		
		//SELECT 데이터가 있다면 member_health에 select 결과를 넣어준다.
		Health member_health = null;
		
		System.out.println("키 정보" + cm);
		System.out.println("몸무게 정보 " + kg);
		
		//앱에서 받은 정보를 모델에 넣어준다.
		Health health = new Health();
		health.setHealth_height(Double.parseDouble(cm));
		health.setHealth_weight(Double.parseDouble(kg));		 
		
		String result = "0";
		Gson gson = new Gson();
		
		health.setMember_id(member.getMember_id());
		member_health = service.memberSelectHealth(health);		
		
		//insert
		if(member_health==null) {			
			result = String.valueOf(service.memberAddHealth(health));
		}else {
			result = gson.toJson(member_health);
		}
		
		return result;
	}

}
