<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/resources/main/slider/js/jquery.excoloSlider.js"></script>
<link href="${pageContext.request.contextPath}/resources/main/slider/css/jquery.excoloSlider.css" rel="stylesheet" />

<script src="http://alexgorbatchev.com/pub/sh/current/scripts/shCore.js" type="text/javascript"></script>
<script src="http://alexgorbatchev.com/pub/sh/current/scripts/shAutoloader.js" type="text/javascript"></script>

<script>
/*
	var root = "${pageContext.request.contextPath}";
	
    // Settings for Adaptive.js
    var ADAPT_CONFIG = {
        path: root+ '/resources/main/slider/css/',
        dynamic: true,
        range: [
            '0px    to 760px  = mobile.min.css',
            '760px  to 980px  = 720.min.css',
            '980px            = 960.min.css'
        ]
    };	
    */
</script>

<script src="${pageContext.request.contextPath}/resources/main/slider/js/adapt.min.js"></script>

<script>
function partner_link(data){
	//var data = $(this).attr("id");
	alert(data);
	location.href = "/OurMeal/storePage?store_code="+data;
}
/*
SyntaxHighlighter.config.tagName = "code";
    $(function () {
        $("#sliderA").excoloSlider();
        $("#sliderB").excoloSlider();
        
        
    });
    
 $( document ).ready(function() {	    	
     SyntaxHighlighter.autoloader(
             'js jscript javascript  http://alexgorbatchev.com/pub/sh/current/scripts/shBrushJScript.js'
           );
           SyntaxHighlighter.all();
 });
 */
</script>
</head>
<body>
<!-- 
<p class="slider_title">Our Meal BEST TODAY Food</p>
<div class="container_12">

	<div class="grid_8">	
		<div id="sliderA" class="slider">
			<img src="${pageContext.request.contextPath}/resources/main/slider/images/image1.jpg" />
			<img src="${pageContext.request.contextPath}/resources/main/slider/images/image2.jpg" />
			<img src="${pageContext.request.contextPath}/resources/main/slider/images/image3.jpg" />
			<img src="${pageContext.request.contextPath}/resources/main/slider/images/image4.jpg" />
			<img src="${pageContext.request.contextPath}/resources/main/slider/images/image5.jpg" />
			<img src="${pageContext.request.contextPath}/resources/main/slider/images/image6.jpg" />
			<img src="${pageContext.request.contextPath}/resources/main/slider/images/image7.jpg" />
			<a href="http://www.naver.com"><img src="${pageContext.request.contextPath}/resources/main/slider/images/image8.jpg" /></a>
		</div>
	</div>
	
</div>
 
<p>
-->
		<!-- Features -->
		<!-- 
			<div id="features-wrapper">
				<div class="container">
					<div class="row">
						<div class="col-4 col-12-medium">

							<!-- Box -->
							<!-- 
								<section class="box feature">
									<a href="#" class="image featured"><img src="${pageContext.request.contextPath}/resources/main/slider/images/image17.jpg" alt="" /></a>
									<div class="inner">
										<header>
											<h2>Put something here</h2>
											<p>Maybe here as well I think</p>
										</header>
										<p>Phasellus quam turpis, feugiat sit amet in, hendrerit in lectus. Praesent sed semper amet bibendum tristique fringilla.</p>
									</div>
								</section>

						</div>
						<div class="col-4 col-12-medium">

							<!-- Box -->
							<!-- 
								<section class="box feature">
									<a href="#" class="image featured"><img src="${pageContext.request.contextPath}/resources/main/slider/images/image18.jpg" alt="" /></a>
									<div class="inner">
										<header>
											<h2>An interesting title</h2>
											<p>This is also an interesting subtitle</p>
										</header>
										<p>Phasellus quam turpis, feugiat sit amet in, hendrerit in lectus. Praesent sed semper amet bibendum tristique fringilla.</p>
									</div>
								</section>

						</div>
						<div class="col-4 col-12-medium">

							<!-- Box -->
							<!-- 
								<section class="box feature">
									<a href="#" class="image featured"><img src="${pageContext.request.contextPath}/resources/main/slider/images/image19.jpg" alt="" /></a>
									<div class="inner">
										<header>
											<h2>Oh, and finally ...</h2>
											<p>Here's another intriguing subtitle</p>
										</header>
										<p>Phasellus quam turpis, feugiat sit amet in, hendrerit in lectus. Praesent sed semper amet bibendum tristique fringilla.</p>
									</div>
								</section>

						</div>
					</div>
				</div>
			</div>
-->

<br><br>
<p class="slider_title">Our Meal 평균 점수가 높은 식당</p>
<hr style="border-top: 1px solid #b19c9c;">
<section>
  <div class="container-fluid">
    <div class="container">
      <div class="row">
      
      <c:forEach var="item" items="${mainScore}">
      <!-- END Col -->
       <div class="col-sm-6">
<div class="card text-center" style="background-size: 50%; background-repeat: no-repeat; background-position: center;  cursor:pointer; height: 360px; background-image: url('${pageContext.request.contextPath}/${item.store_image }');" onclick="partner_link('${item.store_code}');">
         </div>
           <div class="price">
             <h2>가게 이름 - ${item.store_title }</h2>
             <h1>평점 - ${item.avg_score}</h1>
           </div>
           <div class="option">
             <ul>
             <li><h3>주소</h3>${item.store_address } </li>                      
             </ul>
           </div>
       </div>
       <!-- END Col -->
      </c:forEach>
      </div>
    </div>
  </div>
</section>
<hr style="border-top: 1px solid #000;">
<!-- ---------------------------------------------- -->

<br><br>
<p class="slider_title">Our Meal 댓글이 많이 달린 식당</p>
<hr style="border-top: 1px solid #b19c9c;">
<section>
  <div class="container-fluid">
    <div class="container">
      <div class="row">
      
      <c:forEach var="item" items="${mainBulletin}">
      <!-- END Col -->
       <div class="col-sm-6">
<div class="card text-center" style="background-size: 50%; background-repeat: no-repeat; background-position: center;  cursor:pointer; height: 360px; background-image: url('${pageContext.request.contextPath}/${item.store_image }');" onclick="partner_link('${item.store_code}');">
         </div>
           <div class="price">
             <h2>가게 이름 - ${item.store_title }</h2>
             <h1>평점 - ${item.avg_score}</h1>
           </div>
           <div class="option">
             <ul>
             <li><h3>주소</h3>${item.store_address } </li>
             <li id="store_code">${item.store_code }</li>
             <li>이미지 경로 - </li>             
             </ul>
           </div>
       </div>
       <!-- END Col -->
      </c:forEach>
      </div>
    </div>
  </div>
</section>
<hr style="border-top: 1px solid #000;">
<!-- ---------------------------------------------- -->

<br><br>
<p class="slider_title">Our Meal 최근 등록한 식당</p>
<hr style="border-top: 1px solid #b19c9c;">
<section>
  <div class="container-fluid">
    <div class="container">
      <div class="row">
      
      <c:forEach var="item" items="${mainNewest}">
      <!-- END Col -->
       <div class="col-sm-6">
<div class="card text-center" style="background-size: 50%; background-repeat: no-repeat; background-position: center;  cursor:pointer; height: 360px; background-image: url('${pageContext.request.contextPath}/${item.store_image }');" onclick="partner_link('${item.store_code}');">
         </div>
           <div class="price">
             <h2>가게 이름 - ${item.store_title }</h2>
             <h1>평점 - ${item.avg_score}</h1>
           </div>
           <div class="option">
             <ul>
             <li><h3>주소</h3>${item.store_address } </li>
             <li id="store_code">${item.store_code }</li>
             <li>이미지 경로 - </li>             
             </ul>
           </div>
       </div>
       <!-- END Col -->
      </c:forEach>
      </div>
    </div>
  </div>
</section>
<hr style="border-top: 1px solid #000;">
<!-- ---------------------------------------------- -->

<br><br>
<p class="slider_title">Our Meal이 추천하는 식당</p>
<hr style="border-top: 1px solid #b19c9c;">
<section>
  <div class="container-fluid">
    <div class="container">
      <div class="row">
      
      <c:forEach var="item" items="${mainList}">
      <!-- END Col -->
       <div class="col-sm-6">
<div class="card text-center" style="background-size: 50%; background-repeat: no-repeat; background-position: center;  cursor:pointer; height: 360px; background-image: url('${pageContext.request.contextPath}/${item.store_image }');" onclick="partner_link('${item.store_code}');">
         </div>
           <div class="price">
             <h2>가게 이름 - ${item.store_title }</h2>
             <h1>평점 - ${item.avg_score}</h1>
           </div>
           <div class="option">
             <ul>
             <li><h3>주소</h3>${item.store_address } </li>
             <li id="store_code">${item.store_code }</li>
             <li>이미지 경로 - </li>             
             </ul>
           </div>
       </div>
       <!-- END Col -->
      </c:forEach>
      </div>
    </div>
  </div>
</section>
<hr style="border-top: 1px solid #000;">
<!-- ---------------------------------------------- -->
