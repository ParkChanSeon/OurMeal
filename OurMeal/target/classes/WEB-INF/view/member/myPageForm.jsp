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
	<form action="${pageContext.request.contextPath}/memberUpdate" method="get">
		<input type="submit" value="정보수정">
	</form>
	<form action="${pageContext.request.contextPath}/memberDelete" method="post">
		<p><input type="text" name="member_id">아이디<br />
		<p><input type="submit" value="삭제">
	</form>
	<table border="1">
	<caption>사용자 정보</caption>
	<tr>
	    <td>${myPage.member_id}</td>
	    <td>사용자아이디</td>
	</tr>
	<tr>
	    <td>${myPage.member_pw}</td>
	    <td>사용자비밀번호</td>
	</tr>
	<tr>
	    <td>${myPage.member_name}</td>
	    <td>사용자이름</td>
	</tr>
	<tr>
	    <td>${myPage.member_email}</td>
	    <td>사용자이메일</td>
	</tr>
	<tr>
	    <td>${myPage.member_phone}</td>
	    <td>사용자전화번호</td>
	</tr>
	<tr>
	    <td>${myPage.member_birth}</td>
	    <td>사용자생일</td>
	</tr>
	<tr>
	    <td>${myPage.member_sex}</td>
	    <td>사용자성별</td>
	</tr>
	<tr>
	    <td>${myPage.member_date}</td>
	    <td>사용자가입일</td>
	</tr>
	</table>

</body>
</html>