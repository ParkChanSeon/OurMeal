<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판 리스트</title>
</head>
<body>
	<h2>자유 게시판 리스트</h2>

	<table border="1">
		<tr>
			<td colspan="4"><a
				href="${pageContext.request.contextPath}/freewrite">[자유 게시글 쓰기]</a></td>
		</tr>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>조회수</td>
		</tr>
		<c:if test="${articlePage.hasNoArticles()}">
			<tr>
				<td colspan="4">자유 게시글이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="article" items="${articlePage.content }">
			<tr>
				<td>${article.number }</td>
				<td><a
					href="${pageContext.request.contextPath}/read.do/${articlePage.currentPage}/
								${article.number}">
						<c:out value="${article.title }" />
				</a></td>
				<td>${article.writer.name }</td>
				<td>${article.readCount }</td>
			</tr>
		</c:forEach>
		<c:if test="${articlePage.hasArticles()}">
			<tr>
				<td colspan="4"><c:if test="${articlePage.startPage >5 }">
						<a href="list.do/${articlePage.startPage -5 }">[이전</a>
					</c:if> <c:forEach var="pNo" begin="${articlePage.startPage }"
						end="${articlePage.endPage }">
						<a href="${pageContext.request.contextPath}/list.do/${pNo}">[${pNo}]</a>
					</c:forEach> <c:if test="${articlePage.endPage < articlePage.totalPages}">
						<a href="list.do/${articlePage.startPage + 5 }">[다음]</a>
					</c:if>
				</td>
			</tr>
		</c:if>
	</table>
</body>
</html>
