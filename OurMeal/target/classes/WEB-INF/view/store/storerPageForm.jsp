<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE HTML>
<html>
<head>
<title>Our Meal</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />

<!-- store css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/store/css/storePage.css">

<!-- main menu -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main/assets/css/main.css">
		
		<!-- popup css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/popup/dist/remodal-default-theme.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/main.css">

<!-- 다음api 키 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8bd7d15257e00e41f64c0002667a8c53&libraries=services"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8bd7d15257e00e41f64c0002667a8c53&libraries=clusterer"></script>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8bd7d15257e00e41f64c0002667a8c53&libraries=drawing"></script>


<style type="text/css">
</style>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<!-- 에러?

<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
 -->

<!-- jquery -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.min.js"></script>
	
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/mypage/css/jquery.circularise.min.js"></script>
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/mypage/css/jquery.circularise.js"></script>
 
<script>
	
	$(document).ready(function(){
		
		//$('.profile_image, .profile_image').circularise();
		   
		  $('ul.tabs li').click(function(){
		    var tab_id = $(this).attr('data-tab');
		 
		    $('ul.tabs li').removeClass('current');
		    $('.tab-content').removeClass('current');
		 
		    $(this).addClass('current');
		    $("#"+tab_id).addClass('current');
		  })
	
	
		  $(document).on('change', '.btn-file :file', function() {
				var input = $(this),
					label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
				input.trigger('fileselect', [label]);
				});

				$('.btn-file :file').on('fileselect', function(event, label) {
				    
				    var input = $(this).parents('.input-group').find(':text'),
				        log = label;
				    
				    if( input.length ) {
				        input.val(log);
				    } else {
				        //if( log ) alert(log);
				    }
			    
				});
				function readURL(input) {
				    if (input.files && input.files[0]) {
				        var reader = new FileReader();
				        
				        reader.onload = function (e) {
				            $('#img-upload').attr('src', e.target.result);
				        }
				        
				        reader.readAsDataURL(input.files[0]);
				    }
				}

				$("#imgInp").change(function(){
				    readURL(this);
				}); 
			
			
			   
			  $('ul.tabs li').click(function(){
			    var tab_id = $(this).attr('data-tab');
			 
			    $('ul.tabs li').removeClass('current');
			    $('.tab-content').removeClass('current');
			 
			    $(this).addClass('current');
			    $("#"+tab_id).addClass('current');
			  })
		
		
		

				$('.starRev span').click(function(){
			  $(this).parent().children('span').removeClass('on');
			  $(this).addClass('on').prevAll('span').addClass('on');
			  alert($(this).text());
			  document.form.sb_score.value=$(this).text();
			 
			  return false;
			});
		
				
			  var num = 5;
			 
			  $("#more_btn").click(function(){
				  
				  var info =  new Map;
					 info = {
						 "store_code" : "${store.store_code}",
						 "num" : num
					 }
					  
					    $.ajax({
					        url : "${pageContext.request.contextPath}/storePage/reviewAdd",
					        type : "POST",
					        cache : false,
					        dataType: 'json',
					        data : info,
					        success : function(data){
					            	  var review = data.list;
					        	  
					        	  var size = data.size;
					        	  
					        	  if(data.loginMember != null)
					        	  var loginMember = data.loginMember;
					        	  
					        	  var content="";
					        	  $.each(review, function( index, value ) {
					                   console.log( index + " : " + value.member_id ); 
					               	var str = "''";
					                
					               var score = value.sb_score;
					               var star="";
					               var imgPath="";
					               if(score == 1.0)
					               	star = "${pageContext.request.contextPath}/resources/store/icon/star_1.png";
					               	else if(score == 2.0)
						               	star = "${pageContext.request.contextPath}/resources/store/icon/star_2.png";
						            	else if(score == 3.0)
							               	star = "${pageContext.request.contextPath}/resources/store/icon/star_3.png";
							            	else if(score == 4.0)
								               	star = "${pageContext.request.contextPath}/resources/store/icon/star_4.png";
								            	else 
									               	star = "${pageContext.request.contextPath}/resources/store/icon/star_5.png";
						               	
					               	if(value.member_image == null){
					               		imgPath ="${pageContext.request.contextPath}/resources/store/icon/1.jpg";
					               	} else {
					               		imgPath ="${pageContext.request.contextPath}"+value.member_image;
					               	}
									               	
					                   
					               	content += '<div class="review_list"><div class="member_info_div"><span class="member_info_span">'
					                   			+ '<span class="member_profile" style="width:100%;padding:0;">'
					                   			+'<img src="'+imgPath+'" class="profile_image" style="width: 100px;border-radius: 50%;"></span>'+value.member_id 
					                             +'</span>';
					                   if(value.member_id == loginMember){
					                	   content +=  '<span class="edit_span" class="ed_a"><a onclick="reviewModify('+value.sb_no+')" class="ed_a">수정</a><b> . </b><a onclick="reviewDelete('+value.sb_no+')" class="ed_a">삭제</a></span>';
					                	   content += '</div><div class="review_content">'+'<div class="score_div2"><span class="date_span">'+ value.sb_u_date +'</span><span class="star_span2" ><span class="starRev">'
						                   +'<label class="star_label">별점 : </label>'
						                   +'<img class="star_image"  src="'+star+'">'
						                   +'</span></span></div><div class ="review_content_div"><span class="review_content_text"><b>'
						                   +value.sb_content+'</b>'
						                   +'</span></div><div class="review_image_div">';
						                   if(value.sb_image != ""){
						                	   content += '<a class="review_image_btn"><img class="review_image" src="${pageContext.request.contextPath}'+value.sb_image+'"></a>';
						                   }
						                   content += '</div></div></div>';
					                	   
					                   } else if( value.member_id == null || value.member_id != loginMember){
					                   content += '</div><div class="review_content">'+'<div class="score_div2"><span class="date_span">'+ value.sb_u_date +'</span><span class="star_span2" ><span class="starRev">'
					                   +'<label class="star_label">별점 : </label>'
					                   +'<img class="star_image"  src="'+star+'">'
					                   +'</span></span></div><div class ="review_content_div"><span class="review_content_text"><b>'
					                   +value.sb_content+'</b>'
					                   +'</span></div><div class="review_image_div">';
					                   if(value.sb_image != ""){
					                	   content += '<a class="review_image_btn"><img class="review_image" src="${pageContext.request.contextPath}'+value.sb_image+'"></a>';
					                   }
					                   content += '</div></div></div>';
					                   
					                   }
					        	  
					        	  });
					        	$("#review_back_append").append(content);
					        	
					        	num+=5;
					        	var btn_val = "더보기("+num+"/"+${reviewCount}+")";
					        	$("#more_btn").val(btn_val);
					        	content="";
					        	 
					            if(data.code == "no")
					            	$("#more_btn").remove();
					           
					        }
					        
					    });
			  })
	
	
	})
	
		
function onSubmit(){
 var myForm = document.test;
 var url = "${pageContext.request.contextPath}/menuInfo";
 window.open("" ,"popForm", 
       "toolbar=no, width=850, height=900, directories=no, status=no,    scrollorbars=no, resizable=no"); 
 myForm.action =url; 
 myForm.method="post";
 myForm.target="popForm";
 
myForm.submit();
}
	function changeIcon(){
		document.getelementbyid(confirmIcon)
	}
	
function reviewModify(addr){
		
		window.open("${pageContext.request.contextPath}/reviewModify?sb_no="+addr,
				"pop","width=1000,height=850, scrollbars=yes, resizable=yes");
		}
		
function reviewDelete(addr){
	
	var info = new Map;
	 info = {"sb_no":addr};
	
	
	ok = confirm("삭제 하시겠습니까?")
	
	if(ok){
	
    $.ajax({
        type : 'post',
        url : '${pageContext.request.contextPath}/reviewDelete',
        data : info,
        cache : false,
        success : function(html) {
           
        	location.reload(); 
        	alert("리뷰를 삭제하였습니다.");
           
           
        },
        error : function(error) {
            alert("실패.");
            console.log(error);
            console.log(error.status);
        	}
   	 	});
	};
	
	}		
	
	</script>

<!-- main js -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/main/main.js"></script>

<!-- partner js -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/partner/js/partner.js"></script>
	

	
	
</head>
<body class="is-preload homepage">

	<!-- Main Menu -->
	<%@ include file="/WEB-INF/resources/store/css/storeHeader.jsp"%>

	<!-- Main Menu Scripts -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.dropotron.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/main/assets/js/browser.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/main/assets/js/breakpoints.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/main/assets/js/util.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/main/assets/js/main.js"></script>






	
		<!-- 이영역에 각자 구현할 태그를 작성! 샘플로 태그하나 넣어놈-->
		
		
		<div class="storeBack">
		
		<!-- 위쪽 사진 -->
		<div class="storeTop">
		
		
		<c:if test="${empty image_list}" var = "no_image">
		<div class="span_div" style="background-image: url('${pageContext.request.contextPath}/resources/store/icon/noImage.jpeg');
		background-size: 600px; text-align:center; vertical-align:middle;opacity: 0.5;"><h3 class="noImage_h3">사진을 첨부한 리뷰를 작성해 주세요</h3></div>
		   </c:if>
		
		<c:if test="${not no_image}">
		<div class="span_div">
		<c:forEach items="${image_list}" var="img_list">
		
		   
		   <span class="top_img_span">          	
						<img class = "topImage" alt="가게 사진" src="${pageContext.request.contextPath}${img_list.sb_image}">
		            </span>
		  
		   
		   
		 </c:forEach>
		 </div>
		 </c:if>        
		            
		           
		            
		           
		          
		          
		
		</div>
		<div class="clear" style="height:30px"></div>
		
	<div class="colum-wrapper">
	
		<div class="left_div">
			<div id="map" style="width: 400px; height: 400px;"></div>
		</div>
		<div class="column-contents">
		
		<div class ="inner">
		
		<!-- 레스토랑 상세 -->
		<section class="restaurant-top">
		<header class = "info_title_header" style="border-bottom: 2px solid gray">
		<span class="title"><strong>${store.store_title}<c:if test="${store.store_title == null}">가게 이름</c:if></strong></span>
		<span class="avg">
		<c:if test="${avg == 'NaN'}" var ="store_avg"><b>(평점 :     점)</b></c:if>
		<c:if test="${not store_avg}" ><b>(평점 : ${avg}점)</b></c:if></span>
		
		</header>
		</section>
		
		<section class="restaurant-detail">
		<div class="default_info_div">
		<div class="store_main_img_div">
		<c:if test="${store.store_image eq null }" var = "mainImage">
		<img class = "store_main_img" alt="기본 사진" src="${pageContext.request.contextPath}/resources/partner/image/store2.jpg">
		</c:if>
		<c:if test="${not mainImage }" >
		<img class = "store_main_img" alt="가게 사진" src="${pageContext.request.contextPath}${store.store_image}">
		</c:if>
		
		<c:if test ="${store.member_id eq sessionScope.User.member_id}">
		<form  action = "${pageContext.request.contextPath}/storeInfo" method="post">
		<span class="icon" style=" margin:auto;">
		
		<input type="hidden" name="store_code" value = "${store.store_code}">
		<input type="image" src = "${pageContext.request.contextPath}/resources/store/icon/storeInfo.png" style="width:50px;height:50px;"
		onmouseover="this.src='${pageContext.request.contextPath}/resources/store/icon/storeInfo2.png'" 
		onmouseout="this.src='${pageContext.request.contextPath}/resources/store/icon/storeInfo.png'"
		/>
		
		</span>
		</form>
		</c:if>
		<c:if test ="${store.member_id eq sessionScope.User.member_id}">
		<form name="test" >
		<span class="icon" style=" margin:auto;">
		
		<input type="hidden" name="store_code2" value = "${store.store_code}">
		 
		<input type="image" src = "${pageContext.request.contextPath}/resources/store/icon/menuInfo.png" style="width:50px;height:50px;" 
		onmouseover="this.src='${pageContext.request.contextPath}/resources/store/icon/menuInfo2.png'" 
		onmouseout="this.src='${pageContext.request.contextPath}/resources/store/icon/menuInfo.png'"
		onclick="onSubmit()"/>
		
		</span>
		</form>
		</c:if>
		
		</div>
		
		
		
		<div class="table_div">
		<table class ="res_info" style="font-size:15px;">
		
		<tr>
		<th>주소</th><td>${store.store_address}</td>
		</tr>
		
		<tr>
		<th>전화번호</th><td>${store.store_tel}</td>
		</tr>
		
		<tr>
		<th>음식종류</th><td>${store.store_type}</td>
		</tr>
		
		<tr>
		<th>주차</th><td>${store.store_parking}</td>
		</tr>
		
		<tr>
		<th>영업시간</th><td><div style="white-space:pre;"><c:out value="${store.store_o_time}"></c:out></div></td>
		</tr>
		
		<tr>
		<th>쉬는시간</th><td><div style="white-space:pre;"><c:out value="${store.store_b_time}"></c:out></div></td>
		</tr>
		
		
		<tr>
		<th>홈페이지</th><td><div style="white-space:pre;"><a href="http://${store.store_website}"><c:out value="${store.store_website}"></c:out></a></div></td>
		</tr>
		
		<tr>
		<th>가게소개</th><td><div style="white-space:pre;"><c:out value="${store.store_info}"></c:out></div></td>
		</tr>
		
		
		
		</table>
		
		</div>
		</div>
		
		</section>
		
		
		<section class="restaurant-detail" style="padding-top:0; margin-top:0;">
		<div class="container" >
 
  <ul class="tabs">
   
    <li class="tab-link current" data-tab="tab-1" style="width:50%">리뷰</li>
    <li class="tab-link " data-tab="tab-2" style="width:50%" >메뉴</li>
    
  </ul>
 
  
<div id="tab-1" class="tab-content current">
<div class="tab2_back">
<form name= "form" id="form" action="${pageContext.request.contextPath}/writeReviewReq" 
		method="post" enctype="multipart/form-data" onsubmit="return check();">
		<input type="hidden" name = "member_id" value="${sessionScope.User.member_id}">
		<input type="hidden" name = "store_code" value="${store.store_code}">
		<div class ="reviewWriteForm">
		<div class ="reviewHeader">
		<div class="store_title">
		<h2 class="title_h2">${store.store_title}<c:if test="${store.store_title == null}">가게 이름</c:if></h2>  
		<h3 class="title_h3"> 에 대한 솔직한 리뷰를 남겨주세요.</h3>
		</div>
		
		</div>
		<div class="clear"></div>
		<div class="score_div">
  		
		<span class="star_span">
		<span class="starRev">
		<c:if test="${sessionScope.User != null}">
		<label style="width: 40px;margin:0; display: inline-block; font-size:16px; padding-top: 20px;">별점 : </label>
		
		<span class="starR on" id="star1" >1</span>
  		
  		<span class="starR" id="star2">2</span>
  		<span class="starR" id="star3">3</span>
		<span class="starR" id="star4" >4</span>
		<span class="starR" id="star5" >5</span>
  		</c:if>
		</span>
		
		<input type = "hidden" name = "sb_score" value="1" >
		</span>
		
		</div>
		<div class="clear"></div>
  		
		
		<div class="writeBack">
		
		
		
		<div class="clear"></div>
		<div class="review_write_content">
		<div class="file_form">
		
		<input type="hidden" name = "sb_image" >
		
           <span class="btn btn-default btn-file" 
           style="width:200px; height:200px; vertical-align: middle; padding:0; display:inline-block;" >
           	 <c:if test="${sessionScope.User != null}">
           	 <input type="file" id="imgInp" name="file">
           	 </c:if>   
             
             <img id='img-upload' src="${pageContext.request.contextPath}/resources/store/icon/addPhoto.png" 
             style="width:200px;height:200px;
              <c:if test="${sessionScope.User == null}">cursor: default;</c:if>"/>
                  	
            
            </span>
		
		</div>
		
		
		<div class="write_from">
		
		<div class="content">
		<c:if test="${sessionScope.User == null}" var="log">
		<a href="#modal">
		<textarea name="sb_content" rows="10" cols="30" readonly="readonly"
		placeholder="작성을 하려면 로그인 해주세요"style="resize: none; font-size:18px; cursor: pointer;"></textarea>
		</a>
		</c:if>
		
		<c:if test="${not log}">
		<textarea name="sb_content" rows="10" cols="30" 
		style="resize: none; font-size:18px; "  placeholder="${sessionScope.User.member_id}님, 주문하신 메뉴는 어땠나요? 식당의 서비스와 분위기도 궁금해요!"
		onclick="if(this.value == '${sessionScope.User.member_id}님, 주문하신 메뉴는 어땠나요? 식당의 서비스와 분위기도 궁금해요!'){this.value=''} "
		required="required"></textarea>
		</c:if>
		
		
		
		</div>
		</div>
		<div class="button_div">
		
		<input id="confirmIcon" type="image" src="${pageContext.request.contextPath}/resources/store/icon/confirm1.png" style="width:120px;height:60px;" 
		onmouseover="this.src='${pageContext.request.contextPath}/resources/store/icon/confirm2.png'" 
		onmouseout="this.src='${pageContext.request.contextPath}/resources/store/icon/confirm1.png'"
		<c:if test ="${sessionScope.User == null}"> disabled="disabled"</c:if>>
		
		</div>
		</div>
		
		</div>
		
		
		
		</div>
		
	
	</form>
</div>
<div class="clear" style="height:30px"></div>

<!-- 리뷰 내용 시작 -->
<div class="review_back">
<div class="total_review" >
<span class="total_review_span">
<h3 style="font-size: 30px;">전체 리뷰 (${reviewCount})</h3>
</span>
</div>
<div class="review_list_back" id="review_back_append">


<!-- 리뷰가 없을때 -->
<c:if test="${reviewCount eq '0'}">
<div class="review_list">
<div class="member_info_div">
<span class="member_info_span">
<span class="member_profile">
<img src="${pageContext.request.contextPath}/resources/store/icon/1.jpg" class="profile_image" style ="width: 100px;border-radius: 50%;">
</span>
OurMeal
</span>
</div>
<div class="review_content">
<div class="score_div2">
<span class="date_span" >2018-12-12 11:22:33</span>
  		
		<span class="star_span2" >
		<span class="starRev">
		<label class = "star_label" >별점 : </label>
		<img class="star_image"  src="${pageContext.request.contextPath}/resources/store/icon/star_4.png">
  		</span>
		</span>
		</div>
		<div class ="review_content_div">
		<span class="review_content_text" id ="content_${st.index}"><b>
		<c:out value="리뷰는 이렇게 달려요. 첫 리뷰가 작성되면 이 리뷰는 사라집니다."></c:out></b>
		
		
		</span>
		</div>
		<div class="review_image_div" >
		<a class="review_image_btn"><img class="review_image" src="${pageContext.request.contextPath}/resources/partner/image/store2.jpg"></a>
		</div>


</div>
</div>


</c:if>
<!-- 리뷰 없을때 끝 -->




<c:forEach items="${list}" var="sb" varStatus = "st">
<div class="review_list">
<div class="member_info_div">
<span class="member_info_span">
<span class="member_profile">


<img src="${pageContext.request.contextPath}${sb.member_image}" class="profile_image" style="width: 100px;border-radius: 50%;">




</span>
${sb.member_id}
</span>
<c:if test="${sessionScope.User.member_id eq sb.member_id}">
<span class="edit_span">
<a onclick="reviewModify(${sb.sb_no})" class="ed_a" >수정</a><b> . </b><a onclick="reviewDelete(${sb.sb_no})"class="ed_a">삭제</a></span>
</c:if>
</div>
<div class="review_content">
<div class="score_div2">
<span class="date_span" id = "date_${st.index}">${sb.sb_u_date}</span>
  		
		<span class="star_span2" >
		<span class="starRev">
		<label class = "star_label" >별점 : </label>
		<!-- <img class="star_image"  src="${pageContext.request.contextPath}/resources/store/icon/star_5.png">
		 -->
		 <c:set var ="score" value="${sb.sb_score}"/>
		<c:if test="${score eq '1.0'}">
		<img class="star_image" src="${pageContext.request.contextPath}/resources/store/icon/star_1.png">
  		
  		</c:if>
  		<c:if  test="${score == 2.0}">
		<img class="star_image"  src="${pageContext.request.contextPath}/resources/store/icon/star_2.png">
  		
  		</c:if>
  		<c:if test="${score == 3.0}">
		<img class="star_image"  src="${pageContext.request.contextPath}/resources/store/icon/star_3.png">
  		
  		</c:if>
  		<c:if test="${score == 4.0}">
		
		<img class="star_image"  src="${pageContext.request.contextPath}/resources/store/icon/star_4.png">
  		
  		</c:if>
  		<c:if test="${score == 5.0}">
		
		<img class="star_image"  src="${pageContext.request.contextPath}/resources/store/icon/star_5.png">
  		
  		</c:if>
  		
  		
  		
  		
  		
		</span>
		
		
		</span>
		
		</div>
		<div class ="review_content_div">
		<span class="review_content_text" id ="content_${st.index}"><b>
		<c:out value="${fn:trim(sb.sb_content)}"></c:out></b>
		
		
		</span>
		</div>
		<div class="review_image_div" id="image_${st.index}">
		<c:if test="${sb.sb_image ne '' }">
		<a class="review_image_btn"><img class="review_image" src="${pageContext.request.contextPath}${sb.sb_image}"></a>
		</c:if>
		</div>


</div>
</div>
</c:forEach>

</div>
<div class="more_btn">
<c:if test = "${btn_no ne true}">
<input type="button" class="more_btn" id ="more_btn" value ="더보기(${size}/${reviewCount})">
</c:if>
</div>
</div>




</div>
  
  
<div id="tab-2" class="tab-content " >
 
<table >
<c:forEach items = "${menuList}" var="menu">
<tr>
<th rowspan="3" style="width: 250px; height: 250px;">

		<img src="${pageContext.request.contextPath}${menu.fm_image}" style="width:100%; height:100%">

<td><b style="font-size:70px">${menu.fm_name}</b><br> <b>열량:</b> ${menu.fm_kcal}kcal<br> <span style="overflow: auto;"><b>알레르기:</b> ${menu.fm_allergy}</span></td>
</tr>
<tr><td>${menu.fm_info}</td>
</tr>
<tr><td>${menu.fm_price}원</td></tr>

</c:forEach>
</table>

 </div>  
 
</div>
		
		
		
		</section>
		
		</div>
		
		</div>
		
		
			</div>
			</div>
			










	
		
		
		
		
		
	

<!-- footer -->
	<%@ include file="../../resources/include/footer.jsp"%>

	<!-- popup -->
	<script
		src="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.js"></script>

	<!-- popup content -->
	<%@ include file="../../resources/include/popup.jsp"%>

	<script
		src="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/main/popup/dist/event.js"></script>
	
	
	
	
	
	<script>
		
	var loc ="${store.roadaddrpart1}";
	var title = "${store.store_title}";
	var info = "${store.store_address}";
	var img = "${pageContext.request.contextPath}${store.store_image}";
	
	
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();

	
	
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(loc, function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {

	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

	     // 마커 이미지
			var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
			// 마커 이미지의 이미지 크기 입니다
			var imageSize = new daum.maps.Size(24, 35);

			// 마커 이미지를 생성합니다
			var markerImage = new daum.maps.MarkerImage(
					imageSrc, imageSize);

			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : coords,
					//infoMap.get("latlng"), // 마커의 위치
				image : markerImage
			});

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new daum.maps.InfoWindow({
	            content: '<div class="map_info_div"><div class="info_img_div"><span class="info_img_span">'
					+'<img class = "info_img" src="'+img+'"></span></div>'	
					+'<div class="info_info">'+'<span class="info_title"><b class="it">'+title+'</b></span>'
					+'<span class="info_addr"><b class="ia">주소 : '+info+'</b></span>'
					
					+'</div></div>'
	        });
	        infowindow.close(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	    
	    var test = 0;
	 	daum.maps.event.addListener(marker, 'click', function() {
	        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	       if (test == 0){
	        infowindow.open(map, marker);
	        test = 1;
	       } else {
	    	   infowindow.close(map, marker);
	    	   test=0;
	       }
	        
	   
		});
	 
	    
	    
	});    

	
	
	</script>
	
	
	
	
	
	
	
	
	</body>
	</html>
	