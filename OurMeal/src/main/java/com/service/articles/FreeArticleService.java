package com.service.articles;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.dao.FreeArticleDAO;
import com.all.model.FreeArticle;

@Service
public class FreeArticleService {
	
	@Autowired
	private FreeArticleDAO dao;
	
	public void setDao(FreeArticleDAO dao) {
		this.dao = dao;
	}

	// 게시판 리스트
	public List<FreeArticle> freeList() {
		return this.dao.freeList();
	}

	// 게시글 보기
	public FreeArticle freeContent(FreeArticle freeArticle) {
		return this.dao.freeContent(freeArticle);
	}

	// 게시글 작성
	public int freeWrite(FreeArticle freeArticle) {
		return this.dao.freeWrite(freeArticle);
	}

	// 게시글 수정
	public int freeUpdate(FreeArticle freeArticle) {
		return this.dao.freeUpdate(freeArticle);
	}

	// 게시글 삭제
	public int freeDelete(FreeArticle freeArticle) {
		return this.dao.freeDelete(freeArticle);
	}
}
