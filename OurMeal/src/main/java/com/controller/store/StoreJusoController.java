package com.controller.store;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StoreJusoController {

	@RequestMapping(value="/storeJuso")
	public String jusoPopup() {
		
		
		return "/store/storeJusoPopup";		
	}
	

	
	@RequestMapping(value="/storeJuso" ,method=RequestMethod.POST)
	public String jusoResult(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		
		String inputYn = request.getParameter("inputYn"); 
		String roadFullAddr = request.getParameter("roadFullAddr"); 
		String roadAddrPart1 = request.getParameter("roadAddrPart1"); 
		String roadAddrPart2 = request.getParameter("roadAddrPart2"); 
		String engAddr = request.getParameter("engAddr"); 
		String jibunAddr = request.getParameter("jibunAddr"); 
		String zipNo = request.getParameter("zipNo"); 
		String addrDetail = request.getParameter("addrDetail"); 
		String admCd    = request.getParameter("admCd");
		String rnMgtSn = request.getParameter("rnMgtSn");
		String bdMgtSn  = request.getParameter("bdMgtSn");
		String detBdNmList  = request.getParameter("detBdNmList");	
		//2017년 2월 추가제공 
		String bdNm  = request.getParameter("bdNm");
		String bdKdcd  = request.getParameter("bdKdcd");
		String siNm  = request.getParameter("siNm");
		String sggNm  = request.getParameter("sggNm");
		String emdNm  = request.getParameter("emdNm");
		String liNm  = request.getParameter("liNm");
		String rn  = request.getParameter("rn");
		String udrtYn  = request.getParameter("udrtYn");
		String buldMnnm  = request.getParameter("buldMnnm");
		String buldSlno  = request.getParameter("buldSlno");
		String mtYn  = request.getParameter("mtYn");
		String lnbrMnnm  = request.getParameter("lnbrMnnm");
		String lnbrSlno  = request.getParameter("lnbrSlno");
		//2017년 3월 추가제공 
		String emdNo  = request.getParameter("emdNo");
		
		System.out.println(roadFullAddr);
		System.out.println("admCd : " + admCd);
		
		
		
		
	    System.out.println("======주소검색=========");
		System.out.println("inputYn : "+inputYn);
		System.out.println("roadFullAddr : " +roadFullAddr);
		System.out.println("inroadAddrPart1 : "+roadAddrPart1);
		System.out.println("roadAddrPart2 : " +roadAddrPart2);
		System.out.println("engAddr : " +engAddr);
		System.out.println("jibunAddr : " +jibunAddr);
		System.out.println("zipNo : " + zipNo);
		System.out.println("addrDetail : " +addrDetail);
		System.out.println("admCd : " + admCd);
		System.out.println("rnMgtSn : " + rnMgtSn);
		System.out.println("bdMgtSn : " + bdMgtSn);
		System.out.println("detBdNmList : " + detBdNmList);
		System.out.println("bdNm : " + bdNm);
		System.out.println("bdKdcd : " + bdKdcd);
		System.out.println("siNm : " + siNm);
		System.out.println("sggNm : " + sggNm);
		System.out.println("emdNm : " + emdNm);
		System.out.println("liNm : " + liNm);
		System.out.println("rn : " + rn);
		System.out.println("udrtYn : " + udrtYn);
		System.out.println("buldMnnm : " + buldMnnm);
		System.out.println("buldSlno : " + buldSlno);
		System.out.println("mtYn : " + mtYn);
		System.out.println("lnbrMnnm : " + lnbrMnnm);
		System.out.println("lnbrSlno : " + lnbrSlno);
		System.out.println("emdNo : " + emdNo);
		System.out.println("===================");
		
		
		
		return "/store/storeJusoPopup";		
	}
	
	
	
}
