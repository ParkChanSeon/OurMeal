package com.all.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.all.model.QnaMemberComment;

@Repository
public class QnaMemberCommentDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String strNameSpace = "QnaMemberCommentMapper";
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 댓글 리스트
	public List<QnaMemberComment> qnaMemberCommentList(QnaMemberComment comment) {
		return sqlSession.selectList(strNameSpace + ".qnaMemberCommentList", comment);
	}
	
	// 댓글 작성
	public int qnaMemberCommentWrite(QnaMemberComment comment) {
		return sqlSession.insert(strNameSpace + ".qnaMemberCommentWrite", comment);
	}
	
	// 댓글 삭제
	public int qnaMemberCommentDelete(QnaMemberComment comment) {
		return sqlSession.delete(strNameSpace + ".qnaMemberCommentDelete", comment);
	}

}
