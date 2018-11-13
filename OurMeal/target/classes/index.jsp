<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Our Meal</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!-- main menu -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main/assets/css/main.css">
		
		<!-- popup css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/popup/dist/remodal-default-theme.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/main.css">
	</head>
	<body class="is-preload homepage">
		<!-- Main Menu -->
		<!-- 회원로그인시 일반회원가입 버튼 삭제 파트너 로그인시 회원가입 버튼 삭제
		일반 회원 로그인시 마이 페이지 영역을 다르게 보여주면 된다.
		마이페이지는 일반 마이페이지/파트너 마이 페이지로 나뉜다. 
		-->
		<%@ include file="WEB-INF/resources/include/header.jsp" %>
		
		<!-- Main Menu Scripts -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.dropotron.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/browser.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/breakpoints.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/util.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/main.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/main.js"></script>
			
		<!-- Slider -->
		<%@ include file="/WEB-INF/resources/main/slider/slider.jsp" %>
		
		<!-- footer -->						
		<%@ include file="/WEB-INF/resources/include/footer.jsp" %>
		
		<!-- popup -->
		<script src="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.js"></script>
		
		<!-- popup content -->
		<%@ include file="/WEB-INF/resources/include/popup.jsp" %>

		<script src="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.js"></script>		
		<script src="${pageContext.request.contextPath}/resources/main/popup/dist/event.js"></script>		
	</body>
</html>