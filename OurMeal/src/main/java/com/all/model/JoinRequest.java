package com.all.model;


import java.util.Date;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class JoinRequest {

	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_email;
	private String member_phone;
	private String member_birth;
	private String member_sex;
	private String member_address;
	private String member_ConfirmPassword;
	
	
	


	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public String getMember_pw() {
		return member_pw;
	}


	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}


	public String getMember_name() {
		return member_name;
	}


	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}


	public String getMember_email() {
		return member_email;
	}


	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}


	public String getMember_phone() {
		return member_phone;
	}


	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}


	public String getMember_birth() {
		return member_birth;
	}


	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}


	public String getMember_sex() {
		return member_sex;
	}


	public void setMember_sex(String member_sex) {
		this.member_sex = member_sex;
	}



	public String getMember_address() {
		return member_address;
	}


	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}


	public void setMember_ConfirmPassword(String member_ConfirmPassword) {
		this.member_ConfirmPassword = member_ConfirmPassword;
	}


	public String getMember_ConfirmPassword() {
		return member_ConfirmPassword;
	}


	public void setConfirmPassword(String member_ConfirmPassword) {
		this.member_ConfirmPassword = member_ConfirmPassword;
	}


	public boolean isPasswordEqualToConfirm() {
		return member_pw != null && member_pw.equals(member_ConfirmPassword); 
	}
	
		
	public void validate(Map<String, Boolean> errors) {
		
		
		
		
		checkEmpty(errors, member_id,"member_id");
		checkEmpty(errors, member_pw, "member_pw");
		checkEmpty(errors, member_name, "member_name");
		checkEmpty(errors, member_email,"member_email");
		checkEmpty(errors, member_phone, "member_phone");
		checkEmpty(errors, member_birth, "member_birth");
		checkEmpty(errors, member_sex,"member_sex");
		checkEmpty(errors, member_address, "member_address");
		checkEmpty(errors, member_ConfirmPassword, "member_ConfirmPassword");
		
		
		if(!errors.containsKey("member_ConfirmPassword")) {
			if(!isPasswordEqualToConfirm()) {
				errors.put("notMatch", Boolean.TRUE);
			}
		}
	}

	private void checkEmpty(Map<String, Boolean> errors, 
			Object value, String fieldName) {
		if(value == null|| ((String) value).isEmpty())
			errors.put(fieldName, Boolean.TRUE);	
	}
}
