package com.service.partner;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.dao.PartnerDAO;
import com.all.model.Partner;

@Service
public class PartnerService {
	
	@Autowired
	private PartnerDAO dao;
	
	public void setDao(PartnerDAO dao) {
		this.dao = dao;
	}
	
	public int getRecordCount() {
		return this.dao.getRecordCount();
	}
	
	public List<Partner> selectList() {
		return this.dao.selectList();
	}
	
	public Partner selectOne(Partner partner) {
		return this.dao.selectOne(partner);
	}
	
	public int insert(Partner partner) {
		return this.dao.insert(partner);
	}
	
	public int deleteOne(Partner partner) {
		return this.dao.deleteOne(partner);
	}

}
