package com.service.articles;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.dao.QnaPartnerArticleDAO;
import com.all.model.FreeArticle;
import com.all.model.QnaPartnerArticle;

@Service
public class QnaPartnerArticleService {

	@Autowired
	private QnaPartnerArticleDAO dao;

	public void setDao(QnaPartnerArticleDAO dao) {
		this.dao = dao;
	}

	// 게시판 리스트
	public List<Object> qnaPartnerList() {
		return this.dao.qnaPartnerList();
	}

	// 게시글 보기
	public QnaPartnerArticle qnaPartnerContent(QnaPartnerArticle qnaPartnerArticle) {
		return this.dao.qnaPartnerContent(qnaPartnerArticle);
	}

	// 게시글 작성
	public int qnaPartnerWrite(QnaPartnerArticle qnaPartnerArticle) {
		return this.dao.qnaPartnerWrite(qnaPartnerArticle);
	}

	// 게시글 수정
	public int qnaPartnerUpdate(QnaPartnerArticle qnaPartnerArticle) {
		return this.dao.qnaPartnerUpdate(qnaPartnerArticle);
	}

	// 게시글 삭제
	public int qnaPartnerDelete(QnaPartnerArticle qnaPartnerArticle) {
		return this.dao.qnaPartnerDelete(qnaPartnerArticle);
	}

	// 게시글 조회수
	public int qnaPartnerCount(QnaPartnerArticle qnaPartnerArticle) {
		return this.dao.qnaPartnerCount(qnaPartnerArticle);
	}

	// 게시판 검색
	public List<QnaPartnerArticle> qnaPartnerSearch(HashMap<String, String> map) {
		return this.dao.qnaPartnerSearch(map);
	}

}
