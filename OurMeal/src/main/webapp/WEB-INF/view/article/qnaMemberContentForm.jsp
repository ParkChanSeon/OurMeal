<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QNA 게시글 보기</title>
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
	<div class="wrapper" style="width:80%; margin: 0 auto;" >
	<form >
		<table class="boardTable">
			<tr>
				<td colspan="3"><h3>${qnaMemberContent.mqb_title}</h3></td>
			</tr>
			<tr>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
			<tr>
				<td>${qnaMemberContent.member_id}</td>
				<td>${qnaMemberContent.mqb_count}</td>
				<td>${qnaMemberContent.mqb_u_date}</td>
			</tr>
			<tr>
				<th colspan="3">내용</th>
			</tr>
			<tr>
				<td colspan="3" align="left" style="word-break:break-all"><p>${qnaMemberContent.mqb_content}</p><br /><br /></td>
			</tr>
		</table>
	</form>
	<c:if test="${loginCheck == qnaMemberContent.member_id || typeCheck == 9}">
	<form action="${pageContext.request.contextPath}/qnaMemberUpdate" method="get">
		<input type="hidden" name="mqb_no" value="${qnaMemberContent.mqb_no}" />
		<input type="submit" value="수정" class="writeBt"/>
	</form>
	<form action="${pageContext.request.contextPath}/qnaMemberDelete" method="get">
		<input type="hidden" name="mqb_no" value="${qnaMemberContent.mqb_no}" />
		<input type="submit" value="삭제" class="writeBt"/>
	</form>
	</c:if>
	<form action="${pageContext.request.contextPath}/qnaMemberSearch" method="post">
		<input type="hidden" name="search" value="${search}">
		<input type="submit" value="목록" class="writeBt"/>
	</form><br>
<!-- 여기부터 댓글 테이블 -->
		<table class="commentView">
			<tr>
				<th colspan="2">댓글</th>
			</tr>
			<c:forEach var="comment" items="${qnaMemberCommentList}">
			<tr>
				<td class="writer">
					<p>${comment.admin_id}
						<c:if test="${typeCheck == 9}">
							<form action="${pageContext.request.contextPath}/memberCommentDelete" method="get">
					        <input type="hidden" name="mqc_no" value="${comment.mqc_no}" />
					        <input type="hidden" name="mqb_no" value="${qnaMemberContent.mqb_no}" />
					        <input type="submit" value="삭제"/>
						    </form>
							<%-- <a href="${pageContext.request.contextPath}/memberCommentDelete">
							    <small>댓글 삭제</small>
							</a> --%>
						</c:if>
					</p>
				</td>
				<td class="content" align="left">
				    <span class="date">${comment.mqc_c_date}</span>
					<p>${comment.mqc_content}</p>
				</td>
			</tr>
			</c:forEach>
			<c:if test="${typeCheck == 9}">
			<tr>
				<td class="writer"><strong>댓글 쓰기</strong></td>
				<td class="content">
					<form action="${pageContext.request.contextPath}/memberCommentWrite" method="post">
						<input type="hidden" name="mqc_no" value="${comment.mqc_no}" />
						<input type="hidden" name="mqb_no" value="${qnaMemberContent.mqb_no}" />
						<input type="hidden" name="admin_id" value="${comment.admin_id}" />
						<textarea name="mqc_content" class="commentForm" required></textarea><br />
						<input type="submit" value="확인" class="commentBt" />
					</form>
				</td>
			</tr>
			</c:if>
		</table>
<!-- 여기까지 댓글 테이블 -->
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
