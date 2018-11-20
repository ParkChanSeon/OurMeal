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
  		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mypage/css/mypage.css">
  		  		
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
				
				$("#profile_Update_Btn").click(function() {
					$("#member_name").attr("readonly",false);
					$("#member_email").attr("readonly",false);
					$("#member_address").attr("readonly",false);
					$("#member_phone").attr("readonly",false);
					$("#member_birth").attr("readonly",false);

				});

				$("#pw_update_Btn").click(function() {
					$("#old_pw").attr("readonly",false);
					$("#new_pw1").attr("readonly",false);
					$("#new_pw2").attr("readonly",false);
				});

				$("#helth_insert_Btn").click(function() {
					$("#health_height").attr("readonly",false);
					$("#health_weight").attr("readonly",false);
				});
			});
		</script>

		<!-- Features -->
			<div id="features-wrapper">
				<div class="container">
					<div class="row">
						<div class="col-4 col-12-medium">

							<!-- Box -->
								<section class="box feature">
									<div class="inner">
										<header>
											<h2><button id="profile_Update_Btn" class="profile_btn">개인정보 수정</button></h2>
											<p class="btn_title">수정 하시려면 버튼을 눌러 주세요.</p>
										</header>
										<form action="${pageContext.request.contextPath}/memberUpdate" id="profile_update" method="post">
											아이디<input type="text" value="${User.member_id }"id="member_id" name="member_id" readonly>						
											이름  <input type="text" value="${User.member_name }"id="member_name"  name="member_name" readonly>
											이메일<input type="text" value="${User.member_email }"id="member_email" name="member_email" readonly>
											주소<input type="text" value="${User.member_address }"id="member_address" name="member_address" readonly>
											핸드폰<input type="text" value="${User.member_phone }"id="member_phone" name="member_phone" readonly>
											생일<input type="text" value="${User.member_birth }"id="member_birth" name="member_birth" readonly>											
											
											<c:if test="${memberUpdate eq 1}">
												<input type="text" value="수정 완료" style="background: rgb(68, 68, 68);color: white;text-align: center;">												
											</c:if>
											<button id="profile_Update_Btn" type="submit" class="profile_btn">수정</button>
										</form>
									</div>
								</section>

						</div>
						<div class="col-4 col-12-medium">

							<!-- Box -->
								<section class="box feature">									
									<div class="inner">
										<header>
											<h2><button id="pw_update_Btn" class="profile_btn">비밀번호 수정</button></h2>
											<p class="btn_title">수정 하시려면 버튼을 눌러 주세요.</p>
										</header>
										<form action="${pageContext.request.contextPath}/memberUpdate_pw" id="profile_update" method="post">
											예전 비밀번호 <input type="password" id="old_pw" name="old_pw" readonly="readonly">
											새 비밀번호 <input type="password" id="new_pw1" name="new_pw" readonly="readonly">
											새 비밀번호 확인 <input type="password" id="new_pw2" name="new_pw" readonly="readonly">											
											<c:if test="${PasswordUpdate eq 1}">
												<input type="text" value="비밀번호 수정 완료" style="background: rgb(68, 68, 68);color: white;text-align: center;">
											</c:if>
																						
											<c:if test="${PasswordUpdate eq 0}">
												<input type="text" value="비밀번호가 틀렸습니다." style="background: rgb(68, 68, 68);color: white;text-align: center;">
											</c:if>
											<button id="pw_update_Btn" type="submit" class="profile_btn">수정</button>
										</form>
									</div>
								</section>

						</div>
						<div class="col-4 col-12-medium">

							<!-- Box -->
								<section class="box feature">									
									<div class="inner">
										<header>
											<h2><button id="helth_insert_Btn" class="profile_btn">신체 사이즈 입력</button></h2>
											<p class="btn_title">입력 및 수정을 하시려면 버튼을 눌러 주세요.</p>
										</header>
										<!--  insert된 데이터가 있었다면 readonly로 하고 수정으로 변경 없다면 입력으로 변경 -->
										<form action="${pageContext.request.contextPath}/memberHelth" id="profile_update" method="post">						
											키 : <input type="text" id="health_height" name="health_height" readonly="readonly" >
											몸무게 : <input type="text" id="health_weight" name="health_weight" readonly="readonly" >
											 하루섭취 칼로리 <input type="text" readonly="readonly" value="㎉" >
											<c:if test="${Health eq 1}">
												<input type="text" value="건강정보 등록 완료">
											</c:if>
											<button id="helth_insert_Btn" type="submit" class="profile_btn">입력</button>
										</form>
									</div>
								</section>

						</div>
					</div>
				</div>
			</div>		
		<!-- footer -->						
		<%@ include file="/WEB-INF/resources/include/footer.jsp" %>
		
		<!-- popup -->
		<script src="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.js"></script>
		
		<!-- popup content -->
		<%@ include file="/WEB-INF/resources/include/popup.jsp" %>

		<script src="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.js"></script>		
		<script src="${pageContext.request.contextPath}/resources/main/popup/dist/event.js"></script>	
	</body>
</html>