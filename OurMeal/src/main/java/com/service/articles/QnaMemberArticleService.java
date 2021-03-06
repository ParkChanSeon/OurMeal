package com.service.articles;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.dao.QnaMemberArticleDAO;
import com.all.model.FreeArticle;
import com.all.model.NoticeArticle;
import com.all.model.QnaMemberArticle;

@Service
public class QnaMemberArticleService {

	@Autowired
	private QnaMemberArticleDAO dao;

	public void setDao(QnaMemberArticleDAO dao) {
		this.dao = dao;
	}

	// 게시판 리스트
	public List<Object> qnaMemberList() {
		return this.dao.qnaMemberList();
	}

	// 게시글 보기
	public QnaMemberArticle qnaMemberContent(QnaMemberArticle qnaMemberArticle) {
		return this.dao.qnaMemberContent(qnaMemberArticle);
	}

	// 게시글 작성
	public int qnaMemberWrite(QnaMemberArticle qnaMemberArticle) {
		return this.dao.qnaMemberWrite(qnaMemberArticle);
	}

	// 게시글 수정
	public int qnaMemberUpdate(QnaMemberArticle qnaMemberArticle) {
		return this.dao.qnaMemberUpdate(qnaMemberArticle);
	}

	// 게시글 삭제
	public int qnaMemberDelete(QnaMemberArticle qnaMemberArticle) {
		return this.dao.qnaMemberDelete(qnaMemberArticle);
	}

	// 게시글 조회수
	public int qnaMemberCount(QnaMemberArticle qnaMemberArticle) {
		return this.dao.qnaMemberCount(qnaMemberArticle);
	}

	// 게시판 검색
	public List<QnaMemberArticle> qnaMemberSearch(HashMap<String, String> map) {
		return this.dao.qnaMemberSearch(map);
	}

}
