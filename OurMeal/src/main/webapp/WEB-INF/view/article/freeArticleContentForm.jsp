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
<!-- 뒤로가기 방지 -->
<script type="text/javascript">
	 window.history.forward();
	function noBack() {
		window.history.forward();
	}	
</script>
</head>
<body onload="deleteValue()" class="is-preload homepage" >

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
    <form>
		<table class="boardTable">
			<tr>
				<td colspan="3"><h3>${freeContent.fb_title}</h3></td>
			</tr>
			<tr>
				<th width="30%">작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
			<tr>
				<td>${freeContent.member_id}</td>
				<td>${freeContent.fb_count + 1}</td>
				<td>${freeContent.fb_c_date}</td>
			</tr>
			<tr>
				<th>사진</th>
				<th colspan="2">내용</th>
			</tr>
			<tr>
			    <td align="left">
				    <img alt="" src="${pageContext.request.contextPath}/${freeContent.fb_image}" style="width:250px; height:250px;">
				</td>
				<td colspan="2" align="left" style="word-break:break-all; padding-bottom:0px">
				
					<b style="white-space: pre-line;"><c:out value="${freeContent.fb_content}"></c:out></b>
					
				</td>
			</tr>
		</table>
	</form>
	<c:if test="${loginCheck == freeContent.member_id || typeCheck == 9}">
	<form action="${pageContext.request.contextPath}/freeUpdate" method="get">
		<input type="hidden" name="fb_no" value="${freeContent.fb_no}" />
		<input type="submit" value="수정" class="writeBt"/>
	</form>
	<form action="${pageContext.request.contextPath}/freeDelete" method="get">
		<input type="hidden" name="fb_no" value="${freeContent.fb_no}" />
		<input type="submit" value="삭제" class="writeBt"/>
	</form>
	</c:if>
	<form action="${pageContext.request.contextPath}/freeSearch" method="post">
		<input type="hidden" name="search" value="${search}">
		<input type="submit" value="목록" class="writeBt"/>
	</form><br>
	<p>${search}</p>
<!-- 여기부터 댓글 테이블 -->
		<table class="commentView">
			<tr>
				<th colspan="2">댓글</th>
			</tr>
			<c:forEach var="comment" items="${freeCommentList}">
			<tr>
				<td class="writer">
					<p>${comment.member_id}
						<c:if test="${loginCheck == comment.member_id || typeCheck == 9}"><br />
						    <form action="${pageContext.request.contextPath}/freeCommentDelete" method="get">
						        <input type="hidden" name="fc_no" value="${comment.fc_no}" />
						        <input type="hidden" name="fb_no" value="${freeContent.fb_no}" />
						        <input type="submit" value="삭제" />
						    </form>
							<%-- <a href="${pageContext.request.contextPath}/freeCommentDelete">
							    <small>댓글 삭제</small>
							</a> --%>
						</c:if>
					</p>
				</td>
				<td class="content" align="left">
				    <span class="date">${comment.fc_c_date}</span>
					<p>${comment.fc_content}</p>
					
					
				</td>
			</tr>
			</c:forEach>
			<c:if test="${commentCheck ne false}">
			<tr>
				<td class="writer"><strong>댓글 쓰기</strong></td>
				<td class="content">
					<form name="form" action="${pageContext.request.contextPath}/freeCommentWrite" method="post">
					    <input type="hidden" name="fc_no" value="${comment.fc_no}" />
					    <input type="hidden" name="fb_no" value="${freeContent.fb_no}" />
						<input type="hidden" name="member_id" value="${comment.member_id}" />
						<textarea name="fc_content" class="commentForm" required="required"></textarea><br />
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
