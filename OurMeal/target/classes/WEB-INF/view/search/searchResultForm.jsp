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
		<!--  
		<script src="${pageContext.request.contextPath}/resources/search/js/mapScript.js"></script>
		-->
		<script>
		
		/**
		 * 지도 
		 */




		//지도 생성 시에 옵션을 지정할 수 있습니다.
		var map = new naver.maps.Map('map', {
		        center: new naver.maps.LatLng(37.3595704, 127.105399), //지도의 초기 중심 좌표
		        zoom: 8, //지도의 초기 줌 레벨
		        minZoom: 1, //지도의 최소 줌 레벨
		        zoomControl: true, //줌 컨트롤의 표시 여부
		        zoomControlOptions: { //줌 컨트롤의 옵션
		            position: naver.maps.Position.TOP_RIGHT
		        }
		    });

		//setOptions 메서드를 이용해 옵션을 조정할 수도 있습니다.
		map.setOptions("mapTypeControl", true); //지도 유형 컨트롤의 표시 여부


		// 지도 인터랙션 옵션
		$("#interaction").on("click", function(e) {
		    e.preventDefault();

		    if (map.getOptions("draggable")) {
		        map.setOptions({ //지도 인터랙션 끄기
		            draggable: false,
		            pinchZoom: false,
		            scrollWheel: false,
		            keyboardShortcuts: false,
		            disableDoubleTapZoom: true,
		            disableDoubleClickZoom: true,
		            disableTwoFingerTapZoom: true
		        });

		        $(this).removeClass("control-on");
		    } else {
		        map.setOptions({ //지도 인터랙션 켜기
		            draggable: true,
		            pinchZoom: true,
		            scrollWheel: true,
		            keyboardShortcuts: true,
		            disableDoubleTapZoom: false,
		            disableDoubleClickZoom: false,
		            disableTwoFingerTapZoom: false
		        });

		        $(this).addClass("control-on");
		    }
		});

		// 관성 드래깅 옵션
		$("#kinetic").on("click", function(e) {
		    e.preventDefault();

		    if (map.getOptions("disableKineticPan")) {
		        map.setOptions("disableKineticPan", false); //관성 드래깅 켜기
		        $(this).addClass("control-on");
		    } else {
		        map.setOptions("disableKineticPan", true); //관성 드래깅 끄기
		        $(this).removeClass("control-on");
		    }
		});

		// 타일 fadeIn 효과
		$("#tile-transition").on("click", function(e) {
		    e.preventDefault();

		    if (map.getOptions("tileTransition")) {
		        map.setOptions("tileTransition", false); //타일 fadeIn 효과 끄기

		        $(this).removeClass("control-on");
		    } else {
		        map.setOptions("tileTransition", true); //타일 fadeIn 효과 켜기
		        $(this).addClass("control-on");
		    }
		});

		// min/max 줌 레벨
		$("#min-max-zoom").on("click", function(e) {
		    e.preventDefault();

		    if (map.getOptions("minZoom") === 10) {
		        map.setOptions({
		            minZoom: 1,
		            maxZoom: 14
		        });
		        $(this).val(this.name + ': 1 ~ 14');
		    } else {
		        map.setOptions({
		            minZoom: 10,
		            maxZoom: 12
		        });
		        $(this).val(this.name + ': 10 ~ 12');
		    }
		});

		//지도 컨트롤
		$("#controls").on("click", function(e) {
		    e.preventDefault();

		    if (map.getOptions("scaleControl")) {
		        map.setOptions({ //모든 지도 컨트롤 숨기기
		            scaleControl: false,
		            logoControl: false,
		            mapDataControl: false,
		            zoomControl: false,
		            mapTypeControl: false
		        });
		        $(this).removeClass('control-on');
		    } else {
		        map.setOptions({ //모든 지도 컨트롤 보이기
		            scaleControl: true,
		            logoControl: true,
		            mapDataControl: true,
		            zoomControl: true,
		            mapTypeControl: true
		        });
		        $(this).addClass('control-on');
		    }
		});

		$("#interaction, #tile-transition, #controls").addClass("control-on");


		var infowindow = new naver.maps.InfoWindow();

		function onSuccessGeolocation(position) {
		    var location = new naver.maps.LatLng(position.coords.latitude,
		                                         position.coords.longitude);

		    map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
		    map.setZoom(10); // 지도의 줌 레벨을 변경합니다.

		    infowindow.setContent('<div style="padding:20px;">' + 'geolocation.getCurrentPosition() 위치' + '</div>');

		    infowindow.open(map, location);
		    console.log('Coordinates: ' + location.toString());
		}

		function onErrorGeolocation() {
		    var center = map.getCenter();

		    infowindow.setContent('<div style="padding:20px;">' +
		        '<h5 style="margin-bottom:5px;color:#f00;">Geolocation failed!</h5>'+ "latitude: "+ center.lat() +"<br />longitude: "+ center.lng() +'</div>');

		    infowindow.open(map, center);
		}

		$(window).on("load", function() {
		    if (navigator.geolocation) {
		        navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation);
		    } else {
		        var center = map.getCenter();
		        infowindow.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5></div>');
		        infowindow.open(map, center);
		    }
		});




		
		</script>	
	
	</body>
</html>