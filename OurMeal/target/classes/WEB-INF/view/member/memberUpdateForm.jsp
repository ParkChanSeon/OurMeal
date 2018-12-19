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
  		

<style type="text/css">
body {
  font-family: sans-serif;
  background-color: #eeeeee;
}

.file-upload {
  background-color: #ffffff;
  width: 100%;
  margin: 0 auto;
  padding: 20px;
}

.file-upload-btn {
  width: 100%;
  margin: 0;
  color: #fff;
  background: #444;
  border: none;
  padding: 10px;
  border-radius: 4px;
  border-bottom: #444;
  transition: all .2s ease;
  outline: none;
  text-transform: uppercase;
  font-weight: 700;
}

.file-upload-btn:hover {
  background: #1AA059;
  color: #ffffff;
  transition: all .2s ease;
  cursor: pointer;
}

.file-upload-btn:active {
  border: 0;
  transition: all .2s ease;
}

.file-upload-content {
  display: none;
  text-align: center;
}

.file-upload-input {
  position: absolute;
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  outline: none;
  opacity: 0;
  cursor: pointer;
}

.image-upload-wrap {
  margin-top: 20px;
  border: 4px dashed #444;
  position: relative;
}

.image-dropping,
.image-upload-wrap:hover {
  background-color: #444;
  border: 4px dashed #ffffff;
}

.image-title-wrap {
  padding: 0 15px 15px 15px;
  color: #222;
}

.drag-text {
  text-align: center;
}

.drag-text h3 {
  font-weight: 100;
  text-transform: uppercase;
  color: #444;
  padding: 60px 0;
}

.file-upload-image {
  max-height: 200px;
  max-width: 200px;
  margin: auto;
  padding: 20px;
}

.remove-image {
  width: 200px;
  margin: 0;
  color: #fff;
  background: #cd4535;
  border: none;
  padding: 10px;
  border-radius: 4px;
  border-bottom: 4px solid #b02818;
  transition: all .2s ease;
  outline: none;
  text-transform: uppercase;
  font-weight: 700;
}

.remove-image:hover {
  background: #c13b2a;
  color: #ffffff;
  transition: all .2s ease;
  cursor: pointer;
}

.remove-image:active {
  border: 0;
  transition: all .2s ease;
}		
	</style>
	
	  		
  		<!-- jquery -->
  		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.min.js"></script>
  		
  		<!-- main js -->
  		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/main.js"></script>
<script>
function readURL(input) {
  if (input.files && input.files[0]) {

    var reader = new FileReader();

    reader.onload = function(e) {
      $('.image-upload-wrap').hide();

      $('.file-upload-image').attr('src', e.target.result);
      $('.file-upload-content').show();

      $('.image-title').html(input.files[0].name);
    };

    reader.readAsDataURL(input.files[0]);

  } else {
    removeUpload();
  }
}

function removeUpload() {
  $('.file-upload-input').replaceWith($('.file-upload-input').clone());
  $('.file-upload-content').hide();
  $('.image-upload-wrap').show();
}
$('.image-upload-wrap').bind('dragover', function () {
        $('.image-upload-wrap').addClass('image-dropping');
    });
    $('.image-upload-wrap').bind('dragleave', function () {
        $('.image-upload-wrap').removeClass('image-dropping');
});
</script>  		
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
				
				$("#update_profile").click(function() {
					var member_name_size = $("#member_name").val().trim().length;
					var member_email_size = $("#member_email").val().trim().length;
					var member_phone_size = $("#member_phone").val().trim().length;
					var member_birth_size = $("#member_birth").val().trim().length;
					
					if(member_name_size==0){
						alert("이름을 입력해 주세요.");
						$("#member_name").focus();
						return false;
					}
					
					if(member_email_size==0){
						alert("이메일 주소를 입력해 주세요.");
						$("#member_email").focus();
						return false;
					}
					
					if(member_phone_size==0){
						alert("핸드폰 번호를 입력해 주세요.");
						$("#member_phone").focus();
						return false;
					}
					
					if(member_birth_size==0){
						//var test = $("#member_birth").val();
						alert("생일을 입력해 주세요.");
						$("#member_birth").focus();
						return false;
					}					
				});
				
				$("#update_password").click(function() {
					var old_pw_size = $("#old_pw").val().trim().length;
					var new_pw1_size = $("#new_pw1").val().trim().length;
					var new_pw2_size = $("#new_pw2").val().trim().length;
					
					if(old_pw_size==0){
						alert("예전 비밀번호를 입력해 주세요.");
						$("#old_pw").focus();
						return false;
					}
					
					if(new_pw1_size==0){
						alert("새 비밀번호를 입력해 주세요.");
						$("#new_pw1").focus();
						return false;
					}
					
					if(new_pw2_size==0){
						alert("비밀번호 확인을 입력해 주세요. ");
						$("#new_pw2").focus();
						return false;
					}
				
				});
								
				
				$("#profile_Update_Btn").click(function() {
					/*
					$("#member_name").attr("readonly",false);
					$("#member_email").attr("readonly",false);
					$("#member_address").attr("readonly",false);
					$("#member_phone").attr("readonly",false);
					$("#member_birth").attr("readonly",false);
					*/
				});

				$("#pw_update_Btn").click(function() {
					/*
					$("#old_pw").attr("readonly",false);
					$("#new_pw1").attr("readonly",false);
					$("#new_pw2").attr("readonly",false);
					*/
				});

				$("#health_height").click(function() {					
					$("#health_height").val("");
				});

				$("#health_weight").click(function() {					
					$("#health_weight").val("");
				});				
				
				$("#profileimg_submit").click(function() {
					var filecheck = $('#yourimage').attr("src").length;
					
					if(filecheck==1){
						alert("이미지를 등록해 주세요.");
						return false;
					}
										
				});
				
				$("#insert_helth").click(function() {
					var health_height_size = $("#health_height").val().trim().length;
					var health_weight_size = $("#health_weight").val().trim().length;

					if(health_height_size==0){
						alert("키를 입력해 주세요.");
						$("#health_height").focus();
						return false;
					}
					
					if(health_weight_size==0){
						alert("몸무게를 입력해 주세요.");
						$("#health_weight").focus();
						return false;
					}
				});
				
				
				$("#helth_insert_Btn").click(function() {
					/*
					$("#health_height").attr("readonly",false);
					$("#health_weight").attr("readonly",false);
					*/
					$("#health_height").val("");
					$("#health_weight").val("");
					
				});
				
				$(".profile").click(function() {					
					$("#profile_Update_Btn").css("background-color","black");
					/*
					$("#profile_Update_Btn").text("개인정보 수정을 원하시면 이 버튼을 한번 눌러 주세요.");
					*/
					
				});				
				
				$(".password").click(function() {
					$("#pw_update_Btn").css("background-color","black");
					//$("#pw_update_Btn").text("비밀번호 수정을 원하시면 이버튼을 한번 눌러 주세요.");
				});
				
				$(".kcal").click(function() {
					$("#helth_insert_Btn").css("background-color","black");
					//$("#helth_insert_Btn").text("신체 사이즈 입력을 원하시면 이 버튼을 한번 눌러 주세요.");
				});
				
				$(".profile").focusout(function(){
					$("#profile_Update_Btn").css("background-color","#444");
					$("#profile_Update_Btn").text("개인정보 수정");
				});
				
				$(".password").focusout(function(){
					$("#pw_update_Btn").css("background-color","#444");
					$("#pw_update_Btn").text("비밀번호 수정");
				});
				
				$(".kcal").focusout(function(){
					$("#helth_insert_Btn").css("background-color","#444");
					$("#helth_insert_Btn").text("신체 사이즈 입력");
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
										</header>
										<form action="${pageContext.request.contextPath}/memberUpdate" id="profile_update" method="post">
											<!-- 아이디<input type="text" value="${User.member_id }"id="member_id" name="member_id" readonly="readonly">  -->						
											이름  <input type="text" value="${MyPage.member_name }"id="member_name"  name="member_name" class="profile" >
											이메일<input type="text" value="${MyPage.member_email }"id="member_email" name="member_email" class="profile" >
											<!--  주소<input type="text" value="${User.member_address }"id="member_address" name="member_address" readonly>-->
											핸드폰<input type="text" value="${MyPage.member_phone }"id="member_phone" name="member_phone" class="profile" >
											생일 <input type="date" id="member_birth" name="member_birth" value="${MyPage.member_birth }" min="1940-01-01" style=" width: 100%; border-radius: 6px;height: 44px;" class="profile" >											
											
											<c:if test="${memberUpdate eq 1}">
												<input type="text" value="수정 완료" style="background: rgb(68, 68, 68);color: white;text-align: center;">												
											</c:if>
											<button id="update_profile" type="submit" class="profile_btn">개인정보 수정</button>
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
										</header>
										<form action="${pageContext.request.contextPath}/memberUpdate_pw" id="profile_update" method="post">
											예전 비밀번호 <input type="password" id="old_pw" name="old_pw" class="password" >
											새 비밀번호 <input type="password" id="new_pw1" name="new_pw" class="password" >
											새 비밀번호 확인 <input type="password" id="new_pw2" name="new_pw" class="password" >											
											<c:if test="${PasswordUpdate eq 1}">
												<input type="text" value="비밀번호 수정 완료" style="background: rgb(68, 68, 68);color: white;text-align: center;">
											</c:if>
																						
											<c:if test="${PasswordUpdate eq 0}">
												<input type="text" value="비밀번호가 틀렸습니다." style="background: rgb(68, 68, 68);color: white;text-align: center;">
											</c:if>
											<button id="update_password" type="submit" class="profile_btn">비밀번호 수정</button>
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
										</header>
										<!--  insert된 데이터가 있었다면 readonly로 하고 수정으로 변경 없다면 입력으로 변경 -->
										<form action="${pageContext.request.contextPath}/memberHelth" id="profile_update" method="post">						
											키 : <input type="text" id="health_height" name="health_height"  class="kcal" value="${kcal.health_height }cm" >
											몸무게 : <input type="text" id="health_weight" name="health_weight"  class="kcal" value="${kcal.health_weight }kg" >
											 하루섭취 칼로리 <input type="text"  value="${kcal.health_basal }㎉" readonly="readonly">
											<c:if test="${Health eq 1}">
												<input type="text" value="건강정보 등록 및 수정 완료">
											</c:if>											
												<button id="insert_helth" type="submit" class="profile_btn">신체 사이즈 입력/수정</button>
										</form>
									</div>
								</section>

						</div>
						
						<div class="col-4 col-12-medium">

							<!-- Box -->
								<section class="box feature">									
									<div class="inner">
										<header>
											<h2><button id="helth_insert_Btn" class="profile_btn">프로필 사진 등록</button></h2>											
										</header>
										<!--  insert된 데이터가 있었다면 readonly로 하고 수정으로 변경 없다면 입력으로 변경 -->
										<form action="${pageContext.request.contextPath}/memberProfileImage" id="profile_update" method="post" enctype="multipart/form-data">						
<c:if test="${ null eq User.member_image }">
<div class="file-upload">
  <button class="file-upload-btn" type="button" onclick="$('.file-upload-input').trigger( 'click' )">사진 파일 첨부</button>

  <div class="image-upload-wrap">
    <input class="file-upload-input" type='file' onchange="readURL(this);" accept="image/*" name="file" />
    <div class="drag-text">
      <h3></h3>
    </div>
  </div>
  <div class="file-upload-content">
    <img class="file-upload-image" src="#" alt="your image" id="yourimage" />
    <div class="image-title-wrap">
      <button type="button" onclick="removeUpload()" class="remove-image">사진 삭제 <span class="image-title">Uploaded Image</span></button>
    </div>
  </div>
</div>
<button type="submit" id="profileimg_submit" class="profile_btn">프로필 사진 등록</button>
</c:if>

<c:if test="${ null ne User.member_image }" >
<div class="file-upload">
  <button class="file-upload-btn" type="button" onclick="$('.file-upload-input').trigger( 'click' )">사진 파일 첨부</button>
  
  <div class="image-upload-wrap" style="display: none;">
    <input class="file-upload-input" type='file' onchange="readURL(this);" accept="image/*" name="file" />
    <div class="drag-text">
      <h3></h3>
    </div>
  </div>
  
  <div class="file-upload-content" style="display: block;">
    <img class="file-upload-image" alt="프로필 이미지" src="${pageContext.request.contextPath}/resources/mypage/upload/${User.member_image}" />
    <div class="image-title-wrap">
      <button type="button" onclick="removeUpload()" class="remove-image">사진 변경</button>
    </div>
  </div>
  <button id="insert_profile_image" type="submit" class="profile_btn" >프로필 사진 변경 및 등록</button>  
</div>											
											<c:if test="${image eq 1}">					
												<input type="text" value="프로필 사진 등록 및 변경 완료.">
											</c:if>
												<!--  <button type="submit" class="profile_btn">프로필 사진 등록</button>-->

</c:if>											
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