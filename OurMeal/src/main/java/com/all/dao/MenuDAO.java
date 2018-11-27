package com.all.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.all.model.Food_menu;
import com.all.model.JoinRequest;
import com.all.model.Member;
import com.all.model.Store;

@Repository
public class MenuDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String strNameSpace = "com.jk.model.StoreMapper";
	
	public List<Object> selectStoreMenu(Food_menu menu){
		
		return sqlSession.selectList(strNameSpace + ".selectStoreMenu", menu);
	}
	
	

}
