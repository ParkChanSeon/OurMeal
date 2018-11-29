<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>파트너 신청 페이지</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!-- main menu -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main/assets/css/main.css">
		
		<!-- popup css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/popup/dist/remodal-default-theme.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/main.css">
  		  		
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
			<form action="${pageContext.request.contextPath}/partnerapply" method="post" enctype="multipart/form-data">									
				<input type="file" name="files" multiple><br />
				사업자 등록번호 : <input type="text" name="buisnessNo">				
				<input type="submit" value="전송">
			</form>
									
			<div class="row">
				<pre>
					0 일반
					1 파트너
					9 관리자
					
					파트너 전환시
					- 사업자 번호
					- 사업자 등록증 사본
					- 영업신고증 사본
					(관리자가 확인후 승인 하는 방식으로 )
					파트너 테이블에 인서트
					멤버타입 1 로 변환
					스토어 테이블에 인서트 (프로시져)
					
					프로시져( null,null, member_id, null, null);
				</pre>		     
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