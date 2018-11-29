<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Our Meal</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />

<!-- store css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/store/css/reviewPage.css">

<!-- main menu -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main/assets/css/main.css">
		
		<!-- popup css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/popup/dist/remodal-default-theme.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/main.css">

<style type="text/css">
</style>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<!-- 에러?

<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
 -->

<!-- jquery -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.min.js"></script>

<script>
	
	$(document).ready(function(){
		   
		  $('ul.tabs li').click(function(){
		    var tab_id = $(this).attr('data-tab');
		 
		    $('ul.tabs li').removeClass('current');
		    $('.tab-content').removeClass('current');
		 
		    $(this).addClass('current');
		    $("#"+tab_id).addClass('current');
		  })
	
	
	

			$('.starRev span').click(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  return false;
		});
	
	
	})
	
	
	
	


	</script>

<!-- main js -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/main/main.js"></script>

<!-- partner js -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/partner/js/partner.js"></script>
	

	
	
</head>
<body class="is-preload homepage">

	<!-- Main Menu -->
	<%@ include file="/WEB-INF/resources/store/css/storeHeader.jsp"%>

	<!-- Main Menu Scripts -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.dropotron.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/main/assets/js/browser.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/main/assets/js/breakpoints.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/main/assets/js/util.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/main/assets/js/main.js"></script>


		<!-- 이영역에 각자 구현할 태그를 작성! 샘플로 태그하나 넣어놈-->
		
		
		<div class="back">
		<form name= "form" id="form" action="${pageContext.request.contextPath}/storeInfoUpdate" 
		method="POST" enctype="multipart/form-data" onsubmit="return check();">
		<div class ="reviewWriteForm">
		<div class ="reviewHeader">
		<div class="store_title">
		<h2 class="title_h2">${store_title}</h2>  
		<h3 class="title_h3"> 에 대한 솔직한 리뷰를 남겨주세요.</h3>
		</div>
		
		<div class="score_div">
		
		<span class="star_span">
		<label style="width: 40px;margin:0; display: inline-block; font-size:16px; padding-top: 20px;">별점 : </label>
		
		<span class="starRev">
  		<span class="starR on" id="star1" >별1</span>
  		
  		<span class="starR" id="star2">별2</span>
  		<span class="starR" id="star3">별3</span>
  		<span class="starR" id="star4">별4</span>
  		<span class="starR" id="star5">별5</span>
  	
		</span>
		
		</span>
		</div>
		</div>
		<div class="writeBack">
		<div class = "member">
		
		<span style="text-align: left"><h3>작성자 : <br>${sessionScope.member_id}</h3></span>
		
		</div>
		
		
		<div class="write_from">
		
		<div class="content">
		<textarea rows="10" cols="30" placeholder="${sessionScope.member_id}님, 주문하신 메뉴는 어땠나요? 식당의 서비스와 분위기도 궁금해요!"
		style="resize: none;"
		>	</textarea>
		
		<div class="file_form">
		
		</div>
		
		</div>
		
		<div class="button">
		
		<input type="button" value="취소" style="width: 50px; height:50px;">
		<input type="submit" value="완료" style="width: 50px; height:50px;">
		
		</div>
		
		
		</div>
		
		
		
		</div>
		</div>
	
	</form>
	
	</div>
	

<!-- footer -->
	<%@ include file="../../resources/include/footer.jsp"%>

	<!-- popup -->
	<script
		src="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.js"></script>

	<!-- popup content -->
	<%@ include file="../../resources/include/popup.jsp"%>

	<script
		src="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/main/popup/dist/event.js"></script>
	
	
	</body>
	</html>
	