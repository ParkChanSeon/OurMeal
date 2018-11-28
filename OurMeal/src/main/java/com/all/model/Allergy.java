package com.all.model;

import org.springframework.stereotype.Repository;

@Repository
public class Allergy {
	private String allergy_code;
	private String allergy_name;
	
	public Allergy() {}
	public Allergy(String allergy_code, String allergy_name) {
		
		this.allergy_code = allergy_code;
		this.allergy_name = allergy_name;
	}
	public String getAllergy_code() {
		return allergy_code;
	}
	public void setAllergy_code(String allergy_code) {
		this.allergy_code = allergy_code;
	}
	public String getAllergy_name() {
		return allergy_name;
	}
	public void setAllergy_name(String allergy_name) {
		this.allergy_name = allergy_name;
	}
	
	
	
	
}
