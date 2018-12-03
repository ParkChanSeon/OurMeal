package com.controller.article.free;

import java.awt.print.Pageable;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.FreeArticle;
import com.all.model.FreeComment;
import com.all.model.Member;
import com.service.articles.FreeArticleService;
import com.service.comment.FreeCommentService;

@Controller
public class FreeListController {

	@Autowired
	private FreeArticleService service;
	@Autowired
	private FreeCommentService commentService;

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
		FreeComment freeComment = new FreeComment();
		
		freeArticle.setFb_no(Integer.parseInt(no));
		freeComment.setFb_no(Integer.parseInt(no));

		FreeArticle board = service.freeContent(freeArticle);
		List<FreeComment> comment = commentService.freeCommentList(freeComment);
		Member member = (Member) session.getAttribute("User");
		try {
			String login_id = member.getMember_id();
			int check_type = member.getMember_type();
			model.addAttribute("loginCheck", login_id);
			model.addAttribute("typeCheck", check_type);
			model.addAttribute("freeContent", board);
			model.addAttribute("freeCommentList", comment);
			return "article/freeArticleContentForm";
		} catch (Exception e) {
			model.addAttribute("commentCheck", false);
			model.addAttribute("freeContent", board);
			model.addAttribute("freeCommentList", comment);
			return "article/freeArticleContentForm";
		}
	}
	
	/*@RequestMapping(value = "/freeList", method = RequestMethod.GET)
	public String freeList(Model model, HttpSession session, HttpServletRequest request) {

		// 첫페이지 시작
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		// 게시물 5개씩 보이기
		int count = 5;

		HashMap<String, Integer> map = new HashMap<>();
		map.put("start", (page - 1) * count);
		map.put("end", count);

		FreeArticle freeArticle = new FreeArticle();

		model.addAttribute("freeListCount", service.freeListCount()); // 해당되는 범위의 게시글을 리스트로 받아온다
		model.addAttribute("freeListPage", service.freeListPage(map));

		int recordCount = service.freeListCount();
		int totalPage = recordCount / count + (recordCount % count != 0 ? 1 : 0);
		if (page < 1 || page > totalPage) {
			return null;
		}
		
		int pageCount = 4;

		int startPage = (page - 1) / pageCount * pageCount;
		if (startPage % pageCount == 0) startPage += 1;

		int endPage = startPage + pageCount - 1;
		if (endPage > totalPage) endPage = totalPage; // 총페이지 수보다 끝나는 페이지가 더 크면 전체페이지수로 지정

		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("page", page);

		System.out.printf("노티 page : %s\n", page);
		System.out.printf("노티 endPage : %s\n", endPage);
		System.out.printf("노티 totalPage : %s\n", totalPage);
		System.out.printf("노티 pageCount : %s\n", pageCount);

		Member member = (Member) session.getAttribute("User");

		if (member == null) {
			model.addAttribute("userCheck", false);
		}

		return "article/freeArticleListForm";

	}*/

}
