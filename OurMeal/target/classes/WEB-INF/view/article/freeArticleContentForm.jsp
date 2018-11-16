<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시글 보기</title>
</head>
<body>
	<h2>자유 게시글 보기</h2>
	
	<table border="1" width="100%">
		<tr>
			<td>번호</td>
			<td>${articleData.article.number}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${articleData.article.writer.name}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td><c:out value='${articleData.article.title}' /></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><u:pre value='${articleData.content}'/></td>
		</tr>
		<tr>
			<td colspan="2">
				<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo}" />
				<a href="freeboard?pageNo=${pageNo}">[목록]</a>
				<c:if test="${authUser.id == articleData.article.writer.id}">
				<a href="freeupdate?no=${articleData.article.number}">[게시글 수정]</a>
				<a href="freedelete?no=${articleData.article.number}">[게시글 삭제]</a>
				</c:if>
			</td>
		</tr>
	</table>
</body>
</html>