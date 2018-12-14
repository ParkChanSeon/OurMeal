package com.controller.main;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MainController {

	@RequestMapping(value="/", method=RequestMethod.GET)
	public void main(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		System.out.println("Rest 컨트롤러 이용");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/main.jsp");		
		dispatcher.forward(request, response);
	}
	
}
