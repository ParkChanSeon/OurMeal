<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/abc" 
							method="post" enctype="multipart/form-data">
		<input type="file" name="file"> 
		<input type="submit" value="전송">
	</form>
</body>
</html>