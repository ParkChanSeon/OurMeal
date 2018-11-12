package com.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.dao.AdminDAO;
import com.all.model.Admin;

@Service
public class AdminService {

	@Autowired
	private AdminDAO dao;

	// 관리자로그인
	public Admin adminLogin(Admin admin) {
		return this.dao.adminLogin(admin);
	}

}
