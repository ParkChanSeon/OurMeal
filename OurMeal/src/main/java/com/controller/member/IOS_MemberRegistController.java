package com.controller.member;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.all.model.JoinRequest;
import com.all.model.Member;
import com.all.model.Star_bulletin;
import com.google.gson.Gson;
import com.service.member.DuplicateIdException;
import com.service.member.MemberService;
import com.service.member.RegistService;


 @RestController
public class IOS_MemberRegistController {
  
	

	@Autowired
	MemberService service;
	
	@RequestMapping(value="/ios_join", method=RequestMethod.POST  )
	public String joinReq(@RequestParam Map<String,String> map) {
		
		JoinRequest joinReq = new JoinRequest();
		
		joinReq.setMember_id(map.get("id"));
		
		joinReq.setMember_pw(map.get("pw"));
		joinReq.setMember_ConfirmPassword(map.get("pw"));
		joinReq.setMember_name(map.get("name"));
		joinReq.setMember_image( "/resources/store/icon/mem.JPG");
		
		joinReq.setMember_birth(map.get("birth"));
		
		joinReq.setMember_sex(map.get("sex"));
		
		joinReq.setMember_phone(map.get("tel"));
		joinReq.setMember_address(map.get("address"));
		joinReq.setMember_email(map.get("email"));
		
		System.out.println("회원가입 확인");
		System.out.println(map.get("id"));
		System.out.println(map.get("pw"));
		System.out.println(map.get("name"));
		System.out.println(map.get("birth"));
		System.out.println(map.get("sex"));
		System.out.println(map.get("tel"));
		System.out.println(map.get("address"));
		System.out.println(map.get("email"));
		
		
		
		service.join(joinReq);
		
		Map<String, Boolean> ok = new HashMap<>();
		ok.put("join", true);
		
		
		Gson gson = new Gson();
		
		String strOk = gson.toJson(ok);
		
		
		return strOk;
		
}
	
	
	
	
	

}