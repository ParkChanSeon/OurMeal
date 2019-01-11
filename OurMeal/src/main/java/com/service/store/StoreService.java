package com.service.store;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.dao.*;
import com.all.model.*;

@Service
public class StoreService {
	
	@Autowired
	private StoreDAO dao;
@Autowired
private Store returnStore;
	
	public int storeInfo(Store store) {

		return dao.storeInfo(store);
	}
	
	
	
	
	
	// 선택된 스토어 불러오기
	public Store selectStore(Store store) {
		returnStore = dao.selectStore(store);
		
		if( returnStore != null )
		return returnStore;
		
		else 
		throw new StoreNotFoundException();
		
	}
	
	public Store selectStoreById(Store store) {
		returnStore = dao.selectStoreById(store);
		
		if( returnStore != null )
		return returnStore;
		
		else 
		throw new StoreNotFoundException();
		
	}
	
	public List<Store> search(Map<String, Object> map) {
		return dao.search(map);
	}
	
	
	
	

}
