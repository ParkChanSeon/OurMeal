<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유 게시글 보기</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!-- main menu -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/main/assets/css/main.css">
<link href="<%=request.getContextPath()%>/resources/board/css/board.css"
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
    <form>
		<table class="boardView">
			<tr>
				<td colspan="3"><h3>${freeContent.fb_title}</h3></td>
			</tr>
			<tr>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
			<tr>
				<td>${freeContent.member_id}</td>
				<td>${freeContent.fb_count}</td>
				<td>${freeContent.fb_c_date}</td>
				
			</tr>
			<tr>
				<th colspan="3">내용</th>
			</tr>
			<tr>
				<td colspan="3" align="left" style="word-break:break-all">${freeContent.fb_content}<br /><br /></td>
			</tr>
		</table>
	</form>
	<c:if test="${userCheck eq true}">
	<form action="${pageContext.request.contextPath}/freeUpdate" method="get">
		<input type="hidden" name="fb_no" value="${freeContent.fb_no}" />
		<input type="submit" value="수정" class="writeBt"/>
	</form>
	<form action="${pageContext.request.contextPath}/freeDelete" method="get">
		<input type="hidden" name="fb_no" value="${freeContent.fb_no}" />
		<input type="submit" value="삭제" class="writeBt"/>
	</form>
	</c:if>
	<form action="${pageContext.request.contextPath}/freeList" method="get">
		<input type="submit" value="목록" class="writeBt"/>
	</form><br>
		<table class="commentView">
			<tr>
				<th colspan="2">댓글</th>
			</tr>
			<c:forEach var="comment" items="${freeCommentList}">
				<tr>
					<td class="writer">
						<p>${comment.writer}
							<c:if test="${comment.writerId == userId}"><br />
								<a onclick="FreeCommentDelete(${comment.idx}, ${board.idx})">
								    <small>댓글 삭제</small>
								</a>
							</c:if>
						</p>
					</td>
					<td class="content" align="left">
					    <span class="date">${comment.fc_u_date}</span>
						<p>${comment.fc_content}</p>
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td class="writer"><strong>댓글 쓰기</strong></td>
				<td class="content">
					<form action="${pageContext.request.contextPath}/FreeCommentWrite" method="get">
						<input type="hidden" id="member_id" name="member_id" value="${comment.member_id}" />
						<input type="hidden" id="fc_no" name="fc_no" value="${comment.fc_no}" />
						<textarea id="fc_content" name="fc_content" class="commentForm" required></textarea><br />
						<input type="submit" value="확인" class="commentBt" />
					</form>
				</td>
			</tr>
		</table>
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
