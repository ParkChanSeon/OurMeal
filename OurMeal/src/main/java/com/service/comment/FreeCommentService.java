package com.service.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.dao.FreeCommentDAO;
import com.all.model.FreeComment;

@Service
public class FreeCommentService {

	@Autowired
	private FreeCommentDAO dao;

	public void setDao(FreeCommentDAO dao) {
		this.dao = dao;
	}

	// 댓글 리스트
	public List<FreeComment> freeCommentList(FreeComment freeComment) {
		return this.dao.freeCommentList(freeComment);
	}

	// 댓글 작성
	public int freeCommentWrite(FreeComment comment) {
		return this.dao.freeCommentWrite(comment);
	}

	// 댓글 삭제
	public int freeCommentDelete(FreeComment comment) {
		return this.dao.freeCommentDelete(comment);
	}

}
