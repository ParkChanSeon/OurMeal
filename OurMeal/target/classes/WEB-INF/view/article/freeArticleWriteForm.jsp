<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �Խñ� �ۼ�</title>
</head>
<body>
	<h2>	���� �Խñ� �ۼ�</h2>
	
	<form action="write.do" method="post">
		<p>
			����:<br/><input type="text" name="title" value="${param.title}">
			<c:if test="${errors.title}">������ �Է� �ϼ���.</c:if>
		</p>
		
		<p>
			����:<br/>
			<textarea name="content" rows="5" cols="30">${param.title}</textarea>
		</p>
		<input type="submit" value="���">
	</form>
</body>
</html>
