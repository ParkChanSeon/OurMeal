package com.controller.article.qna.partner;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.Member;
import com.all.model.QnaPartnerArticle;
import com.all.model.QnaPartnerComment;
import com.service.articles.QnaPartnerArticleService;
import com.service.comment.QnaMemberCommentService;
import com.service.comment.QnaPartnerCommentService;

@Controller
public class QnaPartnerListController {

	@Autowired
	private QnaPartnerArticleService service;
	@Autowired
	private QnaPartnerCommentService commentService;

	@RequestMapping(value = "/qnaPartnerWrite", method = RequestMethod.GET)
	public String qnaPartnerWrite() {

		return "article/qnaPartnerWriteForm";

	}

	@RequestMapping(value = "/qnaPartnerList", method = RequestMethod.GET)
	public String qnaPartnerList(Model model, HttpSession session) {

		Member member = (Member) session.getAttribute("User");

		if (member == null || member.getMember_type() != 1) {
			model.addAttribute("userCheck", false);
		}

		model.addAttribute("qnaPartnerList", service.qnaPartnerList());

		return "article/qnaPartnerListForm";

	}

	@RequestMapping(value = "/qnaPartnerContent", method = RequestMethod.GET)
	public String qnaPartnerContent(Model model, HttpSession session, @RequestParam("pageNo") String no) {

		QnaPartnerArticle qnaPartnerArticle = new QnaPartnerArticle();
		QnaPartnerComment partnerComment = new QnaPartnerComment();

		qnaPartnerArticle.setPqb_no(Integer.parseInt(no));
		partnerComment.setPqb_no(Integer.parseInt(no));

		QnaPartnerArticle board = service.qnaPartnerContent(qnaPartnerArticle);
		List<QnaPartnerComment> comment = commentService.qnaPartnerCommentList(partnerComment);
		Member member = (Member) session.getAttribute("User");
		try {
			String writer_id = board.getMember_id();
			String login_id = member.getMember_id();

			if (writer_id.equals(login_id) || member.getMember_type() != 9) {
				model.addAttribute("userCheck", login_id);
			}

			model.addAttribute("qnaPartnerContent", board);
			model.addAttribute("qnaPartnerCommentList", comment);
			
			return "article/qnaPartnerContentForm";
			
		} catch (Exception e) {
			model.addAttribute("commentCheck", false);
			model.addAttribute("qnaPartnerContent", board);
			model.addAttribute("qnaPartnerCommentList", comment);
			return "article/qnaPartnerContentForm";
		}
	}

}
