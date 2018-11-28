<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Our Meal</title>
<meta charset="utf-8" />


<!-- menuInfo css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/store/css/menuInfo.css">


<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<!-- jquery -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.min.js"></script>

	<script>
$(document).ready( function() {
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
});


function deleteMenu(){
	if(confirm("삭제하시겠습니까?")){
		
	}
}
</script>  	

<!-- jquery -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.min.js"></script>


<!-- main js -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/main/main.js"></script>
	
	
</head>
<body  class="is-preload homepage">
<div class="container" >
		
 		
		</div>
<div style="width:100%; height:100px"></div>

	<!-- Main Menu Scripts -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.min.js"></script>
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
		
		
		<div class="storeBack">
		<div class ="store_info_inner">
		<div class="info_title_header">
		
		<span class="info_title"><strong>메뉴 정보	Page</strong></span>
		
		
		

		</div>
		
		<section class="restaurant-detail" style="text-align: center;">
		
		
		
		<table id="menuInfo"  >
		<tr>
		<th colspan="2" style="text-align: right;">
		<form action ="${pageContext.request.contextPath}/addMenu" method="post">
		<input type="hidden" name="store_code" value="${store_code}">
		<input type="submit" value="메뉴추가" style="width:100px;height:50px;"/>
		</form>
		</th>
		</tr>
<c:forEach items = "${menuList}" var="menu" varStatus="status">

<tbody  style="border:1px solid gray">

<tr>

<th style="width: 20%; text-align: center ">

           <span class="btn btn-default btn-file" style="width:250px; height:250px; vertical-align: middle; padding:0;" >
           	
             
             <c:if test="${menu.fm_image eq null }" var = "photo" >
             
             <img src="${pageContext.request.contextPath}/resources/store/icon/addPhoto.png" style="width:250px; height:250px;" />       	
            </c:if>
            <c:if test ="${not photo}" >
            
             <img src="${pageContext.request.contextPath}${menu.fm_image}" style="width:250px; height:250px;" />
            </c:if>
            </span>
        <form name= "form" id="form" action="${pageContext.request.contextPath}/menuModify" method="POST">
		<input type="hidden" name = "store_code" value="${menu.store_code}">
		<input type="hidden" name= "fm_code" value="${menu.fm_code}">
		<input type="submit" value = "수정하기"/>
		</form>
		<form  id="form" action="${pageContext.request.contextPath}/menuInfoDelete" method="POST">
		<input type="hidden" name = "store_code" value="${menu.store_code}">
		<input type="hidden" name= "fm_code" value="${menu.fm_code}">
		<input type="submit" value = "삭제하기" onclick="confirm('삭제하시겠습니까?')"/>
		</form>
		
            </th>
<th style="text-align: center;">
<table id = "innerTable">
<tr style="text-align: center">
<th><b class="name_label">메뉴이름</b></th>
<td>${menu.fm_name}</td>
</tr>
<tr>
<th><b class="name_label">열량</b></th>
<td>
${menu.fm_kcal} kcal
</td>
</tr>
<tr>
<th>
<b class="name_label">알레르기</b>
</th>
<td>
${menu.fm_allergy}
</td>
</tr>

<tr>
<th><b class="name_label">가격</b></th>
<td>
${menu.fm_price} 원
</td>
</tr>

<tr>
<th><b class="name_label">메뉴정보</b></th>
<td>
${menu.fm_info}
</td>
<th></th>
</tr>

</table>

</th>
</tr>
</tbody>

</c:forEach>

</table>
		
		
		
		
		
		
	</section>
	</div>
	</div>
	
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
	