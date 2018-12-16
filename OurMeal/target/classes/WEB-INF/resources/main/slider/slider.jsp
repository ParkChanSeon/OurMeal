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

<!-- main menu -->
<br><br>
<p class="slider_title">Our Meal 평점 높은 식당 순위</p>
<hr style="border-top: 1px solid #b19c9c;">
<section>
  <div class="container-fluid">
    <div class="container">
      <div class="row">
        <!-- END Col two -->
        <div class="col-sm-4" >
          <div class="card text-center">
            <div class="title">              
              <h2>식당이름 아이유 식당</h2>
            </div>
            <div class="price">
              <h4>평점 4.2</h4>
            </div>
            <div class="option">
              <ul>
              <li>주소 서울시 어쩌구 저쩌구 </li>
              <!-- 
              <li> <i class="fa fa-check" aria-hidden="true"></i> 30 Domain Names </li>
              <li> <i class="fa fa-check" aria-hidden="true"></i> Unlimited Email Address </li>
              <li> <i class="fa fa-check" aria-hidden="true"></i> Live Support </li>
 				-->              
              </ul>
            </div>
            <a href="#">식당 정보 보기 </a>
          </div>
        </div>
        <!-- END Col three -->
        <!-- END Col two -->
        <div class="col-sm-4">
          <div class="card text-center">
            <div class="title">              
              <h2>식당이름 아이유 식당</h2>
            </div>
            <div class="price">
              <h4>평점 4.2</h4>
            </div>
            <div class="option">
              <ul>
              <li>주소 서울시 어쩌구 저쩌구 </li>
              <!-- 
              <li> <i class="fa fa-check" aria-hidden="true"></i> 30 Domain Names </li>
              <li> <i class="fa fa-check" aria-hidden="true"></i> Unlimited Email Address </li>
              <li> <i class="fa fa-check" aria-hidden="true"></i> Live Support </li>
 				-->              
              </ul>
            </div>
            <a href="#">식당 정보 보기 </a>
          </div>
        </div>
        <!-- END Col three -->
        <!-- END Col two -->
        <div class="col-sm-4">
          <div class="card text-center">
            <div class="title">              
              <h2>식당이름 아이유 식당</h2>
            </div>
            <div class="price">
              <h4>평점 4.2</h4>
            </div>
            <div class="option">
              <ul>
              <li>주소 서울시 어쩌구 저쩌구 </li>
              <!-- 
              <li> <i class="fa fa-check" aria-hidden="true"></i> 30 Domain Names </li>
              <li> <i class="fa fa-check" aria-hidden="true"></i> Unlimited Email Address </li>
              <li> <i class="fa fa-check" aria-hidden="true"></i> Live Support </li>
 				-->              
              </ul>
            </div>
            <a href="#">식당 정보 보기 </a>
          </div>
        </div>
        <!-- END Col three -->             
      </div>
    </div>
  </div>
</section>
<hr style="border-top: 1px solid #000;">

<br><br>
<p class="slider_title">Our Meal이 추천하는 식당</p>
<hr style="border-top: 1px solid #b19c9c;">
<section>
  <div class="container-fluid">
    <div class="container">
      <div class="row">
        <!-- END Col two -->
        <div class="col-sm-4">
          <div class="card text-center">
            <div class="title">              
              <h2>식당이름 아이유 식당</h2>
            </div>
            <div class="price">
              <h4>평점 4.2</h4>
            </div>
            <div class="option">
              <ul>
              <li>주소 서울시 어쩌구 저쩌구 </li>
              <!-- 
              <li> <i class="fa fa-check" aria-hidden="true"></i> 30 Domain Names </li>
              <li> <i class="fa fa-check" aria-hidden="true"></i> Unlimited Email Address </li>
              <li> <i class="fa fa-check" aria-hidden="true"></i> Live Support </li>
 				-->              
              </ul>
            </div>
            <a href="#">식당 정보 보기 </a>
          </div>
        </div>
        <!-- END Col three -->
        <!-- END Col two -->
        <div class="col-sm-4">
          <div class="card text-center">
            <div class="title">              
              <h2>식당이름 아이유 식당</h2>
            </div>
            <div class="price">
              <h4>평점 4.2</h4>
            </div>
            <div class="option">
              <ul>
              <li>주소 서울시 어쩌구 저쩌구 </li>
              <!-- 
              <li> <i class="fa fa-check" aria-hidden="true"></i> 30 Domain Names </li>
              <li> <i class="fa fa-check" aria-hidden="true"></i> Unlimited Email Address </li>
              <li> <i class="fa fa-check" aria-hidden="true"></i> Live Support </li>
 				-->              
              </ul>
            </div>
            <a href="#">식당 정보 보기 </a>
          </div>
        </div>
        <!-- END Col three -->
        <!-- END Col two -->
        <div class="col-sm-4">
          <div class="card text-center">
            <div class="title">              
              <h2>식당이름 아이유 식당</h2>
            </div>
            <div class="price">
              <h4>평점 4.2</h4>
            </div>
            <div class="option">
              <ul>
              <li>주소 서울시 어쩌구 저쩌구 </li>
              <!-- 
              <li> <i class="fa fa-check" aria-hidden="true"></i> 30 Domain Names </li>
              <li> <i class="fa fa-check" aria-hidden="true"></i> Unlimited Email Address </li>
              <li> <i class="fa fa-check" aria-hidden="true"></i> Live Support </li>
 				-->              
              </ul>
            </div>
            <a href="#">식당 정보 보기 </a>
          </div>
        </div>
        <!-- END Col three -->
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
         <!-- END Col -->
        <div class="col-sm-6">
          <div class="card text-center" style="cursor:pointer; height: 360px; background-image: url('${pageContext.request.contextPath}/resources/main/slider/images/image7.jpg');">
          </div>
            <div class="price">
              <h2>아이유 식당</h2>
              <h1>평점 4.2</h1>
            </div>
            <div class="option">
              <ul>
              <li>주소 서울시 어쩌구 저쩌구 </li>
              </ul>
            </div>
        </div>        
        <!-- END Col -->
         <!-- END Col -->
        <div class="col-sm-6">
          <div class="card text-center" style="cursor:pointer; height: 360px; background-image: url('${pageContext.request.contextPath}/resources/main/slider/images/image7.jpg');">
          </div>
            <div class="price">
              <h2>아이유 식당</h2>
              <h1>평점 4.2</h1>
            </div>
            <div class="option">
              <ul>
              <li>주소 서울시 어쩌구 저쩌구 </li>
              </ul>
            </div>
        </div>        
        <!-- END Col -->
         <!-- END Col -->
        <div class="col-sm-6">
          <div class="card text-center" style="cursor:pointer; height: 360px; background-image: url('${pageContext.request.contextPath}/resources/main/slider/images/image7.jpg');">
          </div>
            <div class="price">
              <h2>아이유 식당</h2>
              <h1>평점 4.2</h1>
            </div>
            <div class="option">
              <ul>
              <li>주소 서울시 어쩌구 저쩌구 </li>
              </ul>
            </div>
        </div>        
        <!-- END Col -->
      </div>
    </div>
  </div>
</section>
<hr style="border-top: 1px solid #000;">
<!-- ---------------------------------------------- -->
