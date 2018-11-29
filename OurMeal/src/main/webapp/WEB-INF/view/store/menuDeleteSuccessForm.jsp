<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Our Meal</title>
<meta charset="utf-8" />


<!-- menuInfo css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/store/css/menuInfo.css">


<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<!-- jquery -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.min.js"></script>

	

<!-- jquery -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.min.js"></script>


<!-- main js -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/main/main.js"></script>
	
	
</head>
<body  class="is-preload homepage">
<div class="container" >
		
 		
		</div>
<div style="width:100%; height:100px"></div>

	<!-- Main Menu Scripts -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.dropotron.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/main/assets/js/browser.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/main/assets/js/breakpoints.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/main/assets/js/util.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/main/assets/js/main.js"></script>

	
		<!-- 이영역에 각자 구현할 태그를 작성! 샘플로 태그하나 넣어놈-->
		
		
		<div class="storeBack">
		<div class ="store_info_inner">
		<div class="info_title_header">
		
		<span class="info_title"><strong>메뉴삭제 성공</strong></span>
		
		</div>
		
		<section class="restaurant-detail" style="text-align: center;">
		
		<div style="width:100%; height:500px;text-align: center">
		<form name= "form" id="form" action="${pageContext.request.contextPath}/menuInfo" method="POST" >
		<input type="hidden" name="store_code2" value="${store_code}">
		
		<input type = "submit" value ="메뉴정보로 돌아가기" style="width:200px; height:50px; display:inline-block;
		font-size:22px; font-weight: bold;" onclick="opener.parent.location.reload();">
		<input type = "button" style="width:200px; height:50px; display:inline-block; font-size:25px; font-weight: bold;"
		onclick="opener.parent.location.reload(); window.close();" value="닫기">
		</form>		
		</div>
		
		
		
		
	</section>
	</div>
	</div>
	
	<!-- popup -->
	<script
		src="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.js"></script>

	<!-- popup content -->
	<%@ include file="../../resources/include/popup.jsp"%>

	<script
		src="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/main/popup/dist/event.js"></script>
	
	
	
	
	
	
	
	
	
	
	
	</body>
	</html>
	