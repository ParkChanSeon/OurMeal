package com.all.model;

import java.sql.Date;

public class Chatting {
	private int chat_no;
	private String admin_id;
	private String member_id;
	Date chat_s_time;
	Date chat_e_time;
	private String chat_log;
	
	
	
	public Chatting() {
		super();
	}



	public Chatting(int chat_no, String admin_id, String member_id, Date chat_s_time, Date chat_e_time,
			String chat_log) {
		super();
		this.chat_no = chat_no;
		this.admin_id = admin_id;
		this.member_id = member_id;
		this.chat_s_time = chat_s_time;
		this.chat_e_time = chat_e_time;
		this.chat_log = chat_log;
	}



	public int getChat_no() {
		return chat_no;
	}



	public void setChat_no(int chat_no) {
		this.chat_no = chat_no;
	}



	public String getAdmin_id() {
		return admin_id;
	}



	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}



	public String getMember_id() {
		return member_id;
	}



	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}



	public Date getChat_s_time() {
		return chat_s_time;
	}



	public void setChat_s_time(Date chat_s_time) {
		this.chat_s_time = chat_s_time;
	}



	public Date getChat_e_time() {
		return chat_e_time;
	}



	public void setChat_e_time(Date chat_e_time) {
		this.chat_e_time = chat_e_time;
	}



	public String getChat_log() {
		return chat_log;
	}



	public void setChat_log(String chat_log) {
		this.chat_log = chat_log;
	}
	
	
	
}