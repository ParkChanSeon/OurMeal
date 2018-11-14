<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>자유 게시글 작성</title>
</head>
<body>
	<h2>	자유 게시글 작성</h2>
	
	<form action="write.do" method="post">
		<p>
			제목:<br/><input type="text" name="title" value="${param.title}">
			<c:if test="${errors.title}">제목을 입력 하세요.</c:if>
		</p>
		
		<p>
			내용:<br/>
			<textarea name="content" rows="5" cols="30">${param.title}</textarea>
		</p>
		<input type="submit" value="등록">
	</form>
</body>
</html>
