<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지 게시글 보기</title>
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
	src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>

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

	<div class="wrapper">
<!-- 여기부터 게시판 뷰 -->
	<form >
		<table class="boardView">
			<tr>
				<td colspan="3"><h3>${noticeContent.notice_title}</h3></td>
			</tr>
			<tr>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
			<tr>
				<td>${noticeContent.admin_id}</td>
				<td>${noticeContent.notice_count}</td>
				<td>${noticeContent.notice_c_date}</td>
			</tr>
			<tr>
				<th colspan="3">내용</th>
			</tr>
			<tr>
				<td colspan="3" align="left"><p>${noticeContent.notice_content}</p><br /><br /></td>
			</tr>
		</table>
	</form>
	<form action="${pageContext.request.contextPath}/noticeUpdate" method="get">
		<input type="hidden" name="notice_no" value="${noticeContent.notice_no}" />
		<input type="submit" value="수정" class="writeBt"/>
	</form>
	<form action="${pageContext.request.contextPath}/noticeDelete" method="get">
		<input type="hidden" name="notice_no" value="${noticeContent.notice_no}" />
		<input type="submit" value="삭제" class="writeBt"/>
	</form>
	<form action="${pageContext.request.contextPath}/noticeList" method="get">
		<input type="submit" value="목록" class="writeBt"/>
	</form><br>
		<table class="commentView">
			<tr>
				<th colspan="2">댓글</th>
			</tr>
			<c:forEach var="comment" items="${commentList}">
				<tr>
					<td class="writer">
						<p>${comment.writer}
							<c:if test="${comment.writerId == userId}">
								<br />
								<a onclick="commentDelete(${comment.idx}, ${board.idx})"><small>댓글
										삭제</small></a>
							</c:if>
						</p>
					</td>
					<td class="content" align="left"><span class="date">${comment.writeDate}</span>
						<p>${comment.content}</p></td>
				</tr>
			</c:forEach>
			<tr>
				<td class="writer"><strong>댓글 쓰기</strong></td>
				<td class="content">
					<form action="commentWrite.do" method="post">
						<input type="hidden" id="writer" name="writer" value="${userName}" />
						<input type="hidden" id="writerId" name="writerId" value="${userId}" />
						<input type="hidden" id="linkedArticleNum" name="linkedArticleNum" value="${board.idx}" />
						<textarea id="content" name="content" class="commentForm"></textarea><br />
						<input type="submit" value="확인" class="commentBt" />
					</form>
				</td>
			</tr>
		</table>
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
	</div>
</body>
</html>
