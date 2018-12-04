<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유 게시판</title>
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

<!-- 여기부터 게시판 뷰 -->
	<div class="wrapper" style="width:80%; margin: 0 auto;" >
		<h1>자유 게시판</h1>
		<table border="0" class="boardTable">
			<thead>
			<tr>
				<th width="10%">글번호</th>
				<th width="50%">제목</th>
				<th width="10%">작성자</th>
				<th width="10%">조회수</th>
				<th width="10%">작성일</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="board" items="${freeList}">
				<tr>
					<td>${board.fb_no}</td>
					<td>
						<a href="${pageContext.request.contextPath}/freeContent/?pageNo=${board.fb_no}">
						    <c:out value="${board.fb_title}"/>
						</a>
					</td>
					<td>${board.member_id}</td>
					<td>${board.fb_count}</td>
					<td>${board.fb_c_date}</td>
				</tr>
			</c:forEach>
			    <tr>
			        <td colspan="5">
				  <ul class="pagination">
				    <li style="display: inline-block;">
				      <a href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li style="display: inline-block;"><a href="#">1</a></li>
				    <li style="display: inline-block;"><a href="#">2</a></li>
				    <li style="display: inline-block;"><a href="#">3</a></li>
				    <li style="display: inline-block;"><a href="#">4</a></li>
				    <li style="display: inline-block;"><a href="#">5</a></li>
				    <li style="display: inline-block;"><a href="#">6</a></li>
				    <li style="display: inline-block;"><a href="#">7</a></li>
				    <li style="display: inline-block;"><a href="#">8</a></li>
				    <li style="display: inline-block;"><a href="#">9</a></li>
				    <li style="display: inline-block;">
				      <a href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				  </td>
			    </tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5">
						<form action="freeWrite" method="get" style="text-align: right;">
						    <c:if test="${userCheck ne false}">
						    <input type="submit" value="작성" class="writeBt" style="margin-left: 10px"/>
						    </c:if>
						    <input type="button" value="메인페이지로" onclick='window.location.href="${pageContext.request.contextPath}"'>
						</form>		
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
	<br><br><br><br><br><br><br>
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
