package com.service.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.dao.QnaMemberCommentDAO;
import com.all.model.QnaMemberComment;

@Service
public class QnaMemberCommentService {

	@Autowired
	private QnaMemberCommentDAO dao;

	public void setDao(QnaMemberCommentDAO dao) {
		this.dao = dao;
	}

	// 댓글 리스트
	public List<QnaMemberComment> qnaMemberCommentList(QnaMemberComment Comment) {
		return this.dao.qnaMemberCommentList(Comment);
	}

	// 댓글 작성
	public int qnaMemberCommentWrite(QnaMemberComment comment) {
		return this.dao.qnaMemberCommentWrite(comment);
	}

	// 댓글 삭제
	public int qnaMemberCommentDelete(QnaMemberComment comment) {
		return this.dao.qnaMemberCommentDelete(comment);
	}

}
