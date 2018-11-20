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
<!-- main menu -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/main/assets/css/main.css">

<!-- 다음api 키 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8bd7d15257e00e41f64c0002667a8c53&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8bd7d15257e00e41f64c0002667a8c53&libraries=clusterer"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8bd7d15257e00e41f64c0002667a8c53&libraries=drawing"></script>


<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/main/assets/js/jquery-3.3.1.min.js"></script>

<!-- popup css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/popup/dist/remodal-default-theme.css">

<!-- main css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/main.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/search/css/searchResult.css">
</head>
<body class="is-preload homepage">
	<!-- Main Menu -->

	<!-- Main Menu Scripts -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.min.js"></script>
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


	<div class="searchResultBack">
		<div class="searchResultTop"></div>
		<div class="right_div">
			<div id="map" style="width: 400px; height: 400px;"></div>
		</div>
		<div class="searchResult_form">


			<!--  test -->
			<div class="value_div">

				<h2>${value}인기 검색 순위</h2>
			</div>
	</div>

	</div>


	<script>	
	var geocoder = new daum.maps.services.Geocoder();

	var callback = function(result, status) {
	    if (status === daum.maps.services.Status.OK) {

	        console.log('지역 명칭 : ' + result[0].address_name);
	        console.log('행정구역 코드 : ' + result[0].code);
	    }
	};

	geocoder.coord2RegionCode(126.9786567, 37.566826, callback);

	</script>

</body>
</html>