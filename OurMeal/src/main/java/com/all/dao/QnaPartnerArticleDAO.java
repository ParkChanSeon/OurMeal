package com.all.dao;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.all.model.QnaPartnerArticle;

@Repository
public class QnaPartnerArticleDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String strNameSpace = "com.jk.model.QnaPartnerArticleMapper";

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 게시판 리스트
	public List<Object> qnaPartnerList() {
		return sqlSession.selectList(strNameSpace + ".qnaPartnerList");
	}

	// 게시글 보기
	public QnaPartnerArticle qnaPartnerContent(QnaPartnerArticle qnaPartnerArticle) {
		return sqlSession.selectOne(strNameSpace + ".qnaPartnerContent", qnaPartnerArticle);
	}

	// 게시글 작성
	public int qnaPartnerWrite(QnaPartnerArticle qnaPartnerArticle) {
		return sqlSession.insert(strNameSpace + ".qnaPartnerWrite", qnaPartnerArticle);
	}

	// 게시글 수정
	public int qnaPartnerUpdate(QnaPartnerArticle qnaPartnerArticle) {
		return sqlSession.update(strNameSpace + ".qnaPartnerUpdate", qnaPartnerArticle);
	}

	// 게시글 삭제
	public int qnaPartnerDelete(QnaPartnerArticle qnaPartnerArticle) {
		return sqlSession.delete(strNameSpace + ".qnaPartnerDelete", qnaPartnerArticle);
	}

}
