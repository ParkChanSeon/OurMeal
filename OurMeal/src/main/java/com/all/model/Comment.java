package com.all.model;

import java.sql.Date;

public class Comment {
	
	private int fc_no;
	private int fb_no;
	private String member_id;
	private String fc_content;
	private Date fc_c_date;
	private Date fc_u_date;
	private Date fc_d_date;
	
	public int getFc_no() {
		return fc_no;
	}
	public void setFc_no(int fc_no) {
		this.fc_no = fc_no;
	}
	public int getFb_no() {
		return fb_no;
	}
	public void setFb_no(int fb_no) {
		this.fb_no = fb_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getFc_content() {
		return fc_content;
	}
	public void setFc_content(String fc_content) {
		this.fc_content = fc_content;
	}
	public Date getFc_c_date() {
		return fc_c_date;
	}
	public void setFc_c_date(Date fc_c_date) {
		this.fc_c_date = fc_c_date;
	}
	public Date getFc_u_date() {
		return fc_u_date;
	}
	public void setFc_u_date(Date fc_u_date) {
		this.fc_u_date = fc_u_date;
	}
	public Date getFc_d_date() {
		return fc_d_date;
	}
	public void setFc_d_date(Date fc_d_date) {
		this.fc_d_date = fc_d_date;
	}

}
