package com.all.model;

public class Health {	
	private String health_no;
	private String member_id;
	private Double health_height;
	private Double health_weight;
	private int health_basal;
	
	
	
	public Health() {
		super();
	}
	public String getHealth_no() {
		return health_no;
	}
	public void setHealth_no(String health_no) {
		this.health_no = health_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Double getHealth_height() {
		return health_height;
	}
	public void setHealth_height(Double health_height) {
		this.health_height = health_height;
	}
	public Double getHealth_weight() {
		return health_weight;
	}
	public void setHealth_weight(Double health_weight) {
		this.health_weight = health_weight;
	}
	public int getHealth_basal() {
		return health_basal;
	}
	public void setHealth_basal(int health_basal) {
		this.health_basal = health_basal;
	}

}
