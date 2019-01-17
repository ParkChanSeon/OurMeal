<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE HTML>
<html>
<head>
<title>Our Meal</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />

<!-- search css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/search/css/searchPage.css">

<!-- main menu -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main/assets/css/main.css">
		
		<!-- popup css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/popup/dist/remodal-default-theme.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/main.css">

<!-- 다음api 키 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8bd7d15257e00e41f64c0002667a8c53&libraries=services"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8bd7d15257e00e41f64c0002667a8c53&libraries=clusterer"></script>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8bd7d15257e00e41f64c0002667a8c53&libraries=drawing"></script>


<style type="text/css">
</style>

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
	
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/mypage/css/jquery.circularise.min.js"></script>
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/mypage/css/jquery.circularise.js"></script>
 
<script>
	
	$(document).ready(function(){
		
		
			
			   
			  $('ul.tabs li').click(function(){
			    var tab_id = $(this).attr('data-tab');
			 
			    $('ul.tabs li').removeClass('current');
			    $('.tab-content').removeClass('current');
			 
			    $(this).addClass('current');
			    $("#"+tab_id).addClass('current');
			  })
		
	
	})

	
	</script>

<!-- main js -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/main/main.js"></script>

<!-- partner js -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/partner/js/partner.js"></script>
	

	
	
</head>
<body class="is-preload homepage">

	<!-- Main Menu -->
	<%@ include file="/WEB-INF/resources/store/css/storeHeader.jsp"%>

	<!-- Main Menu Scripts -->
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
		
		
		<div class="searchBack">
		<div class="map_div" >
		<div  id="map">
		</div>
		
		</div>
		
		<div class ="list_back">
		<div class ="inner">
		<section class = "inner_top">
		<div class ="search_title">
		<span class="search_span">
		<strong>${value}에 대한 검색 결과</strong>
		</span>
		</div>
		</section>
		<section class="inner_mid">
		<div class = "inner_mid_div">
		<ul class ="store_list">
		<c:forEach items="${storeList}" var="list">
		<li class = "list_store_render_result_item">
		<figure class ="list_store_item">
		<div class="store_thumb">
		<a href="${pageContext.request.contextPath}/storePage?store_code=${list.store_code}">
		<img class ="list_store_image" src="${pageContext.request.contextPath}${list.store_image}">
		</a>
		</div>
		<figcaption>
		<div class="info">
		<a  class="store_title_a" href="${pageContext.request.contextPath}/storePage?store_code=${list.store_code}">
		<h2 class="store_title">${list.store_title}</h2></a><strong class="store_score">
		
		(${list.score_avg})점
		</strong>
		<p class = "menu"><b>${list.store_type}</b></p>
		<p class ="addr"><b>${list.store_address}</b></p>
		<p class="ect"><img class="reviewCountIcon" src="${pageContext.request.contextPath}/resources/store/icon/icons8-edit.png"><b>${list.store_reviewCount}</b></p>
		
		</div>
		</figcaption>
		</figure>
		</li>
		</c:forEach>
		
		
		</ul>
		</div>
		</section>
		</div>
		
		<div class="spaceA"></div>
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
	
	
	
	
	
	<script>
		

		document
				.addEventListener(
						"DOMContentLoaded",
						function() {

							var centerLoc;

							function getLocation(position) {

								var latitud = position.coords.latitude;
								var longitude = position.coords.longitude;

								centerLoc = new daum.maps.LatLng(latitud,
										longitude);

								var mapContainer = document
										.getElementById("map") // 지도를 표시할
								// DIV
								var mapOption = {
									center : new daum.maps.LatLng(latitud,
											longitude) // 지도의
									// 중심좌표
									,
									level : 3
								// 지도의 확대레벨
								};

								// 지도를 생성
								var map = new daum.maps.Map(mapContainer,
										mapOption);

								// 컨트롤러 생성
								var mapTypeControl = new daum.maps.MapTypeControl();

								// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
								// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를
								// 의미합니다
								map.addControl(mapTypeControl,
										daum.maps.ControlPosition.TOPRIGHT);

								// 지도 확대 축소를 제어할 수 있는 줌 컨트롤을 생성합니다
								var zoomControl = new daum.maps.ZoomControl();
								map.addControl(zoomControl,
										daum.maps.ControlPosition.RIGHT);

								// 사용자 지정 컨트롤러

								// 마커가 표시될 위치
								var markerPosition = new daum.maps.LatLng(
										latitud, longitude);

								// 마커를 생성
								var marker = new daum.maps.Marker({
									position : markerPosition
								});

								marker.setMap(map);

								// 원 생성

						

								var circle = new daum.maps.Circle({
									center : new daum.maps.LatLng(latitud,
											longitude), // 원의 중심좌표
									// 입니다
									radius : 50, // 미터 단위의 원의 반지름입니다
									strokeWeight : 5, // 선의 두께입니다
									strokeColor : '#75B8FA', // 선의 색깔입니다
									strokeOpacity : 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
									strokeStyle : 'dashed', // 선의 스타일 입니다
									fillColor : '#CFE7FF', // 채우기 색깔입니다
									fillOpacity : 0.7
								// 채우기 불투명도 입니다
								});

								// 지도에 원을 표시합니다
								circle.setMap(map);


								
								
								// 주소-좌표 변환 객체를 생성합니다
								var geocoder = new daum.maps.services.Geocoder();
							
								var store = new Array();
								
								  <c:forEach items="${storeList}" var="list" >
								var storeMap = new Map();
								  
								  storeMap.set("store_title","${list.store_title}" );
								  storeMap.set("store_info","${list.store_address}" );
								  storeMap.set("loc_code","${list.loc_code}");
								  storeMap.set("store_image","${list.store_image}");
								  storeMap.set("store_code","${list.store_code}");
								  
								  store.push(storeMap);
								  </c:forEach>
								
					
				// 마커 이미지
				var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
						
						
					
				var content=[];
				
				var geocoder = new daum.maps.services.Geocoder();	
				
				var i = 0;
		store.forEach(function(addr,i){
				
				
				var loc = store[i].get("store_info");
				var title = store[i].get("store_title");
				var info = store[i].get("store_info");
				var img = "${pageContext.request.contextPath}"+store[i].get("store_image");
				var store_code = store[i].get("store_code");
				
				
				content.push ('<div class="map_info_div"><div class="info_img_div"><span class="info_img_span">'
						+'<img class = "info_img" src="'+img+'"></span></div>'	
						+'<div class="info_info">'+'<span class="info_title"><b class="it">'+title+'</b></span>'
						+'<span class="info_addr"><b class="ia">주소 : '+info+'</b></span>'+'</div></div>');
				
						
				// 주소 -> 좌표 변환
				geocoder.addressSearch(loc, function(result, status) {	
				

									// 정상적으로 검색이 완료됐으면
										if (status === daum.maps.services.Status.OK) {
										
											var coords =  new daum.maps.LatLng(result[0].y,result[0].x);
											
										     
											
					// 마커 이미지의 이미지 크기 입니다
					var imageSize = new daum.maps.Size(24, 35);

					// 마커 이미지를 생성합니다
					var markerImage = new daum.maps.MarkerImage(
							imageSrc, imageSize);

					// 마커를 생성합니다
					var marker = new daum.maps.Marker({
						map : map, // 마커를 표시할 지도
						position : coords,
							//infoMap.get("latlng"), // 마커의 위치
						image : markerImage
					});
					
						
					// 마커에 표시할 인포윈도우를 생성합니다
				var infowindow = new daum.maps.InfoWindow({
					content : content[i]
																																			
					// 인포윈도우에 표시할 내용
					});
					
						
					
					// 이벤트 리스너로는 클로저를 만들어 등록합니다
					// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
				 	
				var test = 0;
						daum.maps.event.addListener(marker, 'click', function() {
					        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
					       if(test == 0){
					        infowindow.open(map, marker);
					        test = 1;
					       }else {
					    	   
					       infowindow.close();
					       test = 0;}
					        
						});
					
					 
					i++;
				}

					
	});
				
				
			
			
			
			})
				// 인포윈도우를 표시하는 클로저를 만드는 함수입니다
								function makeOverListener(map, marker,
										infowindow) {
									return function() {
										infowindow.open(map, marker);
									};
								}

								// 인포윈도우를 닫는 클로저를 만드는 함수입니다
								function makeOutListener(infowindow) {
									return function() {
										infowindow.close();
									};
								}

							}

							if (navigator.geolocation) {
								navigator.geolocation.getCurrentPosition(
										getLocation, function(error) {
											consol.log(error.message);
										});
							} else {
								consol.log("Geolocation을 지원하지 않는 브라우저 입니다.");
							}

						});
	</script>
	
	
	
	
	
	
	
	
	</body>
	</html>
	