<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Header -->
				
				<div id="header-wrapper_store" >
					<header class="store_top_header" class="container" style="">

						<!-- Logo -->
							<div id="logo" style="float:left;display:inline-block;">
								<h1 style="margin:5px;"><a href="${pageContext.request.contextPath}/">Our Meal</a></h1>
							</div>
							<!--  search -->
							<div style="text-align: center;" id="search_bar">
							<form action="${pageContext.request.contextPath}/search" method="get">
								<input type="text" style=" float:left; height: 50px; border-radius: 9px; width: 600px; display: inline-block; margin-top: 15px; margin-left: 100px;" 
								placeholder="지역, 음식, 식당"class="search_bar" name="value"  value="${value}" required="required"/> 
								<input type="submit" value="검색" class="search_bar" style="float:left;display:inline-block; margin-top: 15px; margin-left:5px;" />
							</form>
							</div>
						<!-- Nav -->
							<nav id="nav" style="top: 2px;">
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
											<li><a href="${pageContext.request.contextPath}/qnaMemberList">Q&A 게시판</a></li>
											<c:if test="${User.member_type eq 1}">
											<li><a href="${pageContext.request.contextPath}/qnaPartnerList">Q&A 파트너 게시판</a></li>
											</c:if>											
										</ul>
									</li>									
									<li>									
										<a href="#">게시판</a>
										<ul>
											<li><a href="${pageContext.request.contextPath}/noticeList">공지사항</a></li>
											<li><a href="${pageContext.request.contextPath}/freeList">자유게시판</a></li>											
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
											<li><a href="#">Q&A</a></li>
											<li><a href="#">Online Consultation</a></li>
										</ul>
									</li>
									</c:if>
									<li class="current">
										<!-- <a href="${pageContext.request.contextPath}/chatting">채팅</a> -->
										<a href="javascript:chatting();">관리자에게 채팅 문의</a>										
									</li>																		
									<li class="current">
										<c:if test="${sessionScope.User.member_type eq '0'}">
										<a href="${pageContext.request.contextPath}/partnerapply">파트너 신청</a>
										</c:if>
										
										<c:if test="${sessionScope.User.member_type eq '9'}">																				
										<a href="${pageContext.request.contextPath}/adminManager">파트너 전환 기능</a>
										</c:if>
										<a href="${pageContext.request.contextPath}/logout">로그아웃</a>										
									</li>									
									</c:if>
									

								</ul>
							</nav>
							
					</header>
				</div>