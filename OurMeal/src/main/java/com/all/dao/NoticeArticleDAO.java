package com.all.dao;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.all.model.FreeArticle;
import com.all.model.NoticeArticle;

@Repository
public class NoticeArticleDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String strNameSpace = "com.jk.model.NoticeArticleMapper";

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 게시판 리스트
	public List<Object> noticeList() {
		return sqlSession.selectList(strNameSpace + ".noticeList");
	}

	// 게시글 보기
	public NoticeArticle noticeContent(NoticeArticle noticeArticle) {
		return sqlSession.selectOne(strNameSpace + ".noticeContent", noticeArticle);
	}

	// 게시글 작성
	public int noticeWrite(NoticeArticle noticeArticle) {
		return sqlSession.insert(strNameSpace + ".noticeWrite", noticeArticle);
	}

	// 게시글 수정
	public int noticeUpdate(NoticeArticle noticeArticle) {
		return sqlSession.update(strNameSpace + ".noticeUpdate", noticeArticle);
	}

	// 게시글 삭제
	public int noticeDelete(NoticeArticle noticeArticle) {
		return sqlSession.delete(strNameSpace + ".noticeDelete", noticeArticle);
	}

	// 게시글 카운트
	public int noticeCount(NoticeArticle noticeArticle) {
		return sqlSession.update(strNameSpace + ".noticeCount", noticeArticle);
	}

	// 게시판 검색
	public List<NoticeArticle> noticeSearch(HashMap<String, String> map) {
		return sqlSession.selectList(strNameSpace + ".noticeSearch", map);
	}

}
