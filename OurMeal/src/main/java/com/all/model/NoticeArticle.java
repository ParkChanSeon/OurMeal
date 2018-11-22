package com.all.model;

import java.sql.Date;

public class NoticeArticle {
	
	private int notice_no;
	private String notice_title;
	private String admin_id;
	private String notice_content;
	private String notice_image;
	private int notice_count;
	private Date notice_c_date;
	private Date notice_u_date;
	private Date notice_d_date;
	
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_image() {
		return notice_image;
	}
	public void setNotice_image(String notice_image) {
		this.notice_image = notice_image;
	}
	public int getNotice_count() {
		return notice_count;
	}
	public void setNotice_count(int notice_count) {
		this.notice_count = notice_count;
	}
	public Date getNotice_c_date() {
		return notice_c_date;
	}
	public void setNotice_c_date(Date notice_c_date) {
		this.notice_c_date = notice_c_date;
	}
	public Date getNotice_u_date() {
		return notice_u_date;
	}
	public void setNotice_u_date(Date notice_u_date) {
		this.notice_u_date = notice_u_date;
	}
	public Date getNotice_d_date() {
		return notice_d_date;
	}
	public void setNotice_d_date(Date notice_d_date) {
		this.notice_d_date = notice_d_date;
	}

}
