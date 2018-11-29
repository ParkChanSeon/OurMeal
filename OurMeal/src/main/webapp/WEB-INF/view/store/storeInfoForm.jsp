<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	<script>
$(document).ready( function() {
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
});
</script>  	



<!--  주소 script -->

<script language="javascript">
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function goPopup(){
   // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("${pageContext.request.contextPath}/storeJuso","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    
   // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}
/** API 서비스 제공항목 확대 (2017.02) **/
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
                  , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
   // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
   document.form.roadAddrPart1.value = roadAddrPart1;
   document.form.roadAddrPart2.value = roadAddrPart2;
   document.form.addrDetail.value = addrDetail;
   document.form.zipNo.value = zipNo;
	document.form.admCd.value = admCd;
	document.form.roadFullAddr.value = roadFullAddr;
	
   self.close();
   
}

function cancle(){
	if(confirm("취소하시겠습니까?")){
		window.history.back();
	}

}




function check() {

  if(form.store_title.value == "") {

    alert("상호를 입력해 주세요.");

   form.store_title.focus();

    return false;

  }

  else if(form.store_tel.value == "") {

    alert("전화번호를 입력해 주세요.");

    form.store_tel.focus();

    return false;

  }
  
  else if(form.store_address.value == "") {

	    alert("주소를 입력해 주세요.");

	    

	    return false;

	  }
  else if(form.store_type.value == "선택") {

	    alert("음식 종류를 선택해 주세요.");



	    return false;

	  }
  

  else return true;

}
</script>



<!-- jquery -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.min.js"></script>


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
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.min.js"></script>
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
		<div class ="store_info_inner">
		<div class="info_title_header">
		
		<span class="info_title"><strong>가게 정보	Page</strong></span>
		</div>
		
		<section class="restaurant-detail" style="text-align: center;">
		
		<form name= "form" id="form" action="${pageContext.request.contextPath}/storeInfoUpdate" 
		method="POST" enctype="multipart/form-data" onsubmit="return check();">
		
		<input type = "hidden" name="store_code" value="${store.store_code}">
		<input type = "hidden" name="member_id" value="${store.member_id}">
		<div class="container" >
 		<table class="infoForm_table">
		<tr>
		<th style="text-align: center; vertical-align: middle;"><b class="name_label">상호명</b></th>
		<td><input type="text" name="store_title" value="${store.store_title}" ></td>
		</tr>
		
		<!-- 메인사진 -->
		<tr>
		<th><b class="name_label">메인사진<br/></b></th>
		<td style="text-align: center;">
		
			<input type="hidden" name = "store_image" value="${store.store_image}">
			  
           <span class="btn btn-default btn-file" style="width:200px; height:200px; vertical-align: middle; padding:0;" >
           	
             
             <c:if test="${store.store_image eq null }" var = "mainImage">
             <input type="file" id="imgInp" name="file">
             <img id='img-upload' src="${pageContext.request.contextPath}/resources/store/icon/addPhoto.png" />       	
            </c:if>
            <c:if test ="${not mainImage}" >
            <input type="file" id="imgInp" name="file">
             <img id='img-upload' src="${pageContext.request.contextPath}${store.store_image}" />
            </c:if>
            </span>
		
		</td>
		</tr>
		
		<!--  주소 -->
		<tr>
		<th style="text-align: center; vertical-align: middle;"><b class="name_label">주소</b></th>
		<td>
		
		<div class="form-group">
		<table >
         <colgroup>
            <col style="width:20%"><col>
         </colgroup>
         <tbody>
            <tr>
               <th>우편번호</th>
               <td>
                   <input class="inputField" type="hidden" id="confmKey"  name="confmKey"  >
                  <input class="inputField2"  type="text" id="zipNo"   name="zip_no" placeholder="${store.zip_no}" value="${store.zip_no}" readonly style="width:200px; margin-right: 5px;
    display: inline-block;
    float: left;">
                  <button class="btn btn-default" type="button"  value="주소검색" onclick="goPopup();"
                  style="float:left; display: inline-block; width:130px;
                  float: left;
    display: inline-block">주소검색</button>
               </td>
            </tr>
            <tr>
               <th>도로명주소</th>
               <td><input class="inputField2" type="text" id="roadAddrPart1" name="roadaddrpart1"   placeholder="${store.roadaddrpart1}" value="${store.roadaddrpart1}" readonly style="width:100%" ></td>
            </tr>
            <tr>
               <th>상세주소</th>
               <td>
                  <input class="inputField2" type="text" id="addrDetail" name="addrdetail" placeholder="${store.addrdetail}" value="${store.addrdetail}" style="width:50%" readonly >
                  <input class="inputField2" type="text" id="roadAddrPart2"  name="roadaddrpart2" placeholder="${store.roadaddrpart2}" value="${store.roadaddrpart2}" style="width:50%" readonly>
                	<input type="hidden" id="admCd" name="loc_code" placeholder="${store.loc_code}" value="${store.loc_code}" >
                	
                	<input type="hidden" id="roadFullAddr" name="store_address" placeholder="${store.store_address}" value="${store.store_address}">
                 
               </td>
            </tr>
         </tbody>
      </table>
		
      </div>
		
		</td>
		
		</tr>
		
		<!-- 전화번호 -->
		
		<tr>
		<th style="text-align: center; vertical-align: middle;"><b class="name_label">전화번호</b></th>
		<td><input type="text" name="store_tel" value="${store.store_tel}"  value="${store.store_tel}" maxlength="15"></td>
		</tr>
		
		<!-- 음식종류 -->
		<tr>
		<th style="text-align: center; vertical-align: middle;"><b class="name_label">음식종류</b></th>
		<td>
		<select class="form-control" name="store_type" style="height:60px; width:40%; font-size: 35px; display: inline-block; float:left; margin-bottom: 10px;">
   <option class= "inputField" value="선택" <c:if test="${store.store_type eq null}">selected</c:if>>선택</option>
   <option  class= "inputField" value="한식" <c:if test="${store.store_type eq '한식'}">selected</c:if>>한식</option>
   <option  class= "inputField" value="분식" <c:if test="${store.store_type eq '분식'}">selected</c:if>>분식</option>
   <option  class= "inputField" value="양식"<c:if test="${store.store_type eq '양식'}">selected</c:if>>양식</option>
    <option  class= "inputField" value="일식"<c:if test="${store.store_type eq'일식'}">selected</c:if>>일식</option>
   <option class= "inputField" value="세계음식"<c:if test="${store.store_type eq '세계음식'}">selected</c:if>>세계음식</option>
   <option  class= "inputField" value="뷔페"<c:if test="${store.store_type eq '뷔페'}">selected</c:if>>뷔페</option>
   <option  class= "inputField" value="디저트"<c:if test="${store.store_type eq '디저트'}">selected</c:if>>디저트</option>
   <option  class= "inputField" value="카페"<c:if test="${store.store_type eq '카페'}">selected</c:if>>카페</option>
   <option class= "inputField" value="술집" <c:if test="${store.store_type eq '술집'}">selected</c:if>>술집</option>
   <option  class= "inputField" value="치킨"<c:if test="${store.store_type eq '치킨'}">selected</c:if>>치킨</option>
    <option class= "inputField" value="브런치"<c:if test="${store.store_type eq '브런치'}">selected</c:if> >브런치</option>
   <option  class= "inputField" value="이탈리안"<c:if test="${store.store_type eq '이탈리안'}">selected</c:if>>이탈리안</option>
   <option  class= "inputField" value="기타"<c:if test="${store.store_type eq '기타'}">selected</c:if>>기타</option>
   </select>





</td>
		</tr>
		
		<!-- 주차 -->
		
		<tr>
		<th style="text-align: center; vertical-align: middle;"><b class="name_label">주차</b></th>
		<td><input type="text" name="store_parking" value="${store.store_parking}"></td>
		</tr>
		
		
		<tr>
		<th style="text-align: center; vertical-align: middle;"><b class="name_label">영업시간</b></th>
		<td><textarea rows="3" cols="20" id = "textarea1" name="store_o_time"  style="resize: none;">${store.store_o_time}</textarea></td>
		</tr>
		
		
		<tr>
		<th style="text-align: center; vertical-align: middle;"><b class="name_label">쉬는시간</b></th>
		<td><textarea rows="3" cols="20" id = "textarea2" name="store_b_time"  style="resize: none;">${store.store_b_time}</textarea></td>
		</tr>
		
		<tr>
		<th style="text-align: center; vertical-align: middle;"><b class="name_label">웹사이트</b></th>
		<td><input type="text" name="store_website" value="${store.store_website}"  ></td>
		</tr>
		
		<tr>
		<th style="text-align: center; vertical-align: middle;"><b class="name_label">가게소개</b></th>
		<td><textarea rows="5" cols="20" id = "textarea3" name="store_info" style="resize: none;">${store.store_info}</textarea></td>
		</tr>
		
		
		</table>



	</div>
  
  <div style="text-align: center; vertical-align:middle; width:100%;">
  <input type="submit" style="display:inline-block; color:white; margin-right:20px;  "value="확인">
  <input type="button" style=" color:white; margin-left:20px;  "  value="취소" onclick='cancle()'>
 </div>

		</form>
	</section>
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
	
	
	
	
	
	
	
	
	
	
	
	</body>
	</html>
	