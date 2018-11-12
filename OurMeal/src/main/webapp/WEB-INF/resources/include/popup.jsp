<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="remodal-bg">
  <a href="#modal">Modal 1</a><br>
</div>

<div class="remodal" data-remodal-id="modal" role="dialog" aria-labelledby="modal1Title" aria-describedby="modal1Desc">
  <button data-remodal-action="close" class="remodal-close" aria-label="Close"></button>
  <div>
    <h2 id="modal1Title">회원 로그인</h2>
    <p id="modal1Desc">

    </p>
  </div>
  <br>
  <input type="text" class="remodal-text" name="member_id" value="아이디" ><br>
  <input type="text" class="remodal-text" name="member_pw" value="패스워드"><br><br>
  <!-- <button data-remodal-action="cancel" class="remodal-cancel">취소</button> -->
  <button data-remodal-action="confirm" class="remodal-confirm">로그인</button>
</div>
