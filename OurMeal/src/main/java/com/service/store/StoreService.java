package com.service.store;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.dao.*;
import com.all.model.*;

@Service
public class StoreService {
	
	@Autowired
	private StoreDAO dao;

	
	public int storeInfo(Store store) {
		return dao.storeInfo(store);
	}
	
	// 선택된 스토어 불러오기
	public Store selectStore(Store store) {
		return dao.selectStore(store);
	}
	
	

}
