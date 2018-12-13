package com.controller.member;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.all.model.Member;
import com.all.model.Store;
import com.service.member.LoginFailException;
import com.service.member.MemberService;
import com.service.store.StoreService;
import com.all.model.User;

@Controller
public class MemberLoginController {

	@Autowired
	private MemberService service;
	
	@Autowired
	private StoreService storeService;

	@RequestMapping(value = "/memberLogin", method = RequestMethod.GET)
	public String memberLoginForm() {
		
		return "member/memberLoginForm";
	}

	@ResponseBody
	@RequestMapping(value = {"/memberLogin"}, method = RequestMethod.POST)	
	public String select(Model model, Member member, HttpServletRequest request) {
		//System.out.println(strJsonData.);
		return "{\"msg\" : \"Hello AJAX~!\"}";		
	}
		
	@ResponseBody
	@RequestMapping(value="/member/checkId/{id}", method=RequestMethod.POST)
	public String checkId(@PathVariable("id") String data, Member member, Model model, HttpServletRequest request) {
		
		System.out.println(data);
		String idpw[] = data.split(",");
		
		String id = idpw[0];
		String password = idpw[1];
		
		member.setMember_id(id);
		member.setMember_pw(password);
		
		Map<String, Boolean> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		
		if(id == null || id.isEmpty()) {
			errors.put("id", Boolean.TRUE);
		}
		
		if(password == null || password.isEmpty()) {
			errors.put("password", Boolean.TRUE);
		}
				
		if(!errors.isEmpty()) {
			return "main/loginSuccessForm";
		}
	
		Member loginUser = service.memberLoginCheck(member);

		String msg;
		if(loginUser == null) {
			msg = "nodata";
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return "{\"value\" : \"" + msg + "\"}";			
		}else {
			msg = "data";
			
			User user = new User(loginUser.getMember_id(), loginUser.getMember_name());
			request.getSession().setAttribute("User", loginUser);
			
			 //파트너이면 로그인 하면서 가계 정보를 세션에 저장
			
			if(loginUser.getMember_type() == 1) {
			Store myStore = new Store();
			myStore.setMember_id(loginUser.getMember_id());
			myStore = storeService.selectStoreById(myStore);
			request.getSession().setAttribute("myStore", myStore);
			}
			return "{\"value\" : \"" + msg + "\"}";
		}		
				
	}

}
