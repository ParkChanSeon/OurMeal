package com.all.model;

import java.sql.Date;

public class FreeArticle {
	
	private int fb_no;
	private String fb_title;
	private String member_id;
	private String fb_content;
	private String fb_image;
	private int fb_count;
	private Date fb_c_date;
	private Date fb_u_date;
	private Date fb_d_date;
	
	public int getFb_no() {
		return fb_no;
	}
	public void setFb_no(int fb_no) {
		this.fb_no = fb_no;
	}
	public String getFb_title() {
		return fb_title;
	}
	public void setFb_title(String fb_title) {
		this.fb_title = fb_title;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getFb_content() {
		return fb_content;
	}
	public void setFb_content(String fb_content) {
		this.fb_content = fb_content;
	}
	public String getFb_image() {
		return fb_image;
	}
	public void setFb_image(String fb_image) {
		this.fb_image = fb_image;
	}
	public int getFb_count() {
		return fb_count;
	}
	public void setFb_count(int fb_count) {
		this.fb_count = fb_count;
	}
	public Date getFb_c_date() {
		return fb_c_date;
	}
	public void setFb_c_date(Date fb_c_date) {
		this.fb_c_date = fb_c_date;
	}
	public Date getFb_u_date() {
		return fb_u_date;
	}
	public void setFb_u_date(Date fb_u_date) {
		this.fb_u_date = fb_u_date;
	}
	public Date getFb_d_date() {
		return fb_d_date;
	}
	public void setFb_d_date(Date fb_d_date) {
		this.fb_d_date = fb_d_date;
	}

}
