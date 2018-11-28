package com.all.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.all.model.FreeComment;

@Repository
public class FreeCommentDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String strNameSpace = "FreeCommentMapper";
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 댓글 리스트
	public List<FreeComment> FreeCommentList() {
		return sqlSession.selectList(strNameSpace + ".FreeCommentList");
	}
	
	// 댓글 작성
	public int FreeCommentWrite(FreeComment comment) {
		return sqlSession.insert(strNameSpace + ".FreeCommentWrite", comment);
	}
	
	// 댓글 삭제
	public int FreeCommentDelete(FreeComment comment) {
		return sqlSession.delete(strNameSpace + ".FreeCommentDelete", comment);
	}

}
