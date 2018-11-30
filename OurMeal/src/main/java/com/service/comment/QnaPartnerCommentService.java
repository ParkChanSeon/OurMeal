package com.service.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.dao.QnaPartnerCommentDAO;
import com.all.model.QnaPartnerComment;

@Service
public class QnaPartnerCommentService {

	@Autowired
	private QnaPartnerCommentDAO dao;

	public void setDao(QnaPartnerCommentDAO dao) {
		this.dao = dao;
	}

	// 댓글 리스트
	public List<QnaPartnerComment> qnaPartnerCommentList(QnaPartnerComment Comment) {
		return this.dao.qnaPartnerCommentList(Comment);
	}

	// 댓글 작성
	public int qnaPartnerCommentWrite(QnaPartnerComment comment) {
		return this.dao.qnaPartnerCommentWrite(comment);
	}

	// 댓글 삭제
	public int qnaPartnerCommentDelete(QnaPartnerComment comment) {
		return this.dao.qnaPartnerCommentDelete(comment);
	}

}
