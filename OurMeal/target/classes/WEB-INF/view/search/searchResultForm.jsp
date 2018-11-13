<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Our Meal</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!-- main menu -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main/assets/css/main.css">
		
		<!-- 네이버api 키 -->
		<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=5QVVMYuz12L_dtcYvgd8&submodules=geocoder"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/jquery-3.3.1.min.js"></script>
		
		<!-- popup css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/popup/dist/remodal-default-theme.css">
  		
  		<!-- main css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/main.css">	
		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/search/css/searchResult.css">
	</head>
	<body class="is-preload homepage">
		<!-- Main Menu -->
		<%@ include file="../../resources/include/header.jsp" %>
		
		<!-- Main Menu Scripts -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.dropotron.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/browser.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/breakpoints.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/util.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/main.js"></script>
	
			
		<!-- 이영역에 각자 구현할 태그를 작성! 샘플로 태그하나 넣어놈-->
		

<div class="searchResultBack">
<div class="searchResult_form">


<!--  test -->

	<h2>이 영역에 각자 구현할 태그를 작성!!</h2>


<div id="map" style="width:400px;height:400px;"></div>








		</div>
		</div>
		



		
		
		<!-- footer -->						
		<%@ include file="../../resources/include/footer.jsp" %>
		
		<!-- popup -->
		<script src="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.js"></script>
		
		<!-- popup content -->
		<%@ include file="../../resources/include/popup.jsp" %>

		<script src="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.js"></script>		
		<script src="${pageContext.request.contextPath}/resources/main/popup/dist/event.js"></script>
		<script src="${pageContext.request.contextPath}/resources/search/js/mapScript.js"></script>
	</body>
</html>