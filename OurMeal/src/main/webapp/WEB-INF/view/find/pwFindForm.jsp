<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>비밀번호 찾기</title>
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

	<div id="body" style="text-align: center; height: 600px; padding-top: 50px;">
		<!-- 이영역에 각자 구현할 태그를 작성! 샘플로 태그하나 넣어놈-->
		<div class="w3-container w3-card-4" style="width: 500px; display: inline-block;">
			<form action="${pageContext.request.contextPath}/pwSearch"
				method="post">
				<div class="w3-center w3-large w3-margin-top">
					<h1 style="text-align: left;">비밀번호 찾기</h1>
				</div>
				<br>
				<div align="center">
					<label style="text-align: left;">아이디</label> <input type="text"
						name="id" size="120" style="width: 100%" class="form-control" required>
				</div>
				<div align="center">
					<label style="text-align: left;">이름</label> <input type="text"
						name="name" size="120" style="width: 100%" class="form-control" required>
				</div>
				<div align="center">
					<label style="text-align: left">이메일</label> <input type="text"
						name="email" size="120" style="width: 100%" class="form-control" required>
				</div>
				<div align="center">
					<!-- 제목 -->
					<input type="hidden" name="title" size="120" style="width: 100%"
						placeholder="제목을 입력해주세요" class="form-control">
				</div>
				<p>
				<div align="center">
					<!-- 내용 -->
					<input type="hidden" name="content" cols="120" rows="12"
						style="width: 100%; resize: none" placeholder="내용#"
						class="form-control">
				</div>
				<p>
				<div align="center">
					<button type="submit"  id=findBtn>비밀번호 찾기</button> 
					<button type="button" onclick="history.go(-1);"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">취소</button>
				</div>
			</form>
		</div>
		<br><br>
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
