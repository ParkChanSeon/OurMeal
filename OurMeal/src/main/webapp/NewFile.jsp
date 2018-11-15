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

<!-- 네이버api 키 -->
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=5QVVMYuz12L_dtcYvgd8&submodules=geocoder"></script>
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
	var HOME_PATH = window.HOME_PATH || '.';
var MARKER_SPRITE_X_OFFSET = 29,
    MARKER_SPRITE_Y_OFFSET = 50,
    MARKER_SPRITE_POSITION = {
        "A0": [0, 0], 

    };
    
    
    alert(MARKER_SPRITE_POSITION);
	var map = new naver.maps.Map('map', {
	    center: new naver.maps.LatLng(37.3595704, 127.105399),
	    zoom: 10
	});

	var bounds = map.getBounds(),
	    southWest = bounds.getSW(),
	    northEast = bounds.getNE(),
	    lngSpan = northEast.lng() - southWest.lng(),
	    latSpan = northEast.lat() - southWest.lat();

	var markers = [],
	    infoWindows = [];

	for (var key in MARKER_SPRITE_POSITION) {

	    var position = new naver.maps.LatLng(
	        southWest.lat() + latSpan * Math.random(),
	        southWest.lng() + lngSpan * Math.random());
	    
	    alert(position);

	    var marker = new naver.maps.Marker({
	        map: map,
	        position: position,
	        title: key,
	        icon: {
	            url: HOME_PATH +'/img/example/sp_pins_spot_v3.png',
	            size: new naver.maps.Size(24, 37),
	            anchor: new naver.maps.Point(12, 37),
	            origin: new naver.maps.Point(MARKER_SPRITE_POSITION[key][0], MARKER_SPRITE_POSITION[key][1])
	        },
	        zIndex: 100
	    });
	    
	    alert("0" + MARKER_SPRITE_POSITION[key][0]);
	    alert("1" +MARKER_SPRITE_POSITION[key][1]);

	    var infoWindow = new naver.maps.InfoWindow({
	        content: '<div style="width:150px;text-align:center;padding:10px;">The Letter is <b>"'+ key.substr(0, 1) +'"</b>.</div>'
	    });

	    markers.push(marker);
	    infoWindows.push(infoWindow);
	};

	naver.maps.Event.addListener(map, 'idle', function() {
	    updateMarkers(map, markers);
	});

	function updateMarkers(map, markers) {

	    var mapBounds = map.getBounds();
	    var marker, position;

	    for (var i = 0; i < markers.length; i++) {

	        marker = markers[i]
	        position = marker.getPosition();

	        if (mapBounds.hasLatLng(position)) {
	            showMarker(map, marker);
	        } else {
	            hideMarker(map, marker);
	        }
	    }
	}

	function showMarker(map, marker) {

	    if (marker.setMap()) return;
	    marker.setMap(map);
	}

	function hideMarker(map, marker) {

	    if (!marker.setMap()) return;
	    marker.setMap(null);
	}

	// 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
	function getClickHandler(seq) {
	    return function(e) {
	        var marker = markers[seq],
	            infoWindow = infoWindows[seq];

	        if (infoWindow.getMap()) {
	            infoWindow.close();
	        } else {
	            infoWindow.open(map, marker);
	        }
	    }
	}

	for (var i=0, ii=markers.length; i<ii; i++) {
	    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
	}
	</script>

</body>
</html>