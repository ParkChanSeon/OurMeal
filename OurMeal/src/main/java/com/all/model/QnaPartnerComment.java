package com.all.model;

import java.sql.Date;

public class QnaPartnerComment {
	
	private int pqb_no;
	private int pqc_no;
	private String admin_id;
	private String pqc_content;
	private Date pqc_c_date;
	private Date pqc_u_date;
	private Date pqc_d_date;
	
	public int getPqb_no() {
		return pqb_no;
	}
	public void setPqb_no(int pqb_no) {
		this.pqb_no = pqb_no;
	}
	public int getPqc_no() {
		return pqc_no;
	}
	public void setPqc_no(int pqc_no) {
		this.pqc_no = pqc_no;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getPqc_content() {
		return pqc_content;
	}
	public void setPqc_content(String pqc_content) {
		this.pqc_content = pqc_content;
	}
	public Date getPqc_c_date() {
		return pqc_c_date;
	}
	public void setPqc_c_date(Date pqc_c_date) {
		this.pqc_c_date = pqc_c_date;
	}
	public Date getPqc_u_date() {
		return pqc_u_date;
	}
	public void setPqc_u_date(Date pqc_u_date) {
		this.pqc_u_date = pqc_u_date;
	}
	public Date getPqc_d_date() {
		return pqc_d_date;
	}
	public void setPqc_d_date(Date pqc_d_date) {
		this.pqc_d_date = pqc_d_date;
	}

}
