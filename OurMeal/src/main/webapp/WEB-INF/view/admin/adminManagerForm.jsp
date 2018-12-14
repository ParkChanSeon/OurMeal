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

	<!-- table css  -->
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/admin/vendor/perfect-scrollbar/perfect-scrollbar.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/admin/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/admin/css/main.css">
            
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

<div class="limiter">
		<div class="container-table100">
			<h3>일반 회원 파트너 승인 관리 페이지</h3>
			<div class="wrap-table100">				
				<div class="table100 ver2 m-b-110">				
					<div class="table100-head">					
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">아이디</th>
									<th class="cell100 column2">사업자 등록 번호</th>
									<th class="cell100 column3">사업자 등록일</th>
									<th class="cell100 column4">사업자 등록증</th>
									<th class="cell100 column5">영업신고증</th>
									<th class="cell100 column6">승인</th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll" >
						<table>
							<tbody>
			<c:forEach var="item" items="${confirm_list}">
								<tr class="row100 body">
									<td class="cell100 column1">${ item.member_id }</td>
									<td class="cell100 column2">${ item.partner_crn }</td>
									<td class="cell100 column3">${ item.partner_date }</td>									
									<td class="cell100 column4"><img alt="사업자 등록증" src="${pageContext.request.contextPath}/resources/partner/upload/${item.partner_sd}" class="approval"></td>
									<td class="cell100 column5"><img alt="영업 신고증" src="${pageContext.request.contextPath}/resources/partner/upload/${item.partner_bl}" class="approval"></td>
									<td class="cell100 column6">
										<form action="${pageContext.request.contextPath}/adminManager" method="post"> 
										    <input type="hidden" value="${ item.member_id }" name="confirm_id" />
										    <button type="submit">승인</button>        
									    </form>
									</td>
								</tr>
			</c:forEach>
							</tbody>
						</table>
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
    
    <script src="${pageContext.request.contextPath}/resources/admin/vendor/select2/select2.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			var ps = new PerfectScrollbar(this);

			$(window).on('resize', function(){
				ps.update();
			})
		});
			
		
	</script>
	</div>
  </body>
</html>