package com.controller.article.qna.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.Member;
import com.all.model.QnaMemberArticle;
import com.service.articles.QnaMemberArticleService;

@Controller
public class QnaMemberListController {

	@Autowired
	private QnaMemberArticleService service;

	@RequestMapping(value = "/qnaMemberWrite", method = RequestMethod.GET)
	public String qnaMemberWrite() {

		return "article/qnaMemberWriteForm";

	}

	@RequestMapping(value = "/qnaMemberList", method = RequestMethod.GET)
	public String qnaMemberList(Model model, HttpSession session) {

		Member member = (Member) session.getAttribute("User");

		if (member == null || member.getMember_type() != 0) {
			model.addAttribute("userCheck", false);
		}

		model.addAttribute("qnaMemberList", service.qnaMemberList());

		return "article/qnaMemberListForm";

	}

	@RequestMapping(value = "/qnaMemberContent", method = RequestMethod.GET)
	public String qnaMemberContent(Model model, HttpSession session, @RequestParam("pageNo") String no) {

		QnaMemberArticle qnaMemberArticle = new QnaMemberArticle();

		qnaMemberArticle.setMqb_no(Integer.parseInt(no));

		QnaMemberArticle board = service.qnaMemberContent(qnaMemberArticle);
		Member member = (Member) session.getAttribute("User");

		String writer_id = board.getMember_id();
		String login_id = member.getMember_id();

		if (writer_id.equals(login_id) || member.getMember_type() != 9) {
			model.addAttribute("userCheck", true);
		}

		model.addAttribute("qnaMemberContent", board);

		return "article/qnaMemberContentForm";
	}

}
