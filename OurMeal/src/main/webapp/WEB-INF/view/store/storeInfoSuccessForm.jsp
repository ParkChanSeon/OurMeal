<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Our Meal</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />

<!-- join CSS -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/join/css/join.css">

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

<!-- slider css -->
<link rel="stylesheep"
	href="${pageContext.request.contextPath}/resources/main/slider/css/reset.css"
	rel="stylesheet" />

<!-- jquery -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.min.js"></script>
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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/main/main.js"></script>

	<div class="joinBack">
		<div class="join_form">
			<div class="page-header" style="display: inline;">
				<h1
					style="font-size: 55px; text-align: left; margin-bottom: 40px; margin-top: 50px;">가게정보 수정성공</h1>

			</div>
			
			<div class="joinSuccess_msg">
			<h2 style=" text-align: left;"> 가게정보 수정했습니다.</h2>
			<a style="display:inline-block; vertical-align: middle; float: left;"><button class="btn btn-default" type="button" onclick="location.href='${pageContext.request.contextPath}/storePage?store_code=${store.store_code}'">나의 가게로 돌아가기</button></a>
			</div>
		</div>
		<br><br><br>
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