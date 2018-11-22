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

<!-- store css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/store/css/storePage.css">

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
		
		
		<div class="storeBack">
		
		<!-- 위쪽 사진 -->
		<div class="storeTop">
		<div class="span_div">
		<span class="top_img_span">          	
						<img class = "topImage" alt="가게 사진" src="${pageContext.request.contextPath}/resources/partner/image/store2.jpg">
		            </span>
		            
		            <span class="top_img_span">          	
						<img class = "topImage" alt="가게 사진" src="${pageContext.request.contextPath}/resources/partner/image/store2.jpg">
		            </span>
		            
		            <span class="top_img_span">          	
						<img class = "topImage" alt="가게 사진" src="${pageContext.request.contextPath}/resources/partner/image/store2.jpg">
		            </span>
		            
		            <span class="top_img_span">          	
						<img class = "topImage" alt="가게 사진" src="${pageContext.request.contextPath}/resources/partner/image/store2.jpg">
		            </span>
		            
		             <span class="top_img_span">          	
						<img class = "topImage" alt="가게 사진" src="${pageContext.request.contextPath}/resources/partner/image/store2.jpg">
		            </span>
		            
		           
		            
		           
		          </div>
		          
		
		</div>
		<div class="clear" style="height:30px"></div>
		
	<div class="colum-wrapper">
	
		<div class="left_div">
			<div id="map" style="width: 400px; height: 400px;"></div>
		</div>
		<div class="column-contents">
		
		<div class ="inner">
		
		<!-- 레스토랑 상세 -->
		<section class="restaurant-top">
		<header class = "info_title_header" style="border-bottom: 2px solid gray">
		<span class="title"><strong>${store_title}</strong></span>
		
		<span class="icon">
		<a href="#"><img src="${pageContext.request.contextPath}/resources/store/icon/review.png" style="width:50px;height:50px;"></a>
		</span>
		</header>
		</section>
		
		<section class="restaurant-detail">
		<div class="default_info_div">
		<div class="store_main_img_div"><img class = "store_main_img" alt="가게 사진" src="${pageContext.request.contextPath}/resources/partner/image/store2.jpg">
		
		<span class="icon" style=" margin:auto;">
		<a href="${pageContext.request.contextPath}/storeInfo"><img src="${pageContext.request.contextPath}/resources/store/icon/storeInfo.png" style="width:50px;height:50px;"></a>
		</span>
		
		
		
		</div>
		
		
		
		<div class="table_div">
		<table class ="res_info">
		
		<tr>
		<th>주소</th><td>${store_address}</td>
		</tr>
		
		<tr>
		<th>전화번호</th><td>${store_tel}</td>
		</tr>
		
		<tr>
		<th>음식종류</th><td>${store_type}</td>
		</tr>
		
		<tr>
		<th>주차</th><td>${store_parking}</td>
		</tr>
		
		<tr>
		<th>영업시간</th><td>${store_o_time}</td>
		</tr>
		
		<tr>
		<th>쉬는시간</th><td>${store_b_time}</td>
		</tr>
		
		<tr>
		<th>가게소개</th><td>${store_info}</td>
		</tr>
		
		
		</table>
		
		</div>
		</div>
		
		</section>
		
		
		<section class="restaurant-detail" style="padding-top:0; margin-top:0;">
		<div class="container" >
 
  <ul class="tabs">
    <li class="tab-link current" data-tab="tab-1" style="width:50%">메뉴</li>
    <li class="tab-link" data-tab="tab-2" style="width:50%">리뷰</li>
    
  </ul>
 
  <div id="tab-1" class="tab-content current" >
---- ---- -------- ---- ---- ---- ---- ---- ---- -------- ---- ---- ---- ---- ---- ---- -------- ---- ---- ---- ---- ---- ---- -------- ---- ---- ---- ---- ---- ---- -------- ---- ---- ---- ---- ---- ---- -------- ---- ---- ---- ----
  </div>
  <div id="tab-2" class="tab-content">
---- ---- ★------ ---- ---- ---- ---- ---- ---- -------- ---- ---- ---- ---- ---- ---- -------- ---- ---- ---- ★-- ---- ---- ------★ ---- ---- ---- ---- ---- ---- -------- ---- ---- ---- ---- ---- ---- ★------ ---- ---- ---- ----
  </div>
  
 
</div>
		
		
		
		</section>
		
		</div>
		
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
	
	
	
	
	
	<script>
		
	var loc = "${store_address}";
	var title = "${store_title}";
	var info = "${store_info}";
	
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();

	
	
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(loc, function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {

	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

	     // 마커 이미지
			var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
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

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new daum.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">요기</div>'
	        });
	        infowindow.close(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	    
	 	daum.maps.event.addListener(marker, 'click', function() {
	        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	       
	        infowindow.open(map, marker);
	   
		});
	 
	    
	    
	});    

	
	
	</script>
	
	
	
	
	
	
	
	
	</body>
	</html>
	