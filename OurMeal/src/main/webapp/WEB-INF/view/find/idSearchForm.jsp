<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>아이디 찾기 결과</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!-- main menu -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/main/assets/css/main.css">

<!-- popup css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/popup/dist/remodal-default-theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/main.css">

<!-- jquery -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.min.js"></script>

<!-- main js -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/main/main.js"></script>
	
	<!-- main js + 로그인 ajax -->
  		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/main.js"></script>
<script>
	$(function() {
		$("#loginBtn").click(function() {
			location.href = '#modal';
		})
		$("#resetBtn").click(function() {
			location.href = '../OurMeal';
		})
	})
</script>
</head>
<body class="is-preload homepage">

	<!-- Main Menu -->
	<%@ include file="/WEB-INF/resources/include/header.jsp"%>

	<!-- Main Menu Scripts -->
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

	<div id="body"
		style="text-align: center; height: 600px; padding-top: 50px;">
		<!-- 이영역에 각자 구현할 태그를 작성! 샘플로 태그하나 넣어놈-->
		<div class="w3-content w3-container w3-margin-top">
			<div class="w3-container w3-card-4"
				style="width: 500px; display: inline-block;">
				<div class="w3-center w3-large w3-margin-top">
					<h1 style="text-align: left;">아이디 찾기 결과 </h1><br>
					<p><c:if test="${ null eq findid }"> 입력하신 이름과 이메일 정보가 맞지 않습니다. </c:if></p>
				</div>
				<div>
					<p align="left">${findid.member_id }</p>
					<p class="w3-center">
						<c:if test="${ null ne findid }"><button type="submit" id=loginBtn
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">로그인</button></c:if>
						<button type="button" id=resetBtn
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">취소</button>
					</p>
				</div>
			</div>
		</div>
		<!-- 이영역에 각자 구현할 태그를 작성! 여기까지!!!! -->

		<!-- footer -->
		<%@ include file="/WEB-INF/resources/include/footer.jsp"%>

		<!-- popup -->
		<script
			src="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.js"></script>

		<!-- popup content -->
		<%@ include file="/WEB-INF/resources/include/popup.jsp"%>

		<script
			src="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/main/popup/dist/event.js"></script>
	</div>
</body>
</html>