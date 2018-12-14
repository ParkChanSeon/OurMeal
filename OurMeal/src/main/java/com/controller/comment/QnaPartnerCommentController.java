package com.controller.comment;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.all.model.Member;
import com.all.model.QnaPartnerComment;
import com.service.comment.QnaPartnerCommentService;

@Controller
public class QnaPartnerCommentController {
	
	@Autowired
	private QnaPartnerCommentService commentService;
	
	@RequestMapping(value="/partnerCommentWrite", method=RequestMethod.POST)
	public String FreeCommentWrite(Model model, HttpServletRequest request, HttpSession session) {

		QnaPartnerComment partnerComment = new QnaPartnerComment();
		
		Member member = (Member)session.getAttribute("User");
		
		partnerComment.setAdmin_id(member.getMember_id());
		partnerComment.setPqb_no(Integer.parseInt(request.getParameter("pqb_no")));		
		partnerComment.setPqc_content(request.getParameter("pqc_content"));
		
		commentService.qnaPartnerCommentWrite(partnerComment);
		
		return "redirect:" + "/qnaPartnerContent/?pageNo=" + Integer.parseInt(request.getParameter("pqb_no"));
		
	}
	
	@RequestMapping(value="/partnerCommentDelete", method=RequestMethod.GET)
	public String FreeCommentDelete(Model model, HttpServletRequest request, HttpSession session) {
		
		QnaPartnerComment partnerComment = new QnaPartnerComment();
		
		Member member = (Member)session.getAttribute("User");
		
		partnerComment.setPqc_no(Integer.parseInt(request.getParameter("pqc_no")));
		
		commentService.qnaPartnerCommentDelete(partnerComment);		
		
		return "redirect:" + "/qnaPartnerContent/?pageNo=" + Integer.parseInt(request.getParameter("pqb_no"));
		
	}

}
