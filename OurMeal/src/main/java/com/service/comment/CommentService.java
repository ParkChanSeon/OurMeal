package com.service.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.dao.CommentDAO;
import com.all.model.Comment;

@Service
public class CommentService {

	@Autowired
	private CommentDAO dao;

	public void setDao(CommentDAO dao) {
		this.dao = dao;
	}

	// 댓글 리스트
	public List<Comment> commentList() {
		return this.dao.commentList();
	}

	// 댓글 작성
	public int commentWrite(Comment comment) {
		return this.dao.commentWrite(comment);
	}

	// 댓글 삭제
	public int commentDelete(Comment comment) {
		return this.dao.commentDelete(comment);
	}

}
