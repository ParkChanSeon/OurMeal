<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
			<!-- Header -->
				<div><%@ include file="/WEB-INF/resources/main/search/search.jsp" %></div>
				<div id="header-wrapper">
					<header id="header" class="container">

						<!-- Logo -->
							<div id="logo">
							</div>

						<!-- Nav -->
							<nav id="nav">
								<ul>								
									<li class="current"><a href="#modal">로그인</a></li>
									<li class="current"><a href="${pageContext.request.contextPath}/join">회원가입</a></li>
									<li class="current"><a href="index.html">파트너 회원가입</a></li>
									<li>
										<a href="#">게시판</a>
										<ul>
											<li><a href="#">공지사항</a></li>
											<li><a href="${pageContext.request.contextPath}/freeboard">자유 게시판</a></li>
											<li><a href="#">QNA 게시판</a></li>
										</ul>
									</li>									
									<li>
										<a href="#">마이 페이지(일반회원)</a>
										<ul>
											<li><a href="#">기본 정보</a></li>
											<li><a href="#">건강 정보</a></li>									
											<li><a href="#">알레르기</a></li>
										</ul>
									</li>	
									<li>
										<a href="#">파트너 마이 페이지</a>
										<ul>
											<li><a href="#">기본 정보</a></li>
											<li><a href="#">CustomerService</a></li>
											<li><a href="#">QNA</a></li>
											<li><a href="#">Online Consultation</a></li>
										</ul>
									</li>
								</ul>
							</nav>

					</header>
				</div>

