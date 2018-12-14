<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="pasing" style="text-align: center">
   <c:if test="${ page != 1 }">   
      <a href="${pageContext.request.contextPath}/admin_notice">처음</a>
   </c:if>   

   <c:if test="${ startPage != 1 }">   
      <a href="${pageContext.request.contextPath}/admin_notice?page=${startPage-1}">이전</a>
   </c:if>      

   <c:forEach var="i" begin="${ startPage }" end="${ endPage }">
   <c:if test="${ i == page }" var="result">   
      <b>${ i }</b>
   </c:if>         
   <c:if test="${ not result }">   
      <a href="${pageContext.request.contextPath}/admin_notice?page=${i}">${ i }</a>
   </c:if>         
   </c:forEach>

   <c:if test="${ endPage != totalPage }">   
      <a href="${pageContext.request.contextPath}/admin_notice?page=${endPage+1}">다음</a>
   </c:if>   

   <c:if test="${ page != totalPage }">   
      <a href="${pageContext.request.contextPath}/admin_notice?page=${totalPage}">끝</a>
   </c:if>      
   
</div>
</body>
</html>