<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
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
  		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/main.css">
  		  		
  		<!-- jquery -->
  		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.min.js"></script>
  		
  		<!-- main js -->
  		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/main.js"></script>
	</head>
	<body class="is-preload homepage">
	
		<!-- Main Menu -->
		<%@ include file="/WEB-INF/resources/include/header.jsp" %>
		
		<!-- Main Menu Scripts -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.dropotron.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/browser.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/breakpoints.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/util.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/main.js"></script>		
		
		<script type="text/javascript">
			$( document ).ready(function() {
				//profile_update 버튼이 눌렸을때 action 태그를 다른 곳으로 보내자.
				alert("ready");
				$( "#target" ).click(function() {

				});
			});
		</script>
	<div id="body">
		<!-- 이영역에 각자 구현할 태그를 작성! 샘플로 태그하나 넣어놈-->
		<div class="container">
			<div class="row">
				<div>
					<button id="profile_Update_Btn">개인정보 수정하기</button>
					<form action="${pageContext.request.contextPath}/memberUpdate" id="profile_update" method="post">
						아이디<input type="text" value="${User.member_id }" name="member_id" readonly="readonly">						
						이름  <input type="text" value="${User.member_name }" name="member_name">
						이메일<input type="text" value="${User.member_email }" name="member_email">
						주소<input type="text" value="${User.member_address }" name="member_address">
						핸드폰<input type="text" value="${User.member_phone }" name="member_phone">						
						생일<input type="text" value="${User.member_birth }" name="member_birth">
						<c:if test="${memberUpdate eq 1}">
							<input type="text" value="수정 완료">
						</c:if>
						<button id="profile_Update_Btn" type="submit">개인정보 수정</button>
					</form>
					
					<button id="pw_update_Btn">비밀번호 수정 하기</button>
					<form action="${pageContext.request.contextPath}/memberUpdate_pw" id="profile_update" method="post">
						<input type="text" id="old_pw" name="old_pw">
						<input type="text" name="new_pw">
						<input type="text" name="new_pw">
						<c:if test="${PasswordUpdate eq 1}">
							<input type="text" value="비밀번호 수정 완료">
						</c:if>
						<c:if test="${PasswordUpdate eq 0}">
							<input type="text" value="비밀번호가 틀렸습니다.">
						</c:if>												
						<button id="pw_update_Btn" type="submit">비밀번호 수정</button>
					</form>

					<button id="helth_insert_Btn">신체 사이즈 입력 하기</button>
					<form action="${pageContext.request.contextPath}/memberHelth" id="profile_update" method="post">						
						키 : <input type="text" id="health_height" name="health_height" >
						몸무게 : <input type="text" id="health_weight" name="health_weight" >
						<c:if test="${Health eq 1}">
							<input type="text" value="건강정보 등록 완료">
						</c:if>
						<button id="helth_insert_Btn" type="submit">신체 사이즈 입력</button>
					</form>
				</div>
			</div>
		</div>
		<!-- 이영역에 각자 구현할 태그를 작성! 여기까지!!!! -->
		
		<!-- footer -->						
		<%@ include file="/WEB-INF/resources/include/footer.jsp" %>
		
		<!-- popup -->
		<script src="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.js"></script>
		
		<!-- popup content -->
		<%@ include file="/WEB-INF/resources/include/popup.jsp" %>

		<script src="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.js"></script>		
		<script src="${pageContext.request.contextPath}/resources/main/popup/dist/event.js"></script>
	</div>		
	</body>
</html>