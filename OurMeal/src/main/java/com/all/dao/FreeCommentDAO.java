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
	public List<FreeComment> freeCommentList(FreeComment freeComment) {
		return sqlSession.selectList(strNameSpace + ".freeCommentList", freeComment);
	}
	
	// 댓글 작성
	public int freeCommentWrite(FreeComment comment) {
		return sqlSession.insert(strNameSpace + ".freeCommentWrite", comment);
	}
	
	// 댓글 삭제
	public int freeCommentDelete(FreeComment comment) {
		return sqlSession.delete(strNameSpace + ".freeCommentDelete", comment);
	}

}
