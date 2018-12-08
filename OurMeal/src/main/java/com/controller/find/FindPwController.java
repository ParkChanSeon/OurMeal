package com.controller.find;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.all.model.Member;
import com.service.find.FindPwService;

@Controller
public class FindPwController {

	@Autowired
	private FindPwService service;

	@Autowired
	private JavaMailSender emailSender;

	// 비밀번호 찾기 폼
	@RequestMapping(value = "/pwFind", method = RequestMethod.GET)
	public String pwFind() throws Exception {

		return "/find/pwFindForm";
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/pwSearch", method = RequestMethod.POST)
	public String pwSearch(HttpServletRequest request, Model model) throws Exception {

		String setfrom = "ourmealtest@gmail.com"; 					// 보내는 사람 이메일
		String member_id = request.getParameter("id"); 				// 회원 아이디
		String member_name = request.getParameter("name");		// 회원 이름
		String member_email = request.getParameter("email"); 		// 회원 이메일 주소
		String title = member_id + "고객님"; 								// 제목

		Member member = new Member();

		member.setMember_id(member_id);
		member.setMember_name(member_name);
		member.setMember_email(member_email);

		member = service.findPw(member);

		String random = temporaryPassword(10);
		
		member.setMember_id(member_id);
		member.setMember_pw(random);
		member.setMember_name(member_name);
		member.setMember_email(member_email);
				
		String content = "고객님의 비밀 번호는 " + member.getMember_pw() + " 입니다."; 	// 내용

		try {
			MimeMessage message = emailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); 			// 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(member_email); 		// 회원 이메일
			messageHelper.setSubject(title); 				// 메일제목은 생략이 가능하다
			messageHelper.setText(content); 				// 메일 내용

			model.addAttribute("findpw", member);

			emailSender.send(message);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		service.findPassword(member);
		return "/find/pwSearchForm";
	}

	public String temporaryPassword(int size) {
		StringBuffer buffer = new StringBuffer();
		Random random = new Random();

		String chars[] = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,1,2,3,4,5,6,7,8,9"
				.split(",");

		for (int i = 0; i < size; i++) {
			buffer.append(chars[random.nextInt(chars.length)]);
		}

		return buffer.toString();
	}
}
