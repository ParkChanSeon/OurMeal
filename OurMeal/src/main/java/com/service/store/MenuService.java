package com.service.store;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.dao.*;
import com.all.model.*;

@Service
public class MenuService {
	
@Autowired
	private MenuDAO dao;

	
public List<Object> selectStoreMenu(Food_menu menu) {
	
	return dao.selectStoreMenu(menu);
}
	
	
	
	

}
