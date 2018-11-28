<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
	<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Overpass:300,400,600,800'>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/tab/css/style.css">
	<style type="text/css">
		.loginbtn{
			margin: 8px;
		}
	</style>
</head>

<div class="tabset">
  <!-- Tab 1 -->
   
  <input type="radio" name="tabset" id="tab1" aria-controls="marzen" checked>
  <!-- 
  <label for="tab1">회원 로그인</label>
   -->
  <!-- Tab 2 -->
  <!-- 
  <input type="radio" name="tabset" id="tab2" aria-controls="rauchbier">
  <label for="tab2">파트너 로그인</label>
 	-->  
  <!-- Tab 3 -->
  <input type="radio" name="tabset" id="tab3" aria-controls="dunkles">
  <!-- <label for="tab3">관리자 로그인</label> -->
  
  <div class="tab-panels">
    <section id="marzen" class="tab-panel">
	  <form action="memberLogin" method="post" id="login_submit" onsubmit="return false;">
		  <input type="text" class="remodal-text" id="member_id" name="member_id" value="아이디" ><br>
		  <input type="text" class="remodal-text" id="member_pw" name="member_pw" value="패스워드">
		  <input type="text" class="remodal-text" id="idpwBox" name="idpwBox" value="아이디 /비밀번호가 맞지 않습니다." style=" background: #444444; color: white; visibility: hidden;">		  
		  <button id="member_login_btn" name="member" style="color: #fff;background: #444444;width: 100%;" class="loginbtn">로그인</button>
		  <button style="color: #fff;background: #444444;width: 100%;" class="loginbtn" onclick="location.href='idFind'">아이디 찾기</button>
		  <button style="color: #fff;background: #444444;width: 100%;" class="loginbtn" onclick="location.href='pwFind'">비밀번호 찾기</button>
		  
		  <button id="login_close" data-remodal-action="cancel" class="remodal-cancel" style=" background: #444444; color: white; visibility: hidden;">취소</button>
	  </form>
  </section>
  <!-- 
    <section id="rauchbier" class="tab-panel">
	  <form action="partnerLogin" method="post" id="login_submit" onsubmit="return false;">
		  <input type="text" class="remodal-text" id="partner_id" name="partner_id" value="파트너 아이디" ><br>
		  <input type="text" class="remodal-text" id="partner_pw" name="partner_pw" value="패스워드"><br>
		  <input type="text" class="remodal-text" id="idpwBox" name="idpwBox" value="아이디 /비밀번호가 맞지 않습니다." style=" background: #444444; color: white; visibility: hidden;">
		  <!-- <button data-remodal-action="cancel" class="remodal-cancel">취소</button> -->
<!-- 		  	  
		  <button id="partner_login_btn" name="partner" style="color: #fff;background: #444444;width: 100%;">로그인</button>
		  <button id="login_close" data-remodal-action="cancel" class="remodal-cancel" style=" background: #444444; color: white; visibility: hidden;">취소</button>
	  </form>
    </section>
 -->    
    <section id="dunkles" class="tab-panel">
	  <form action="adminLogin" method="post" id="login_submit" onsubmit="return false;">
		  <input type="text" class="remodal-text" id="admin_id" name="admin_id" value="관리자 아이디" ><br>
		  <input type="text" class="remodal-text" id="admin_pw" name="admin_pw" value="패스워드"><br><br>
		  <input type="text" class="remodal-text" id="idpwBox" name="idpwBox" value="아이디 /비밀번호가 맞지 않습니다." style=" background: #444444; color: white; visibility: hidden;">		  
		  <!-- <button data-remodal-action="cancel" class="remodal-cancel">취소</button> -->	  
		  <button id="admin_login_btn" name="admin" style="color: #fff;background: #444444;width: 100%;">로그인</button>
		  <button id="login_close" data-remodal-action="cancel" class="remodal-cancel" style=" background: #444444; color: white; visibility: hidden;">취소</button>
	  </form>
    </section>
  </div>
  
</div>