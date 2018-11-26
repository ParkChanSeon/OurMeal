package com.controller.article.free;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.FreeArticle;
import com.all.model.Member;
import com.service.articles.FreeArticleService;

@Controller
public class FreeListController {

	@Autowired
	private FreeArticleService service;

	@RequestMapping(value = "/freeWrite", method = RequestMethod.GET)
	public String freeWrite() {

		return "article/freeArticleWriteForm";

	}

	@RequestMapping(value = "/freeList", method = RequestMethod.GET)
	public String freeList(Model model, HttpSession session) {

		Member member = (Member) session.getAttribute("User");

		if (member == null) {
			model.addAttribute("userCheck", false);
		}

		model.addAttribute("freeList", service.freeList());

		return "article/freeArticleListForm";

	}

	@RequestMapping(value = "/freeContent", method = RequestMethod.GET)
	public String freeContent(Model model, HttpSession session, @RequestParam("pageNo") String no) {

		FreeArticle freeArticle = new FreeArticle();

		freeArticle.setFb_no(Integer.parseInt(no));

		FreeArticle board = service.freeContent(freeArticle);
		Member member = (Member) session.getAttribute("User");
		try {
			String writer_id = board.getMember_id();
			String login_id = member.getMember_id();

			if (writer_id.equals(login_id) || member.getMember_type() == 9) {
				model.addAttribute("userCheck", true);
			}
			
			model.addAttribute("freeContent", board);
			return "article/freeArticleContentForm";

		} catch (Exception e) {
			model.addAttribute("freeContent", board);
			return "article/freeArticleContentForm";
		}
	}

	/*
	 * @RequestMapping(value="/freeContent", method=RequestMethod.GET) public String
	 * freeContent(Model model, HttpSession session, @RequestParam("pageNo") String
	 * no) {
	 * 
	 * FreeArticle freeArticle = new FreeArticle();
	 * 
	 * freeArticle.setFb_no(Integer.parseInt(no));
	 * 
	 * FreeArticle board = service.freeContent(freeArticle); Member member =
	 * (Member)session.getAttribute("User");
	 * 
	 * String writer_id = board.getMember_id(); String login_id =
	 * member.getMember_id();
	 * 
	 * if(writer_id.equals(login_id) || member.getMember_type() == 9) {
	 * model.addAttribute("userCheck", true); }
	 * 
	 * model.addAttribute("freeContent", board);
	 * 
	 * return "article/freeArticleContentForm"; }
	 */

}
