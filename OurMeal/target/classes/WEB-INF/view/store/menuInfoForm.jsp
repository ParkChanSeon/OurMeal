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
<!-- 에러?

<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
 -->
 
 
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
<body class="is-preload homepage">

	<!-- Main Menu -->
	<%@ include file="/WEB-INF/resources/store/css/storeHeader.jsp"%>

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
		
		<form name= "form" id="form" action="${pageContext.request.contextPath}/storeInfoUpdate" method="POST" enctype="multipart/form-data">
		
		<table id="menuInfo" class="table table-hover" >
<c:forEach items = "${menuList}" var="menu">
<tr>
<th rowspan="5" style="width: 250px; height: 250px; text-align: center; vertical-align: middle;">

		<input type="hidden" name = "fm_image" value="${store.store_image }">
			  
           <span class="btn btn-default btn-file" style="width:250px; height:250px; vertical-align: middle; padding:0;" >
           	
             
             <c:if test="${menu.fm_image eq null }" var = "photo">
             <input type="file" id="imgInp" name="file">
             <img src="${pageContext.request.contextPath}/resources/store/icon/addPhoto.png" style="width:250px; height:250px;" />       	
            </c:if>
            <c:if test ="${not photo}" >
            <input type="file" id="imgInp" name="file">
             <img src="${pageContext.request.contextPath}${menu.fm_image}" style="width:250px; height:250px;" />
            </c:if>
            </span>

<td style="text-align: left;"><b class="name_label">메뉴이름</b> <input type="text" name="fm_name" placeholder="${menu.fm_name}" value="${menu.fm_name}"></td>
</tr>
<tr>
<td style="text-align: left;"><b class="name_label">열량</b><input type="text" name="fm_kcal" placeholder="${menu.fm_kcal}" value="${menu.fm_kcal}"> kcal</td>
</tr>

<tr style="text-align: left;">
<td><b class="name_label">알레르기</b>
<input type="checkbox" name="allergy" value="1"/>계란									<input type="checkbox" name="allergy" value="2"/>우유
<input type="checkbox" name="allergy" value="3"/>메밀
<input type="checkbox" name="allergy" value="4"/>밀
<input type="checkbox" name="allergy" value="5"/>대두
<input type="checkbox" name="allergy" value="6"/>견과류
<input type="checkbox" name="allergy" value="7"/>복숭아
<input type="checkbox" name="allergy" value="8"/>토마토
<input type="checkbox" name="allergy" value="9"/>돼지고기
<input type="checkbox" name="allergy" value="10"/>쇠고기
<input type="checkbox" name="allergy" value="11"/>닭고기
<input type="checkbox" name="allergy" value="12"/>고등어
<input type="checkbox" name="allergy" value="13"/>새우
<input type="checkbox" name="allergy" value="14"/>홍합
<input type="checkbox" name="allergy" value="15"/>전복
<input type="checkbox" name="allergy" value="16"/>굴
<input type="checkbox" name="allergy" value="17"/>조개류
<input type="checkbox" name="allergy" value="18"/>게
<input type="checkbox" name="allergy" value="19"/>오징어
</td>




</tr>

<tr style="text-align: left;">
<td><b class="name_label">가격</b><input type="text" name="fm_price" placeholder="${menu.fm_price}" value="${menu.fm_price}"></td>
</tr>

<tr style="text-align: left;">
<td><b class="name_label">메뉴정보</b><input type="text" name="fm_info" placeholder="${menu.fm_info}" value="${menu.fm_info}"></td>
</tr>


</c:forEach>
</table>
		
		
		
		
		<div class="container" >
		
 		
		</div>
		</form>
	</section>
	</div>
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
	