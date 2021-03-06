package com.service.articles;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.dao.NoticeArticleDAO;
import com.all.model.FreeArticle;
import com.all.model.NoticeArticle;

@Service
public class NoticeArticleService {

	@Autowired
	private NoticeArticleDAO dao;

	public void setDao(NoticeArticleDAO dao) {
		this.dao = dao;
	}

	// 게시판 리스트
	public List<Object> noticeList() {
		return this.dao.noticeList();
	}

	// 게시글 보기
	public NoticeArticle noticeContent(NoticeArticle noticeArticle) {
		return this.dao.noticeContent(noticeArticle);
	}

	// 게시글 작성
	public int noticeWrite(NoticeArticle noticeArticle) {
		return this.dao.noticeWrite(noticeArticle);
	}

	// 게시글 수정
	public int noticeUpdate(NoticeArticle noticeArticle) {
		return this.dao.noticeUpdate(noticeArticle);
	}

	// 게시글 삭제
	public int noticeDelete(NoticeArticle noticeArticle) {
		return this.dao.noticeDelete(noticeArticle);
	}

	// 게시글 조회수
	public int noticeCount(NoticeArticle noticeArticle) {
		return this.dao.noticeCount(noticeArticle);
	}

	// 게시판 검색
	public List<NoticeArticle> noticeSearch(HashMap<String, String> map) {
		return this.dao.noticeSearch(map);
	}

}
