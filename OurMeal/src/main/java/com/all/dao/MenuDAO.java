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
	
	public Object selectMenu(Food_menu menu) {
		
		return sqlSession.selectOne(strNameSpace+ ".selectMenu", menu);
	}
	
	
	// 알러지 다 불러오기
	public Object callAllergy() {
		return sqlSession.selectList(strNameSpace+ ".callAllergy");
	}
	
	// 메뉴 정보 수정하기
	public void modifyMenu(Food_menu menu) {
		
		sqlSession.update(strNameSpace+ ".modifyMenu", menu);
	}
	// 메뉴추가
	public void addMenu(Food_menu menu) {
		sqlSession.insert(strNameSpace+ ".addMenu", menu);
	}
	
	// 메뉴 삭제
	public void menuDelete(Food_menu menu) {
		sqlSession.delete(strNameSpace+ ".menuDelete", menu);
	}

}
