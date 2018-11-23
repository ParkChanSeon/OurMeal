<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
			<!-- Header -->
				<div><%@ include file="/WEB-INF/resources/main/search/search.jsp" %></div>
				<div id="header-wrapper">
					<header id="header" class="container">

						<!-- Logo -->
							<div id="logo">
								<h1><a href="${pageContext.request.contextPath}/">Our Meal</a></h1>
							</div>
							
						<!-- Nav -->
							<nav id="nav">
								<ul>

									
									<c:if test="${ null eq User }">									
									<li>
										<a href="#">고객센터</a>
										<ul>											
											<li><a href="${pageContext.request.contextPath}/qnaMemberList">Q&A 일반 게시판</a></li>
											<c:if test="${User.member_type eq 1}">
											<li><a href="${pageContext.request.contextPath}/qnaPartnerList">Q&A 업주 게시판</a></li>
											</c:if>
										</ul>
									</li>
									<li>
										<a href="#">게시판</a>
										<ul>
											<li><a href="${pageContext.request.contextPath}/noticeList">공지사항</a></li>
											<li><a href="${pageContext.request.contextPath}/freeList">자유 게시판</a></li>											
										</ul>
									</li>																												
									<li class="current">
										<a href="#modal">로그인</a>
									</li>
									<li class="current"><a href="${pageContext.request.contextPath}/join">회원가입</a></li>
																										
									</c:if>
									
									<c:if test="${ null ne User }">
									<li>									
										<a href="#">고객센터</a>
										<ul>
											<li><a href="${pageContext.request.contextPath}/qnaMemberList">Q&A 일반 게시판</a></li>
											<c:if test="${User.member_type eq 1}">
											<li><a href="${pageContext.request.contextPath}/qnaPartnerList">Q&A 업주 게시판</a></li>
											</c:if>											
										</ul>
									</li>									
									<li>									
										<a href="#">게시판</a>
										<ul>
											<li><a href="${pageContext.request.contextPath}/noticeList">공지사항</a></li>
											<li><a href="${pageContext.request.contextPath}/freeList">자유 게시판</a></li>											
										</ul>
									</li>
									<!-- User Type에 따라서 마이 페이지 if로 걸러내서 메뉴를 보여준다. -->
									<c:if test="${User.member_type eq '0'}">
									<li>
										<a href="#">마이 페이지</a>
										<ul>
											<li><a href="${pageContext.request.contextPath}/memberUpdate">내 정보 수정하기</a></li>
										</ul>
									</li>
									</c:if>
									<c:if test="${sessionScope.User.member_type eq '1'}"> 
									<li>
										<a href="#">마이 페이지</a>
										<ul>
											<li><a href="${pageContext.request.contextPath}/memberUpdate">내 정보 수정하기</a></li>
											<li><a href="${pageContext.request.contextPath}/storePage?store_code=${sessionScope.myStore.store_code}">내 가게 page</a></li>											
											<li><a href="#">QNA</a></li>
											<li><a href="#">Online Consultation</a></li>
										</ul>
									</li>
									</c:if>
									<li class="current"><a href="${pageContext.request.contextPath}/chatting">채팅</a></li>									
									<li class="current">									
										<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
									</li>									
									</c:if>
									

								</ul>
							</nav>

					</header>
				</div>

