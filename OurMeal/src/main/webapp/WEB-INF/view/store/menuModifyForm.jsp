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
		
		<span class="info_title"><strong>메뉴 정보	수정 성공</strong></span>
		
		
		</div>
		
		<section class="restaurant-detail" style="text-align: center;">
		
		
		<form name= "form" id="form" action="${pageContext.request.contextPath}/menuModifyReq" method="POST" enctype="multipart/form-data">
		<table id="menuInfo"  >
		


<tbody  style="border:1px solid gray">

<tr>

<th style="width: 20%;">
		<input type="hidden" name = "fm_code" value="${menu.fm_code}">
		<input type="hidden" name = "store_code" value="${menu.store_code}">
		<input type="hidden" name = "fm_image" value="${menu.fm_image}">
           <span class="btn btn-default btn-file" style="width:250px; height:250px; vertical-align: middle; padding:0;" >
           	
             
             <c:if test="${menu.fm_image eq null }" var = "photo" >
          
             <img id='img-upload' src="${pageContext.request.contextPath}/resources/store/icon/addPhoto.png" style="width:250px; height:250px;" />       	
           <input type="file" id="imgInp" name="file">
			</c:if>
            <c:if test ="${not photo}" >
           
             <img id='img-upload' src="${pageContext.request.contextPath}${menu.fm_image}" style="width:250px; height:250px;" />
            <input type="file" id="imgInp" name="file">
            </c:if>
            
            </span>
            </th>
<th style="text-align: center;">
<table id = "innerTable">
<tr style="text-align: center">
<th><b class="name_label">메뉴이름</b></th>
<td><input class="inputField" type="text" name="fm_name" placeholder="${menu.fm_name}" value="${menu.fm_name}"></td>
</tr>
<tr>
<th><b class="name_label">열량</b></th>
<td>
<input class="inputField" type="number" name="fm_kcal" placeholder="${menu.fm_kcal}" value="${menu.fm_kcal}"> kcal
</td>
</tr>
<tr>
<th>
<b class="name_label">알레르기</b>
</th>
<td>
<c:forEach items ="${allergy}" var="all">
<input type="checkbox" name="allergy" value="${all.allergy_code}"/>${all.allergy_name}
</c:forEach>
</td>
</tr>

<tr>
<th><b class="name_label">가격</b></th>
<td>
<input class="inputField" type="number" name="fm_price" placeholder="${menu.fm_price}" value="${menu.fm_price}"> 원
</td>
</tr>

<tr>
<th><b class="name_label">메뉴정보</b></th>
<td>
<input  class="inputField" type="text" name="fm_info" placeholder="${menu.fm_info}" value="${menu.fm_info}">
</td>
<th></th>
</tr>

</table>

</th>
</tr>
<tr>
<th colspan="2" style="text-align: center">
<input type="submit" value="수정하기" style="display: inline-block;  width:150px; height: 50px;">
<input type="button"  style="display: inline-block; width:150px; height: 50px; " value="취소" onclick="window.history.back()">
</th>
</tr>
</tbody>

</table>
</form>		
		
		
		
		
		
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
	