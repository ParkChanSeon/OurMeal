<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QNA 게시글 수정</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!-- main menu -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/main/assets/css/main.css">
<link
	href="<%=request.getContextPath()%>/resources/board/css/board.css"
	rel="stylesheet" type="text/css" />

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
	src="${pageContext.request.contextPath}/resources/main/main.js">
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js">
</script>
<!-- 뒤로가기 방지 -->
<script type="text/javascript">
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</script>
</head>
<body onload="errCodeCheck()" class="is-preload homepage">

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
		src="${pageContext.request.contextPath}/resources/main/assets/js/main.js">
	</script>

<!-- 여기부터 게시판 뷰 -->
	<div class="wrapper">
		<h1>QNA 게시글 수정</h1>
		<form action="${pageContext.request.contextPath}/qnaMemberUpdateSuccess" method="get">
			<br />
			<table class="boardWrite">
				<tr>
					<th>제목</th>
					<td>
					    <input type="text" name="mqb_title" class="boardSubject" pattern="[ㄱ-ㅎ가-힣a-zA-z0-9]{1,50}" title="50글자 이하로 작성하세요" required value="${qnaMemberUpdate.mqb_title}" />
					    <input type="hidden" name="mqb_no" value="${qnaMemberUpdate.mqb_no}" />
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea id="content" name="mqb_content" class="boardContent" required>${qnaMemberUpdate.mqb_content}</textarea></td>
				</tr>
			</table>
			<br />
			<input type="submit" value="확인" class="writeBt" /> 
		</form>
		<form action="qnaMemberList" method="get">
		    <input type="submit" value="취소" class="writeBt" /> 
		</form>
		<br><br><br>
    </div>
<!-- 여기까지 게시판 뷰 -->

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
			src="${pageContext.request.contextPath}/resources/main/popup/dist/event.js">
		</script>
</body>
</html>
