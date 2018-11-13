<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Our Meal</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!-- main menu -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main/assets/css/main.css">
		
		<!-- popup css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/popup/dist/remodal-default-theme.css">
  		
  		<!-- main css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/main.css">	
	</head>
	<body class="is-preload homepage">
		<!-- Main Menu -->
		<%@ include file="WEB-INF/resources/include/header.jsp" %>
		
		<!-- Main Menu Scripts -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.dropotron.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/browser.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/breakpoints.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/util.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/main.js"></script>
	
			
		<!-- 이영역에 각자 구현할 태그를 작성! 샘플로 태그하나 넣어놈-->
		<div class="container">
			<div class="row">

<div class="join_form">
<div class="page-header" style="display:inline;">
  <h1>Join Membership</h1>
</div>
<form name= "form" id="form" action = "${pageContext.request.contextPath }/join" method="post">
  <div class="form-group">
    <label for="id">ID </label>
    <input type="text" class="form-control" name="member_Id">
    <c:if test="${errors.member_Id}"><b>ID를 입력하세요.</b></c:if>
	<c:if test="${errors.duplicateId}"><b>이미 사용중인 아이디입니다.</b></c:if>
  </div>
  <div class="form-group">
    <label for="Password1">비밀번호</label>
    <input type="password" class="form-control" name="member_Password">
    <c:if test="${errors.member_Password}"><b>사용할 비밀번호를 입력하세요.</b></c:if>
  </div>
  <div class="form-group">
    <label for="Password2">비밀번호 확인</label>
    <input type="password" class="form-control"   name="member_ConfirmPassword" >
  <c:if test="${errors.confirmPassword}"><b>비밀번호를 입력하세요.</b></c:if>
  <c:if test="${errors.notMatch}"><b>비밀번호가 일치하지 않습니다.</b></c:if>
  </div>
  
  <div class="form-group">
    <label for="Name">이름</label>
    <input type="text" class="form-control" name="member_Name">
   <c:if test="${errors.member_Name}"><b>이름을 입력하세요.</b></c:if>
  </div>
  
  <div class="form-group">
    <label for="DOB">생년월일</label>
    <input type="text" class="form-control" name="member_Dob">
    <c:if test="${errors.member_Dob}"><b>생년월일을 입력하세요.</b></c:if>
  </div>
  
  <div class="form-group">
    <label for="Gender">성별</label>
    <select class="form-control" name="member_Gender">
  	<option value="남" selected >남</option> 
	<option value="여">여</option> 
  </select>
  </div>
  
  <div class="form-group">
    <label for="Phone">휴대전화</label>
    <input type="text" class="form-control" name="member_Tel">
   <c:if test ="${errors.member_Tel}"><b>전화번호를 입력하세요.</b></c:if>
  </div>
  
  <div class="form-group">
    <label for="Address" >주소</label>
  
  	<table >
			<colgroup>
				<col style="width:20%"><col>
			</colgroup>
			<tbody>
				<tr>
					<th>우편번호</th>
					<td>
					    <input type="hidden" id="confmKey"  name="confmKey" value=""  >
						<input type="text" id="zipNo"   name="zipNo" readonly style="width:100px">
						<input type="button"  value="주소검색" onclick="goPopup();">
					</td>
				</tr>
				<tr>
					<th>도로명주소</th>
					<td><input type="text" id="roadAddrPart1"  style="width:85%"></td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td>
						<input type="text" id="addrDetail"  style="width:40%" value="">
						<input type="text" id="roadAddrPart2"   style="width:40%" value="">
					  <c:if test ="${errors.member_Address}"><b>주소를 입력하세요.</b></c:if>
					</td>
				</tr>
			</tbody>
		</table>
  
  
  
    <input type="hidden" name="member_Address" value="${addrDetail}+${roadAddrPart2}">
 
  
  </div>
  <div class="form-group">
    <label for="Email">이메일</label>
    <input type="email" class="form-control" name="member_Email">
   <c:if test ="${errors.member_Email}"><b>메일주소를 입력하세요.</b></c:if>
  </div>
  
   <button type="submit" class="btn btn-default">가입하기</button>
</form>

</div>
			</div>
		</div>		
		<!-- 이영역에 각자 구현할 태그를 작성! 여기까지!!!! -->
		
		
		<!-- footer -->						
		<%@ include file="WEB-INF/resources/include/footer.jsp" %>
		
		<!-- popup -->
		<script src="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.js"></script>
		
		<!-- popup content -->
		<%@ include file="WEB-INF/resources/include/popup.jsp" %>

		<script src="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.js"></script>		
		<script src="${pageContext.request.contextPath}/resources/main/popup/dist/event.js"></script>
	</body>
</html>