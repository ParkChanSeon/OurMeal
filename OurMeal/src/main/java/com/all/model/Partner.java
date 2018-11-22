package com.all.model;

import java.sql.Date;

public class Partner {
	
	private String member_id;
	private String partner_crn;
	private String partner_bl;
	private String partner_sd;
	private Date partner_date;
	
	//테스트용 맴버필드 임의로 추가
	private String partner_id;
	
	public String getPartner_id() {
		return partner_id;
	}
	public void setPartner_id(String partner_id) {
		this.partner_id = partner_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getPartner_crn() {
		return partner_crn;
	}
	public void setPartner_crn(String partner_crn) {
		this.partner_crn = partner_crn;
	}
	public String getPartner_bl() {
		return partner_bl;
	}
	public void setPartner_bl(String partner_bl) {
		this.partner_bl = partner_bl;
	}
	public String getPartner_sd() {
		return partner_sd;
	}
	public void setPartner_sd(String partner_sd) {
		this.partner_sd = partner_sd;
	}
	public Date getPartner_date() {
		return partner_date;
	}
	public void setPartner_date(Date partner_date) {
		this.partner_date = partner_date;
	}

}
