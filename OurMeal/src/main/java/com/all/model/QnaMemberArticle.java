package com.all.model;

import java.sql.Date;

public class QnaMemberArticle {
	
	private int mqb_no;
	private String mqb_title;
	private String member_id;
	private String mqb_content;
	private int mqb_count;
	private Date mqb_c_date;
	private Date mqb_u_date;
	private Date mqb_d_date;
	
	public int getMqb_no() {
		return mqb_no;
	}
	public void setMqb_no(int mqb_no) {
		this.mqb_no = mqb_no;
	}
	public String getMqb_title() {
		return mqb_title;
	}
	public void setMqb_title(String mqb_title) {
		this.mqb_title = mqb_title;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMqb_content() {
		return mqb_content;
	}
	public void setMqb_content(String mqb_content) {
		this.mqb_content = mqb_content;
	}
	public int getMqb_count() {
		return mqb_count;
	}
	public void setMqb_count(int mqb_count) {
		this.mqb_count = mqb_count;
	}
	public Date getMqb_c_date() {
		return mqb_c_date;
	}
	public void setMqb_c_date(Date mqb_c_date) {
		this.mqb_c_date = mqb_c_date;
	}
	public Date getMqb_u_date() {
		return mqb_u_date;
	}
	public void setMqb_u_date(Date mqb_u_date) {
		this.mqb_u_date = mqb_u_date;
	}
	public Date getMqb_d_date() {
		return mqb_d_date;
	}
	public void setMqb_d_date(Date mqb_d_date) {
		this.mqb_d_date = mqb_d_date;
	}
	
}
