package com.all.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.all.model.FreeArticle;

@Repository
public class FreeArticleDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String strNameSpace = "com.jk.model.FreeArticleMapper";

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 게시판 리스트
	public FreeArticle freeList(FreeArticle freeArticle) {
		return sqlSession.selectOne(strNameSpace + ".freeList", freeArticle);
	}

	// 게시글 보기
	public FreeArticle freeContent(FreeArticle freeArticle) {
		return sqlSession.selectOne(strNameSpace + ".freeContent", freeArticle);
	}

	// 게시글 작성
	public int freeWrite(FreeArticle freeArticle) {
		return sqlSession.insert(strNameSpace + ".freeWrite", freeArticle);
	}

	// 게시글 수정
	public int freeUpdate(FreeArticle freeArticle) {
		return sqlSession.update(strNameSpace + ".freeUpdate", freeArticle);
	}

	// 게시글 삭제
	public int freeDelete(FreeArticle freeArticle) {
		return sqlSession.delete(strNameSpace + ".freeDelete", freeArticle);
	}

}
