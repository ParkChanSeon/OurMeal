<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지 게시판</title>
<link
	href="<%=request.getContextPath()%>/resources/freeboard/css/board.css"
	rel="stylesheet" type="text/css" />

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
		src="${pageContext.request.contextPath}/resources/main/assets/js/main.js"></script>

	<div class="wrapper">
		<h1>공지 게시판</h1>
		<table border="0" class="boardTable">
			<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="board" items="${noticeList}">
				<tr>
					<td>${board.notice_no}</td>
					<td>
						<a href="${pageContext.request.contextPath}/noticeContent/?pageNo=${board.notice_no}">
						    <c:out value="${board.notice_title}"/>
						</a>
					</td>
					<td>${board.admin_id}</td>
					<td>${board.notice_count}</td>
					<td>${board.notice_c_date}</td>
				</tr>
			</c:forEach>
			</tbody>
			<%-- <c:if test="${ articlePage.hasArticle() }">
                <tr>
                    <td colspan="5">
                        <c:if test="${ articlePage.startPage > 5 }">
                            <a href="${pageContext.request.contextPath}/noticeContent/?pageNo=${ articlePage.startPage - 5 }">이전</a>
                        </c:if>
                        <c:forEach var="pNo" begin="${ articlePage.startPage }" end="${ articlePage.endPage }">
                            <a href="${pageContext.request.contextPath}/noticeContent/?pageNo=${ pNo }"></a>
                        </c:forEach>
                        <c:if test="${ articlePage.endPage < article.totalPages }">
                            <a href="${pageContext.request.contextPath}/noticeContent/?pageNo=${ articlePage.startPage + 5 }">다음</a>
                        </c:if>
                     </td>
                 </tr>
             </c:if> --%>
		</table>
		<form action="noticeWrite" method="get" >
		    <input type="submit" value="작성" class="writeBt"/>
		    <input  type="button" value="메인페이지로" onclick='window.location.href="${pageContext.request.contextPath}"'>
		</form>
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
			src="${pageContext.request.contextPath}/resources/main/popup/dist/event.js">
			
		</script>
	</div>
</body>
</html>
