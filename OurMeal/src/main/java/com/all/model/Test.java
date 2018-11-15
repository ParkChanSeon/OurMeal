package com.all.model;

import org.springframework.stereotype.Repository;

@Repository
public class Test {

	private int store_id;
	private String store_title;
	private String store_info;
	private String store_loc;
	
	
	public Test() {}
	
	
	public Test(int store_id, String store_title, String store_info, String store_loc) {
		
		this.store_id = store_id;
		this.store_title = store_title;
		this.store_info = store_info;
		this.store_loc = store_loc;
	}
	public int getStore_id() {
		return store_id;
	}
	public void setStore_id(int store_id) {
		this.store_id = store_id;
	}
	public String getStore_title() {
		return store_title;
	}
	public void setStore_title(String store_title) {
		this.store_title = store_title;
	}
	public String getStore_info() {
		return store_info;
	}
	public void setStore_info(String store_info) {
		this.store_info = store_info;
	}
	public String getStore_loc() {
		return store_loc;
	}
	public void setStore_loc(String store_loc) {
		this.store_loc = store_loc;
	}
	
	
	
	
	
}
