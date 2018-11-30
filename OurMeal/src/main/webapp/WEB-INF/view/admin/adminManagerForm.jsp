<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>승인 관리 페이지</title>
</head>
<body>
<div>
<c:forEach var="item" items="${confirm_list}">
포문 갯수만큼 돌아

<p>회원 아이디 :  ${ item.member_id }</p>
<p>사업자 등록번호 : ${ item.partner_crn }</p>
<p>사업자 등록일 : ${ item.partner_bl }</p>
<p>사업자 등록증 : ${ item.partner_sd }</p>
<p>영업신고증 : ${ item.partner_date }</p>
<form action="${pageContext.request.contextPath}/adminManager" method="post">	
	<input type="text" value="${ item.member_id }" name="confirm_id" />아이디 숨겨서 전송
	<button type="submit">승인</button>
</form>
</c:forEach>

</div>

</body>
</html>