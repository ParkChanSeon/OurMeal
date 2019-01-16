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

import com.all.model.JoinRequest;
import com.all.model.Member;
import com.all.model.Star_bulletin;
import com.service.member.DuplicateIdException;
import com.service.member.MemberService;
import com.service.member.RegistService;


 @Controller
public class MemberRegistController {
  
	

	@Autowired
	MemberService service;
	
	
	private static final String FORM_VIEW = "/join/joinForm";
	
	
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() {
		
		return FORM_VIEW;
	}
	
	
	@RequestMapping(value="/join", method=RequestMethod.POST  )
	public String joinReq(HttpServletRequest req) {
		
		JoinRequest joinReq = new JoinRequest();
		
		
		String member_address = req.getParameter("roadAddrPart1") + ", " 
		+req.getParameter("addrDetail") + " " +req.getParameter("roadAddrPart2");
		
		
		
		joinReq.setMember_id(req.getParameter("member_id"));
		joinReq.setMember_pw(req.getParameter("member_pw"));
		joinReq.setMember_ConfirmPassword(req.getParameter("member_ConfirmPassword"));
		joinReq.setMember_name(req.getParameter("member_name"));
		joinReq.setMember_image( "/resources/store/icon/mem.JPG");
		
		String yyyy = req.getParameter("member_birth_year").trim();
		String mm =  req.getParameter("member_birth_month").trim();
		
		String dd = req.getParameter("member_birth_day").trim();
		
		if (dd.equals("1"))
			dd= "01";
		if (dd.equals("2"))
			dd= "02";
		if (dd.equals("3"))
			dd= "03";
		if (dd.equals("4"))
			dd= "04";
		if (dd.equals("5"))
			dd= "05";
		if (dd.equals("6"))
			dd= "06";
		if (dd.equals("7"))
			dd= "07";
		if (dd.equals("8"))
			dd= "08";
		if (dd.equals("9"))
			dd= "09";
		
		
		
		joinReq.setMember_birth(yyyy+mm+dd);
		
		joinReq.setMember_sex(req.getParameter("member_sex"));
		
		
		String phoneFront = req.getParameter("member_phone_front").trim();
		String phoneMiddle = req.getParameter("member_phone_middle").trim();
		String phoneEnd = req.getParameter("member_phone_end").trim();
		
		joinReq.setMember_phone(phoneFront+phoneMiddle+phoneEnd);
		joinReq.setMember_address(member_address);
		joinReq.setMember_email(req.getParameter("member_email"));
		
		
		req.setAttribute("member_id", req.getParameter("member_id"));
		
		
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		joinReq.validate(errors);
		
		
		if(!errors.isEmpty()) {
			System.out.println("ERROR 발생");
			return FORM_VIEW;
		}
		
		try {
			service.join(joinReq);
			return "redirect:/joinSuccess/?member_id="+req.getParameter("member_id");
		} catch (DuplicateIdException e) {
			errors.put("duplicateId", Boolean.TRUE);
			return FORM_VIEW;
		}
	
		
		
	}
	
	
	@RequestMapping(value="/joinSuccess", method=RequestMethod.GET)
	public String success(@RequestParam("member_id") String member_id,Model model) {
		
		model.addAttribute("member_id", member_id);
		
		return "/join/joinSuccessForm";
	}
	
	//아이디 중복검사
	@RequestMapping(value="/checkid", method=RequestMethod.POST)
	@ResponseBody
	public Object checkId(@RequestParam Map<String,Object> map, HttpServletRequest req){
			
		JoinRequest joinReq = new JoinRequest();
		Member member = new Member();
		Map<String,Object> data = new HashMap<>();
		String id = ((String)map.get("joinReq_id")).trim();
		
		if(id.equals("")) {
			
			data.put("msg", "아이디를 입력하세요!");
			data.put("er", "1");
		
		}else if(id.length()> 20 ) {
			
			data.put("msg", "20자 미만으로 사용해 주세요!");
			data.put("er", "1");
			
		}else {
		
		joinReq.setMember_id(id);
		
		member = service.selectById(joinReq);
		if(member == null) {
			data.put("msg", "사용 가능한 ID 입니다.");
			data.put("er", "0");
		}
		else {
			data.put("msg", "중복된 아이디 입니다.");
			data.put("er", "1");
		}
		
		}
		return data;
	
	}
	
	
	

}