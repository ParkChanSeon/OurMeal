<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시글 삭제</title>
</head>
<body>
	<h2>자유 게시글 삭제</h2>

	<form action ="freedelete method="post">
		<input type ="hidden" name="no" value ="${modReq.articleNumber}">
	
		<table border = "1">
			<tr>
				<th>번호 : ${modReq.articleNumber	}</th>
				<th>제목 : ${modReq.title	}</th>
			</tr>

			<tr>
				<th colspan ="2">삭제하시겠습니까? </th>
			</tr>
			<tr>
				<th colspan ="2"><input type = "submit" value = "삭제"></th>
			</tr>
		</table>
		
		${ctxPath = pageContext.request.contextPath ; ''}
		<a href="${ctxPath}/freeboard">뒤로</a>
	</form>
</body>
</html>