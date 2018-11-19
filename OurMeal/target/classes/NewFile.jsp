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
	var mapContainer = document.getElementById('map');
	var mapOption = {
	    center: new daum.maps.LatLng(37.450701, 126.570667),
	    level: 14
	};  

	var map = new daum.maps.Map(mapContainer, mapOption); 

	var geocoder = new daum.maps.services.Geocoder();
	var listData = [
	    '제주특별자치도 제주시 첨단로 242', 
	    '제주특별자치도 제주시 첨단로 241', 
	    '서울특별시 송파구 오금로13길 8',
	    '서울특별시 송파구 올림픽로 25',
	    '서울특별시 광진구 동일로18길 80',
	    '서울특별시 종로구 지봉로 25',
	    '서울특별시 성북구 인촌로 73',
	    '강원도 춘천시 춘천로310번길 26',
	    '강원 강릉시 운산동 1081',
	    '충북 단양군 단양읍 천동리 산 9-1',
	    '세종특별자치시 금남면 장재리 산 31',
	    '경북 청도군 화양읍 고평리 산 79-2',
	    '전라남도 나주시 노안면 학산용산길 104-1'
	];

	listData.forEach(function(addr, index) {
	    geocoder.addressSearch(addr, function(result, status) {
	        if (status === daum.maps.services.Status.OK) {
	            var coords = new daum.maps.LatLng(result[0].y, result[0].x);

	            var marker = new daum.maps.Marker({
	                map: map,
	                position: coords
	            });
	            var infowindow = new daum.maps.InfoWindow({
	                content: '<div style="width:150px;text-align:center;padding:6px 0;">' + listData[index] + '</div>',
	                disableAutoPan: true
	            });
	            infowindow.open(map, marker);
	        } 
	    });
	});

	</script>

</body>
</html>