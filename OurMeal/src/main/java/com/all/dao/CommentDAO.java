package com.all.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.all.model.Comment;

@Repository
public class CommentDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String strNameSpace = "com.jk.model.CommentMapper";
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 댓글 리스트
	public List<Comment> commentList() {
		return sqlSession.selectList(strNameSpace + ".commentList");
	}
	
	// 댓글 작성
	public int commentWrite(Comment comment) {
		return sqlSession.insert(strNameSpace + ".commentWrite", comment);
	}
	
	// 댓글 삭제
	public int commentDelete(Comment comment) {
		return sqlSession.delete(strNameSpace + ".commentDelete", comment);
	}

}
