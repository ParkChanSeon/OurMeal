<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>파트너 신청 페이지</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!-- main menu -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main/assets/css/main.css">
		
		<!-- popup css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/popup/dist/remodal-default-theme.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/main.css">
  <style type="text/css">
.thumb-image{
 width:500px;
 position:relative;
 padding:5px;
}
</style>

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
		
	<div id="body">
		<!-- 이영역에 각자 구현할 태그를 작성! 샘플로 태그하나 넣어놈-->
		<div class="container">
			<br><br>		
			<form action="${pageContext.request.contextPath}/partnerapply" method="post" enctype="multipart/form-data">									
				사업자 등록번호(*숫자만 입력해 주세요.)<input type="text" id="partner_crn" name="partner_crn" placeholder="사업자 등록 번호를 입력 하세요.">
				<hr />
				사업자 등록일<input type="date" id="partnerdate" name="partnerdate" style="width:100%;"><br /><hr />				
<div id="wrapper" style="margin-top: 20px; width:100%; text-align:center;">
<p>사업자 등록증 이미지를 첨부해 주세요.</p><input id="fileUpload" multiple="multiple" type="file" name="files"/></div> 
<div id="image-holder" style="text-align: center;"></div>
<hr />
<div id="wrapper" style="margin-top: 20px; width:100%; text-align:center;">
<p>영업 신고증 이미지를 첨부해 주세요.</p><input id="fileUpload2" multiple="multiple" type="file" name="files"/></div> 
<div id="image-holder2" style="text-align: center;"></div>
<hr />								
				<input type="submit" id="partner_apply" value="파트너 승인 신청 하기" style="width: 100%;">
			</form>
		</div>
	</div>

<script>
$(document).ready(function() {
	/*
	var new_pw2_size = $("#new_pw2").val().trim().length;
	
	if(old_pw_size==0){
		alert("예전 비밀번호를 입력해 주세요.");
		$("#old_pw").focus();
		return false;
	}
	*/
	
	$("#partner_apply").click(function() {
		var partner_crn_size = $("#partner_crn").val().trim().length;
		var partnerdate_size = $("#partnerdate").val().trim().length;
		var fileUpload_size = $("#fileUpload").val().trim().length;
		var fileUpload2_size = $("#fileUpload2").val().trim().length;
		
		if(partner_crn_size==0){
			alert("사업자 등록번호를 입력해 주세요.");
			$("#partner_crn").focus();
			return false;
		}
		if(partnerdate_size==0){
			alert("사업자 등록일을 입력해 주세요");
			$("#partnerdate").focus();
			return false;
		}
		if(fileUpload_size==0){
			alert("사업자 등록증 이미지를 첨부해 주세요.");
			$("#fileUpload").focus();
			return false;
		}
		if(fileUpload2_size==0){
			alert("영업 신고증 이미지를 첨부해 주세요.");
			$("#fileUpload2").focus();
			return false;
		}
		
	});
	
	
        $("#fileUpload").on('change', function() {
          //Get count of selected files
          var countFiles = $(this)[0].files.length;
          var imgPath = $(this)[0].value;
          var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
          var image_holder = $("#image-holder");
          image_holder.empty();
          if (extn == "gif" || extn == "png" || extn == "jpg" || extn == "jpeg") {
            if (typeof(FileReader) != "undefined") {
              //loop for each file selected for uploaded.
              for (var i = 0; i < countFiles; i++) 
              {
                var reader = new FileReader();
                reader.onload = function(e) {
                  $("<img />", {
                    "src": e.target.result,
                    "class": "thumb-image"
                  }).appendTo(image_holder);
                }
                image_holder.show();
                reader.readAsDataURL($(this)[0].files[i]);
              }
            } else {
              alert("This browser does not support FileReader.");
            }
          } else {
            alert("Pls select only images");
          }
        });


$("#fileUpload2").on('change', function() {
          //Get count of selected files
          var countFiles = $(this)[0].files.length;
          var imgPath = $(this)[0].value;
          var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
          var image_holder = $("#image-holder2");
          image_holder.empty();
          if (extn == "gif" || extn == "png" || extn == "jpg" || extn == "jpeg") {
            if (typeof(FileReader) != "undefined") {
              //loop for each file selected for uploaded.
              for (var i = 0; i < countFiles; i++) 
              {
                var reader = new FileReader();
                reader.onload = function(e) {
                  $("<img />", {
                    "src": e.target.result,
                    "class": "thumb-image"
                  }).appendTo(image_holder);
                }
                image_holder.show();
                reader.readAsDataURL($(this)[0].files[i]);
              }
            } else {
              alert("This browser does not support FileReader.");
            }
          } else {
            alert("Pls select only images");
          }
        });

      });
</script>
		
		<!-- 이영역에 각자 구현할 태그를 작성! 여기까지!!!! -->
		
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