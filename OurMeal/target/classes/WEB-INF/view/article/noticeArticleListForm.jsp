<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  		
  		<!-- main css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/main.css">	
	</head>
	<body class="is-preload homepage">
		<!-- Main Menu -->
		<%@ include file="/WEB-INF/resources/include/header.jsp" %>
		
		<!-- Main Menu Scripts -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.dropotron.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/browser.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/breakpoints.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/util.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/main.js"></script>
	
			
		<!-- 이영역에 각자 구현할 태그를 작성! 샘플로 태그하나 넣어놈-->
		<div class="container">
			<div class="row">
			
			    <form action="noticeContent" method="POST">
			        <table>
			             <tr>
			                 <td>#{notice_no}</td><td><a href="${pageContext.request.contextPath}/noticeContent">#{notice_title}</a></td><td>#{admin_id}</td><td>#{notice_c_date}</td>
			                 <td>1</td><td><input type="submit" value="내용보기"></td><td>관리자</td><td>2018.11.17</td>
			             </tr>
			        </table>
			    </form><br>
			    <form action="noticeWrite" method="get">
			        <input type="submit" value="작성">
			    </form>
			    
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
	</body>
</html>