<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap -->
<link href='<c:url value="/css/bootstrap.min.css" />' rel="stylesheet">
<link href='<c:url value="/css/kfonts2.css" />' rel="stylesheet">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src='<c:url value="/jquery/jquery-1.11.3.min.js" />'></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src='<c:url value="/js/bootstrap.min.js"  />'></script>

<title>비밀번호 찾기</title>
</head>
<body>
	<div class="container">
		<h1>비밀번호 찾기</h1>

		<form action="${pageContext.request.contextPath}/pwSearch" method="post">
			<div align="center">
				<!-- 회원 아이디 -->
				<input type="text" name="id" size="120" style="width: 100%"
					placeholder="회원 아이디" class="form-control">
			</div>
			<div align="center">
				<!-- 회원 이름 -->
				<input type="text" name="name" size="120" style="width: 100%"
					placeholder="회원 이름" class="form-control">
			</div>
			<div align="center">
				<!-- 회원 이메일 -->
				<input type="text" name="email" size="120"
					style="width: 100%" placeholder="회원 이메일" class="form-control">
			</div>
			<div align="center">
				<!-- 제목 -->
				<input type="hidden" name="title" size="120" style="width: 100%"
					placeholder="제목을 입력해주세요" class="form-control">
			</div>
			<p>
			<div align="center">
				<!-- 내용 -->
				<input type="hidden" name="content" cols="120" rows="12"
					style="width: 100%; resize: none" placeholder="내용#"
					class="form-control">
			</div>
			<p>
			<div align="center">
				<input type="submit" value="비밀번호 찾기" class="btn btn-warning">
			</div>
		</form>
	</div>
</body>
</html>
