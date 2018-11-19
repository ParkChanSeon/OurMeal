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
	<%@ include file="../../resources/include/header.jsp"%>

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
	<!--  
		<script src="${pageContext.request.contextPath}/resources/search/js/mapScript.js"></script>
		-->





	<script>
		
		
		      
		
		/**
		 * 지도 
		 */

		var centerLoc;

		 var locationBtnHtml = '<a href="#" class="btn_mylct"><img src="${pageContext.request.contextPath}/resources/search/icon/toCenter.png" style="width:30px;height:30px; margin-top:5px; margin-left:5px;"></a>';
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

	
		//customControl 객체 이용하기
	    var customControl = new naver.maps.CustomControl(locationBtnHtml, {
	        position: naver.maps.Position.TOP_LEFT
	    });

	    customControl.setMap(map);

	    var domEventListener = naver.maps.Event.addDOMListener(customControl.getElement(), 'click', function() {
	        map.setCenter(centerLoc);
	    });
		
	  //Map 객체의 controls 활용하기
	    var $locationBtn = $(locationBtnHtml),
	        locationBtnEl = $locationBtn[0];
		
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
		    centerLoc=location;
		    
		   
		    
		    map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
		    map.setZoom(10); // 지도의 줌 레벨을 변경합니다.

		    infowindow.setContent('<div style="padding:20px;">' + '현재 위치' + '</div>');

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
		
		
		
		
		var HOME_PATH = window.HOME_PATH || '.';
		
		/* 
		var MARKER_SPRITE_X_OFFSET = 29,
		    MARKER_SPRITE_Y_OFFSET = 50,
		    MARKER_SPRITE_POSITION = {
		        "A0": [0, 0],
		        "B0": [MARKER_SPRITE_X_OFFSET, 0],
		        "C0": [MARKER_SPRITE_X_OFFSET*2, 0],
		        "D0": [MARKER_SPRITE_X_OFFSET*3, 0],
		        "E0": [MARKER_SPRITE_X_OFFSET*4, 0],
		        "F0": [MARKER_SPRITE_X_OFFSET*5, 0],
		        "G0": [MARKER_SPRITE_X_OFFSET*6, 0],
		        "H0": [MARKER_SPRITE_X_OFFSET*7, 0],
		        "I0": [MARKER_SPRITE_X_OFFSET*8, 0],

		        "A1": [0, MARKER_SPRITE_Y_OFFSET],
		        "B1": [MARKER_SPRITE_X_OFFSET, MARKER_SPRITE_Y_OFFSET],
		        "C1": [MARKER_SPRITE_X_OFFSET*2, MARKER_SPRITE_Y_OFFSET],
		        "D1": [MARKER_SPRITE_X_OFFSET*3, MARKER_SPRITE_Y_OFFSET],
		        "E1": [MARKER_SPRITE_X_OFFSET*4, MARKER_SPRITE_Y_OFFSET],
		        "F1": [MARKER_SPRITE_X_OFFSET*5, MARKER_SPRITE_Y_OFFSET],
		        "G1": [MARKER_SPRITE_X_OFFSET*6, MARKER_SPRITE_Y_OFFSET],
		        "H1": [MARKER_SPRITE_X_OFFSET*7, MARKER_SPRITE_Y_OFFSET],
		        "I1": [MARKER_SPRITE_X_OFFSET*8, MARKER_SPRITE_Y_OFFSET],

		        "A2": [0, MARKER_SPRITE_Y_OFFSET*2],
		        "B2": [MARKER_SPRITE_X_OFFSET, MARKER_SPRITE_Y_OFFSET*2],
		        "C2": [MARKER_SPRITE_X_OFFSET*2, MARKER_SPRITE_Y_OFFSET*2],
		        "D2": [MARKER_SPRITE_X_OFFSET*3, MARKER_SPRITE_Y_OFFSET*2],
		        "E2": [MARKER_SPRITE_X_OFFSET*4, MARKER_SPRITE_Y_OFFSET*2],
		        "F2": [MARKER_SPRITE_X_OFFSET*5, MARKER_SPRITE_Y_OFFSET*2],
		        "G2": [MARKER_SPRITE_X_OFFSET*6, MARKER_SPRITE_Y_OFFSET*2],
		        "H2": [MARKER_SPRITE_X_OFFSET*7, MARKER_SPRITE_Y_OFFSET*2],
		        "I2": [MARKER_SPRITE_X_OFFSET*8, MARKER_SPRITE_Y_OFFSET*2]
		    };
		 */
		
		
		
		var bounds = map.getBounds(),
	    southWest = bounds.getSW(),
	    northEast = bounds.getNE(),
	    lngSpan = northEast.lng() - southWest.lng(),
	    latSpan = northEast.lat() - southWest.lat();

	var markers = [],
	    infoWindows = [];

	
	var storeList;
	<c:forEach items="${test}" var = "list">
		
	    var position = "${list.store_loc};"
	    
	    alert("${list.store_loc}");
	    var storeLoc;
	   
	      naver.maps.Service.geocode({address: position}, function(status, response) {
	          if (status !== naver.maps.Service.Status.OK) {
	              return alert('의 검색 결과가 없거나 기타 네트워크 에러');
	          }
	          var result = response.result;
	          // 검색 결과 갯수: result.total
	          // 첫번째 결과 결과 주소: result.items[0].address
	          // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
	           storeLoc =  new naver.maps.LatLng(result.items[0].point.x, result.items[0].point.y);
	          
	          alert("streLoc : "+ storeLoc);
	      
	      });
	      

	      var position= new naver.maps.LatLng(streLoc);
	    var marker = new naver.maps.Marker({
	        map: map,
	        position: position,
	        title: "${list.store_title}",
	        icon: {
	            url: HOME_PATH +'/img/example/sp_pins_spot_v3.png',
	            size: new naver.maps.Size(24, 37),
	            anchor: new naver.maps.Point(12, 37),
	            origin: new naver.maps.Point(MARKER_SPRITE_POSITION[key][0], MARKER_SPRITE_POSITION[key][1])
	        },
	        zIndex: 100
	    });
	    
	  
		
	    var infoWindow = new naver.maps.InfoWindow({
	        content: '<div style="width:150px;text-align:center;padding:300px;"><table><tr><td>${list.store_title}'+
	        '</td></tr><tr><td>${list.store_info}</td></tr></table></div>'
	    });

	    markers.push(marker);
	    infoWindows.push(infoWindow);
	
	    </c:forEach>
	   
	
	
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
		
	
		
		
		 /* var list;

		 $( function() {
	                                    
	       
	         <c:forEach items="${list}" var="d_list">
	             list = '${d_list}'
	             
	         </c:forEach>
	                
	     } );
		
		
		
		for(var i = 0; i < list.size; i++)
			
		var marker = new naver.maps.Marker({
		    position: new naver.maps.LatLng(list[i]),
		    map: map
		}); */




		
	


	</script>

</body>
</html>