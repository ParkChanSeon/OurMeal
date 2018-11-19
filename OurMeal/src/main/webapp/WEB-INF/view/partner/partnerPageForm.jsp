<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Our Meal</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

		<!-- partner css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/partner/css/partner.css">
				
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

		<!-- partner js -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/partner/js/partner.js"></script>
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
			
			
<div class="container">
  <div class="form form-stacked">
    <div class="form-block">
      <label class="label" for="board_content">Content</label>
      <div class="form-controls">
        <span class="button ion-code" title="Code block <pre><code>" data-button-type="addCode"></span>
        <span class="button ion-code-working" title="Inline code <code>" data-button-type="addInlineCode"></span>
        <span class="button" title="Strong <strong>" data-button-type="addStrong"><strong>b</strong></span>
        <span class="button" title="Emphasis <em>" data-button-type="addEmphasis"><strong><em>i</em></strong></span>
        <span class="button ion-link" title="Link <a>" data-button-type="addLink"></span>
        <span class="button ion-social-codepen-outline" title="Embed CodePen pen" data-button-type="embedCodePen"></span>
      </div>
      <textarea placeholder="Ask a programming question or share a tip with other developers. Markdown is supported." class="textarea-tall" id="board_content"></textarea>
    </div>
  </div>
</div>

<div class="note">This was extracted from <a href="https://www.codehive.io" target="_blank">CodeHive's</a> markdown WYSIWYG toolbar. In sharing it on CodePen, we hope for others to learn how we've implemented it. Feel free to fork it and make it awesomer.</div>

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