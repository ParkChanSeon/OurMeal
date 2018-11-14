<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
	<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Overpass:300,400,600,800'>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/tab/css/style.css">
</head>

<div class="tabset">
  <!-- Tab 1 -->
  <input type="radio" name="tabset" id="tab1" aria-controls="marzen" checked>
  <label for="tab1">회원 로그인</label>
  <!-- Tab 2 -->
  <input type="radio" name="tabset" id="tab2" aria-controls="rauchbier">
  <label for="tab2">파트너 로그인</label>
  <!-- Tab 3 -->
  <input type="radio" name="tabset" id="tab3" aria-controls="dunkles">
  <label for="tab3">관리자 로그인</label>
  
  <div class="tab-panels">
    <section id="marzen" class="tab-panel">
	  <form action="memberLogin" method="post" id="login_submit">
		  <input type="text" class="remodal-text" id="member_id" name="member_id" value="아이디" ><br>
		  <input type="text" class="remodal-text" id="member_pw" name="member_pw" value="패스워드"><br><br>
		  <!-- <button data-remodal-action="cancel" class="remodal-cancel">취소</button> -->	  
		  <button type="submit" data-remodal-action="confirm" class="remodal-confirm" id="login_btn">로그인</button>
	  </form>
  </section>
    <section id="rauchbier" class="tab-panel">
	  <form action="memberLogin" method="post" id="login_submit">
		  <input type="text" class="remodal-text" id="member_id" name="member_id" value="파트너 아이디" ><br>
		  <input type="text" class="remodal-text" id="member_pw" name="member_pw" value="패스워드"><br><br>
		  <!-- <button data-remodal-action="cancel" class="remodal-cancel">취소</button> -->	  
		  <button type="submit" data-remodal-action="confirm" class="remodal-confirm" id="login_btn">로그인</button>
	  </form>
    </section>
    <section id="dunkles" class="tab-panel">
	  <form action="memberLogin" method="post" id="login_submit">
		  <input type="text" class="remodal-text" id="member_id" name="member_id" value="관리자 아이디" ><br>
		  <input type="text" class="remodal-text" id="member_pw" name="member_pw" value="패스워드"><br><br>
		  <!-- <button data-remodal-action="cancel" class="remodal-cancel">취소</button> -->	  
		  <button type="submit" data-remodal-action="confirm" class="remodal-confirm" id="login_btn">로그인</button>
	  </form>
    </section>
  </div>
  
</div>