<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
  <head>
    <title>Our Meal</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <!-- main menu -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main/assets/css/main.css">
    
    <!-- popup css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/popup/dist/remodal-default-theme.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/main.css">
    
    <style type="text/css">
    	img{width: 50%;}
    </style>
            
      <!-- jquery -->
      <script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.min.js"></script>
      
      <!-- main js -->
      <script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/main.js"></script>
  </head>
  <body class="is-preload homepage">
  
    <!-- Main Menu -->
    <%@ include file="/WEB-INF/resources/include/header.jsp" %>
    
    <!-- Main Menu Scripts -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.dropotron.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/browser.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/breakpoints.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/util.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/main.js"></script>    
    
  <div id="body">
    <!-- 이영역에 각자 구현할 태그를 작성! 샘플로 태그하나 넣어놈-->
    <div class="container">
      <div class="row">
<div class="row">
<c:forEach var="item" items="${confirm_list}">
						<div class="col-4 col-12-medium">

							<!-- Box -->							
								<section class="box feature">
									
									<div class="inner">
										<header>										
										<!-- 회원 아이디 사업자 등록증 이미지, 사업자 등록번호, 사업자 등록일,영업신고증 이미지 -->
											<h2>회원아이디</h2>
											<p>${ item.member_id }</p>
											<h2>사업자 등록증 이미지</h2>
											<img alt="사업자 등록증" src="${pageContext.request.contextPath}/resources/partner/upload/${item.partner_sd}" class="approval"></p>
											<h2>사업자 등록 번호</h2>
											<p>${ item.partner_crn }</p>
											<h2>사업자 등록일</h2>
											<p>${ item.partner_date }</p>
											<h2>영업 신고증 이미지</h2>
											<p style="width: 700px;"><img alt="영업 신고증" src="${pageContext.request.contextPath}/resources/partner/upload/${item.partner_bl}" class="approval"></p>
											<form action="${pageContext.request.contextPath}/adminManager" method="post"> 
											    <input type="hidden" value="${ item.member_id }" name="confirm_id" />
											    <button type="submit">일반회원 파트너 승인</button>        
										    </form>											
										</header>										
									</div>
								</section>

						</div>
</c:forEach>						
						<div class="col-4 col-12-medium">

							<!-- Box -->
								<section class="box feature">
									<a href="#" class="image featured"><img src="/OurMeal/resources/main/slider/images/image18.jpg" alt=""></a>
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
								<section class="box feature">
									<a href="#" class="image featured"><img src="/OurMeal/resources/main/slider/images/image19.jpg" alt=""></a>
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
    <!-- 이영역에 각자 구현할 태그를 작성! 여기까지!!!! -->
    
    <!-- footer -->           
    <%@ include file="/WEB-INF/resources/include/footer.jsp" %>
    
    <!-- popup -->
    <script src="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.js"></script>
    
    <!-- popup content -->
    <%@ include file="/WEB-INF/resources/include/popup.jsp" %>

    <script src="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.js"></script>   
    <script src="${pageContext.request.contextPath}/resources/main/popup/dist/event.js"></script>
  </div>    
  </body>
</html>