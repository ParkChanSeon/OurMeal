package com.controller.member;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.all.model.Health;
import com.all.model.Member;
import com.service.member.MemberService;
import com.util.file.FileUploadService;
import com.util.file.FileVo;

@Controller
public class MemberUpdateController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private FileUploadService fileservice;
	
	@ModelAttribute("realPath")
	public String getRealPath(HttpServletRequest request) {
		// 실제 서버가 구동중인 경로를 반환    	
		String realPath = request.getRealPath("/WEB-INF/resources/mypage/upload/");
		System.out.println(realPath);
		return realPath;
	}
	
	@RequestMapping(value="/test", method=RequestMethod.GET)
    public String test(HttpServletRequest request){
		String id = request.getParameter("pageNo");
		System.out.println("get 방식 id  가져오는 방법 : " + id);
        return "member/memberUpdateForm";
    }
	
	
	@RequestMapping(value="/memberUpdate", method=RequestMethod.GET)
    public String MemberUpdateForm(HttpSession session, Model model, Health health, HttpServletRequest request){
		
		Member member = (Member)session.getAttribute("User");
		
		//로그인한 사람의 개인정보 가져오고 세션을 비우고 세션에 넣어준다.
		Member myprofile = service.memberLogin(member);	
		
		request.getSession().setAttribute("MyPage", myprofile);
		
		if(member!=null) {
			//member 값이 있을 경우만 칼로리 정보를 가져온다.
			health.setMember_id(member.getMember_id());
			Health member_health = service.memberSelectHealth(health);
			request.getSession().setAttribute("kcal", member_health);			
		}

        return "member/memberUpdateForm";
    }

	@RequestMapping(value="/memberUpdate", method=RequestMethod.POST)
    public String MemberUpdateForm(Member member, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		//세션 아이디		
		Member session_member = (Member)session.getAttribute("User");
		
		if(session_member==null) {
			return "redirect:/";
		}
		
		member.setMember_id(session_member.getMember_id());
		
		//생일
		String member_birth = request.getParameter("member_birth");		
		member.setMember_birth(member_birth);
		
		int check = service.memberUpdate(member);
		
		if(check==1) {
			System.out.println("업데이트 --------");
			model.addAttribute("memberUpdate", check);
		}
		
		//로그인한 사람의 개인정보 가져오고 세션을 비우고 세션에 넣어준다.
		Member myprofile = service.memberLogin(session_member);	
		
		session.removeAttribute("MyPage");
		request.getSession().setAttribute("MyPage", myprofile);
		
        return "member/memberUpdateForm";
    }
	
	@RequestMapping(value="/memberUpdate_pw", method=RequestMethod.POST)
    public String MemberUpdatePW(ServletRequest request, Model model, HttpSession session){		 
		 //만약 개인정보 수정이라면 update 처리
		 String oldpw = request.getParameter("old_pw");
		 String newpw = request.getParameter("new_pw");
		 
		 Member member = (Member)session.getAttribute("User");
		 
		if(member==null) {
			return "redirect:/";
		}
			
		 System.out.println("예전 비번 : "+ oldpw);
		 System.out.println("바꿀 비번 : "+ newpw);
		 
		 //oldpw 쿼리 날려서 확인
		 member.setMember_pw(oldpw);		
		 Member checkPw = service.memberPasswordCheck(member);		 

		 if(checkPw!=null) {			 
			 member.setMember_pw(newpw);
			 int updatePw = service.memberPasswordUpdate(member);
			 model.addAttribute("PasswordUpdate", updatePw);
		 }else {
			 model.addAttribute("PasswordUpdate", 0);
		 }
		 
        return "member/memberUpdateForm";
    }

	@RequestMapping(value="/memberProfileImage", method=RequestMethod.POST)
    public String MemberUpdateProfileImage(Model model, FileVo file, @ModelAttribute("realPath") String realPath, HttpSession session){		 

		//로그인한 사람 정보
		Member member = (Member)session.getAttribute("User");
		if(member==null) {
			return "redirect:/";
		}
		member.setMember_id(member.getMember_id());		
    	
		//파일 업로드
		String fileName = fileservice.saveFile(realPath, file);
		member.setMember_image(fileName);
        long fileSize = file.getFile().getSize(); // 원본 파일 크기       
                        
        System.out.println("UPLOAD...FileName: "+fileName+", FileSize: "+fileSize);
                
        int check = service.memberProfileImageUpload(member);
        
        model.addAttribute("image", check);
		
        return "member/memberUpdateForm";
    }
	

	

}
