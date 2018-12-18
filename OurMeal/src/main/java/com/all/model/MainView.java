package com.all.model;

public class MainView {
	private String store_code;
	private String store_title;
	private Double avg_score;
	private String store_image;
	private String store_address;	
	
	public MainView() {
		super();
	}
	public MainView(String store_code, String store_title, Double avg_score, String store_image, String store_address) {
		super();
		this.store_code = store_code;
		this.store_title = store_title;
		this.avg_score = avg_score;
		this.store_image = store_image;
		this.store_address = store_address;
	}
	public String getStore_code() {
		return store_code;
	}
	public void setStore_code(String store_code) {
		this.store_code = store_code;
	}
	public String getStore_title() {
		return store_title;
	}
	public void setStore_title(String store_title) {
		this.store_title = store_title;
	}
	public Double getAvg_score() {
		return avg_score;
	}
	public void setAvg_score(Double avg_score) {
		this.avg_score = avg_score;
	}
	public String getStore_image() {
		return store_image;
	}
	public void setStore_image(String store_image) {
		this.store_image = store_image;
	}
	public String getStore_address() {
		return store_address;
	}
	public void setStore_address(String store_address) {
		this.store_address = store_address;
	}
	
	
}
