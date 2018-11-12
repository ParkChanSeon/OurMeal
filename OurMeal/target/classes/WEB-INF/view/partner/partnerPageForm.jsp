<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <form action="${pageContext.request.contextPath}/mainPage" method="get">
		<input type="submit" value="메인페이지로">
	</form>
	<form action="${pageContext.request.contextPath}/partnerUpdate" method="get">
		<input type="submit" value="정보수정">
	</form>
	<form action="${pageContext.request.contextPath}/partnerDelete" method="post">
		<p><input type="text" name="partner_id">아이디<br />
		<p><input type="submit" value="삭제">
	</form>
	<table border="1">
	<tr>
	    <td>${partnerPage.partner_id}</td>
	    <td>사업자아이디</td>
	</tr>
	<tr>
	    <td>${partnerPage.partner_pw}</td>
	    <td>사업자비밀번호</td>
	</tr>
	<tr>
	    <td>${partnerPage.store_code}</td>
	    <td>사업자이름</td>
	</tr>
	<tr>
	    <td>${partnerPage.store_title}</td>
	    <td>사업자이메일</td>
	</tr>
	</table>

</body>
</html>