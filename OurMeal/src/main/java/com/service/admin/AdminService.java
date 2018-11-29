package com.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.dao.AdminDAO;



@Service
public class AdminService {

	@Autowired
	private AdminDAO dao;

	public void setDao(AdminDAO dao) {
		this.dao = dao;
	}
	
	// 관리자로그인
	/*
	public Admin adminLogin(Admin admin) {
		return this.dao.adminLogin(admin);
	}
	
	//관리자 로그인체크
	public Admin adminLoginCheck(Admin admin) {
		return this.dao.adminLoginCheck(admin);
	} 
	*/
	
	//승인 목록 가져오기
	public List<Object> partnerList(){
		return this.dao.partnerList();
	}
	
	//member 승인
	public int memberConfirm(String id) {
		return this.dao.memberConfirm(id);
	}

}
