<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
			<!-- Header -->
				<div id="header-wrapper">
					<header id="header" class="container">

						<!-- Logo -->
							<div id="logo">
								<!-- 검색 바를 클릭하면 기존 메뉴를 모두 삭제하고 100% 주고 다시 빠져나오면 기존 메뉴를 채운다.? 
								header 위에 머가 있었는지 가능한지 한번 보자.
								-->
								<%@ include file="/WEB-INF/resources/include/search.jsp" %>
							</div>

						<!-- Nav -->
							<nav id="nav">
								<ul>								
									<li class="current"><a href="#modal">로그인</a></li>
									<li class="current"><a href="index.html">회원가입</a></li>
									<li class="current"><a href="index.html">파트너 회원가입</a></li>
									<li>
										<a href="#">게시판</a>
										<ul>
											<li><a href="#">공지사항</a></li>
											<li><a href="#">자유 게시판</a></li>
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

