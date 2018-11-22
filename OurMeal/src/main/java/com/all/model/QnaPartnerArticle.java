package com.all.model;

import java.sql.Date;

public class QnaPartnerArticle {
	
	private int pqb_no;
	private String pqb_title;
	private String member_id;
	private String pqb_content;
	private String pqb_image;
	private int pqb_count;
	private Date pqb_c_date;
	private Date pqb_u_date;
	private Date pqb_d_date;
	
	//테스트용 맴버필드 임의로 추가
	private String partner_id;
	
	public String getPartner_id() {
		return partner_id;
	}
	public void setPartner_id(String partner_id) {
		this.partner_id = partner_id;
	}
	public int getPqb_no() {
		return pqb_no;
	}
	public void setPqb_no(int pqb_no) {
		this.pqb_no = pqb_no;
	}
	public String getPqb_title() {
		return pqb_title;
	}
	public void setPqb_title(String pqb_title) {
		this.pqb_title = pqb_title;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getPqb_content() {
		return pqb_content;
	}
	public void setPqb_content(String pqb_content) {
		this.pqb_content = pqb_content;
	}
	public String getPqb_image() {
		return pqb_image;
	}
	public void setPqb_image(String pqb_image) {
		this.pqb_image = pqb_image;
	}
	public int getPqb_count() {
		return pqb_count;
	}
	public void setPqb_count(int pqb_count) {
		this.pqb_count = pqb_count;
	}
	public Date getPqb_c_date() {
		return pqb_c_date;
	}
	public void setPqb_c_date(Date pqb_c_date) {
		this.pqb_c_date = pqb_c_date;
	}
	public Date getPqb_u_date() {
		return pqb_u_date;
	}
	public void setPqb_u_date(Date pqb_u_date) {
		this.pqb_u_date = pqb_u_date;
	}
	public Date getPqb_d_date() {
		return pqb_d_date;
	}
	public void setPqb_d_date(Date pqb_d_date) {
		this.pqb_d_date = pqb_d_date;
	}

}
