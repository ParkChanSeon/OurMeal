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
	$(document).ready(
			function() {
				$(document).on(
						'change',
						'.btn-file :file',
						function() {
							var input = $(this), label = input.val().replace(
									/\\/g, '/').replace(/.*\//, '');
							input.trigger('fileselect', [ label ]);
						});

				$('.btn-file :file').on(
						'fileselect',
						function(event, label) {

							var input = $(this).parents('.input-group').find(
									':text'), log = label;

							if (input.length) {
								input.val(log);
							} else {
								//if( log ) alert(log);
							}

						});
				function readURL(input) {
					if (input.files && input.files[0]) {
						var reader = new FileReader();

						reader.onload = function(e) {
							$('#img-upload').attr('src', e.target.result);
						}

						reader.readAsDataURL(input.files[0]);
					}
				}

				$("#imgInp").change(function() {
					readURL(this);
				});
			});
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
	<%@ include file="/WEB-INF/resources/include/header.jsp"%>

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
		
		<!-- 위쪽 사 -->
		<div class="storeTop">
		
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
		<div class="clear" style="height:20px"></div>
		<div class="left_div">
			<div id="map" style="width: 400px; height: 400px;"></div>
		</div>
		<div class="store_main">


			<!--  test -->
			<div class="value_div">
						<h1>${store_title}</h1>
				
				<div id="cv" class="instaFade">
	<div class="mainDetails">
		  
		  <p class="title">치킨이 생각날 때, 실패하지 않는 방법은 누나홀닭이 정답!! 쌈닭전문 오븐치킨, BEER 전문점 누나홀닭입니다!! 많이 많이 사랑해 주세요~ 튀기지 않은 후라이드~ 오븐치킨 누나홀닭~!! ※ 누나홀닭 닭고기는 신선한 국내산 냉장육만을 사용합니다. [누나홀닭 가맹문의 1577-5662]</p>
		
		<div class="card">	  
           <span class="btn btn-default btn-file" style="width: 100%;">          	
				<img alt="가게 사진" src="${pageContext.request.contextPath}/resources/partner/image/store2.jpg">
            </span>
		</div>
	</div>
	
	<div id="mainArea" class="quickFade delayFive">
		<section>
			<article>			
				<div class="sectionContent">
					<a href="#">리뷰 링크</a>
				</div>
			</article>
			<div class="clear"></div>
		</section>
		
		
		<section>	
			<div class="sectionContent">
				<article>
				<h1>음식 사진</h1>
				<div class="card">	  
		           
				</div>
				</article>
			</div>
			<div class="clear"></div>
		</section>
		
		<section>
			<div class="sectionTitle">
				<h1>판매 메뉴</h1>
			<select>
			  <option value="9">치킨</option>
			</select>
			</div>
		</section>
		<section>
			<div class="sectionTitle">
				<h1>칼로리 정보</h1>
			<select>
			  <option value="9">치킨</option>
			</select>
			</div>		
		</section>
			</div>
			<div class="sectionContent">
				<article>
					<h2>등록한 메뉴 정보 그대로 이곳에서 볼수 있도록 팝업창 내용을 넣어준다.</h2>
					<p class="subDetails">aaaaa</p>
					<p>bbbbbbbbbb</p>
				</article>
				
				<article>
					<h2>College/University</h2>
					<p class="subDetails">Qualification</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ultricies massa et erat luctus hendrerit. Curabitur non consequat enim.</p>
				</article>
			</div>
			<div class="sectionTitle">
				<h1>등록한 칼로리 정보를 보여준다.</h1>
			</div>			
			<div class="sectionContent">
				<article>
					<h2>등록한 칼로리 정보 그대로 이곳에서 볼수 있도록 팝업창 내용을 넣어준다.</h2>
					<p class="subDetails">aaaaa</p>
					<p>bbbbbbbbbb</p>
				</article>
				
				<article>
					<h2>College/University</h2>
					<p class="subDetails">Qualification</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ultricies massa et erat luctus hendrerit. Curabitur non consequat enim.</p>
				</article>
			</div>
			<div class="sectionTitle">
				<h1>등록한 알러지 정보를 보여준다.</h1>
			</div>			
			<div class="sectionContent">
				<article>
					<h2>등록한 알러지 정보 그대로 이곳에서 볼수 있도록 팝업창 내용을 넣어준다.</h2>
					<p class="subDetails">aaaaa</p>
					<p>bbbbbbbbbb</p>
				</article>
				
				<article>
					<h2>College/University</h2>
					<p class="subDetails">Qualification</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ultricies massa et erat luctus hendrerit. Curabitur non consequat enim.</p>
				</article>
			</div>						
			<div class="clear"></div>
				
				
				
				
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
	