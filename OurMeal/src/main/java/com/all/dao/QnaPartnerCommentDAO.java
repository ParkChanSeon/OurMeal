package com.all.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.all.model.QnaPartnerComment;

@Repository
public class QnaPartnerCommentDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String strNameSpace = "QnaPartnerCommentMapper";
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 댓글 리스트
	public List<QnaPartnerComment> qnaPartnerCommentList(QnaPartnerComment comment) {
		return sqlSession.selectList(strNameSpace + ".QnaPartnerCommentList", comment);
	} 
	
	// 댓글 작성
	public int qnaPartnerCommentWrite(QnaPartnerComment comment) {
		return sqlSession.insert(strNameSpace + ".QnaPartnerCommentWrite", comment);
	}
	
	// 댓글 삭제
	public int qnaPartnerCommentDelete(QnaPartnerComment comment) {
		return sqlSession.delete(strNameSpace + ".QnaPartnerCommentDelete", comment);
	}

}
