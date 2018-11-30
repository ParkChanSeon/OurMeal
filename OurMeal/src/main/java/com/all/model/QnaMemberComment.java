package com.all.model;

import java.sql.Date;

public class QnaMemberComment {
	
	private int mqb_no;
	private int mqc_no;
	private String admin_id;
	private String mqc_content;
	private Date mqc_c_date;
	private Date mqc_u_date;
	private Date mqc_d_date;
	
	public int getMqb_no() {
		return mqb_no;
	}
	public void setMqb_no(int mqb_no) {
		this.mqb_no = mqb_no;
	}
	public int getMqc_no() {
		return mqc_no;
	}
	public void setMqc_no(int mqc_no) {
		this.mqc_no = mqc_no;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getMqc_content() {
		return mqc_content;
	}
	public void setMqc_content(String mqc_content) {
		this.mqc_content = mqc_content;
	}
	public Date getMqc_c_date() {
		return mqc_c_date;
	}
	public void setMqc_c_date(Date mqc_c_date) {
		this.mqc_c_date = mqc_c_date;
	}
	public Date getMqc_u_date() {
		return mqc_u_date;
	}
	public void setMqc_u_date(Date mqc_u_date) {
		this.mqc_u_date = mqc_u_date;
	}
	public Date getMqc_d_date() {
		return mqc_d_date;
	}
	public void setMqc_d_date(Date mqc_d_date) {
		this.mqc_d_date = mqc_d_date;
	}

}
