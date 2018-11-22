package com.all.dao;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.all.model.QnaMemberArticle;

@Repository
public class QnaMemberArticleDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String strNameSpace = "com.jk.model.QnaMemberArticleMapper";

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 게시판 리스트
	public List<Object> qnaMemberList() {
		return sqlSession.selectList(strNameSpace + ".qnaMemberList");
	}

	// 게시글 보기
	public QnaMemberArticle qnaMemberContent(QnaMemberArticle qnaMemberArticle) {
		return sqlSession.selectOne(strNameSpace + ".qnaMemberContent", qnaMemberArticle);
	}

	// 게시글 작성
	public int qnaMemberWrite(QnaMemberArticle qnaMemberArticle) {
		return sqlSession.insert(strNameSpace + ".qnaMemberWrite", qnaMemberArticle);
	}

	// 게시글 수정
	public int qnaMemberUpdate(QnaMemberArticle qnaMemberArticle) {
		return sqlSession.update(strNameSpace + ".qnaMemberUpdate", qnaMemberArticle);
	}

	// 게시글 삭제
	public int qnaMemberDelete(QnaMemberArticle qnaMemberArticle) {
		return sqlSession.delete(strNameSpace + ".qnaMemberDelete", qnaMemberArticle);
	}

}
