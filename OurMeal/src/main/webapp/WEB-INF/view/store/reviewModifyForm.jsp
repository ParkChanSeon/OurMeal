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
		
		$(document).on('change', '.btn-file :file', function() {
			var input = $(this),
				label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
			input.trigger('fileselect', [label]);
			});

			$('.btn-file :file').on('fileselect', function(event, label) {
			    
			    var input = $(this).parents('.input-group').find(':text'),
			        log = label;
			    
			    if( input.length ) {
			        input.val(log);
			    } else {
			        //if( log ) alert(log);
			    }
		    
			});
			function readURL(input) {
			    if (input.files && input.files[0]) {
			        var reader = new FileReader();
			        
			        reader.onload = function (e) {
			            $('#img-upload').attr('src', e.target.result);
			        }
			        
			        reader.readAsDataURL(input.files[0]);
			    }
			}

			$("#imgInp").change(function(){
			    readURL(this);
			}); 
		
		
		   
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
		  alert($(this).text());
		  document.form.sb_score.value=$(this).text();
		  alert('히든값: '+document.form.sb_score.value)
		  return false;
		});
	
	
	})
	
	
function cancle(){
	if(confirm("취소하시겠습니까?")){
		window.history.back();
	}
	
	

}
	

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
		<form name= "form" id="form" action="${pageContext.request.contextPath}/reviewModify" 
		method="post" enctype="multipart/form-data" onsubmit="return check();">
		<input type="hidden" name = "member_id" value="${sessionScope.User.member_id}">
		<input type="hidden" name = "sb_no" value="${review.sb_no}">
		<input type="hidden" name = "store_code" value="${review.store_code}">
		<div class ="reviewWriteForm">
		<div class ="reviewHeader">
		<div class="store_title">
		<h2 class="title_h2">${store_title}</h2>
		<h3 class="title_h3"><b>${review.member_id}</b>님의 리뷰수정</h3>  
		
		</div>
		
		<div class="score_div">
  		
		<span class="star_span">
		<span class="starRev">
		<label style="width: 40px;margin:0; display: inline-block; font-size:16px; padding-top: 20px;">별점 : </label>
		
		<span class="starR <c:if test="${review.sb_score eq '1.0'}">on</c:if>" id="star1">1</span>
  		
  		<span class="starR <c:if test="${review.sb_score eq '2.0'}">on</c:if>" id="star2">2</span>
  		<span class="starR <c:if test="${review.sb_score eq '3.0'}">on</c:if>" id="star3">3</span>
		<span class="starR <c:if test="${review.sb_score eq '4.0'}">on</c:if>" id="star4" >4</span>
		<span class="starR <c:if test="${review.sb_score eq '5.0'}">on</c:if>" id="star5" >5</span>
  	
		</span>
		
		<input type = "hidden" name = "sb_score" value="1" >
		</span>
		
		</div>
  		</div>
  		
		
		<div class="writeBack">
		
		<div class="file_form">
		<input type="hidden" name = "sb_image" >
		
           <span class="btn btn-default btn-file" 
           style="width:200px; height:200px; vertical-align: middle; padding:0; display:inline-block;" >
           	 
           	 <c:if test="${review.sb_image == null}" var = "reviewImage">
             <input type="file" id="imgInp" name="file">
             <img id='img-upload' src="${pageContext.request.contextPath}/resources/store/icon/addPhoto.png" style="width:200px;height:200px;"/>       	
            </c:if>
            <c:if test ="${not reviewImage}" >
            <input type="file" id="imgInp" name="file">
             <img id='img-upload' src="${pageContext.request.contextPath}${review.sb_image}"style="width:200px;height:200px;" />
            </c:if>
           
           <input type="hidden" name="sb_image" value="${reivew.sb_image}">
            </span>
		
		</div>
		
		
		<div class="write_from">
		
		<div class="content">
		<textarea name="sb_content" rows="10" cols="30" 
		style="resize: none; font-size:18px;"required="required">${review.sb_content}</textarea>
		
		
		
		</div>
		</div>
		<div class="button_div">
		
		<input type="button" value="취소" style="width: 150px; height:50px; display:inline-block;" onclick="cancle()">
		<input type="submit" value="완료" style="width: 150px; height:50px; display:inline-block;" 
		onclick="opener.document.location.reload();self.close();">
		
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
	