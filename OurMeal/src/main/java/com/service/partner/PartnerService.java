package com.service.partner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.dao.*;
import com.all.model.*;

@Service
public class PartnerService {
	
	@Autowired
	private PartnerDAO dao;

	public void setDao(PartnerDAO dao) {
		this.dao = dao;
	}

	// 회원가입
	public int partnerRegist(Partner partner) {
		return this.dao.partnerRegist(partner);
	}

	// 로그인
	public Partner partnerLogin(Partner partner) {
		return this.dao.partnerLogin(partner);
	}

	// 사업자페이지
	public Partner partnerPage(Partner partner) {
		return this.dao.partnerPage(partner);
	}

	// 사업자정보수정
	public int partnerUpdate(Partner partner) {
		return this.dao.partnerUpdate(partner);
	}

	// 사업자탈퇴
	public int partnerDelete(Partner partner) {
		return this.dao.partnerDelete(partner);
	}

}
