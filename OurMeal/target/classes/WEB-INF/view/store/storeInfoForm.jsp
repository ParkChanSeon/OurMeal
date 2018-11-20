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


<!-- main js -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/main/main.js"></script>

<!-- partner js -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/partner/js/partner.js"></script>
	
	
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

   self.close();
}
</script>
	
	
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
		<div class ="store_info_inner">
		<div class="info_title_header">
		
		<span class="info_title"><strong>가게 정보	Page</strong></span>
		</div>
		
		<section class="restaurant-detail">
		
		<form action="${pageContext.request.contextPath}" method="POST">
		
		<table class="infoForm_table">
		<tr>
		<th style="text-align: center; vertical-align: middle;"><b class="name_label">상호명</b></th>
		<td><input type="text" name="store_title" value="${store_title}" placeholder="${store_title}"></td>
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
                   <input class="inputField" type="hidden" id="confmKey"  name="confmKey"   >
                  <input class="inputField2"  type="text" id="zipNo"   name="zipNo" readonly style="width:200px; margin-right: 5px;
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
               <td><input class="inputField2" type="text" id="roadAddrPart1" name="roadAddrPart1" style="width:100%" ></td>
            </tr>
            <tr>
               <th>상세주소</th>
               <td>
                  <input class="inputField2" type="text" id="addrDetail" name="addrDetail" style="width:50%"  >
                  <input class="inputField2" type="text" id="roadAddrPart2"  name="roadAddrPart2" style="width:50%" >
                
                 <c:if test ="${errors.store_address}"><b>주소를 입력하세요.</b></c:if>
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
		<td><input type="text" name="store_tel" value="${store_tel}" placeholder="${store_tel}"></td>
		</tr>
		
		<!-- 음식종류 -->
		<tr>
		<th style="text-align: center; vertical-align: middle;"><b class="name_label">음식 종류</b></th>
		<td>
		<select class="form-control" name="store_type" style="height:60px; width:40%; font-size: 35px; display: inline-block; float:left; margin-bottom: 10px;">
   <option class= "inputField" value="선택" selected>선택</option>
   <option  class= "inputField" value="한식">한식</option>
   <option  class= "inputField" value="분식">분식</option>
   <option  class= "inputField" value="양식">양식</option>
    <option  class= "inputField" value="일식">일식</option>
   <option class= "inputField" value="세계음식">세계음식</option>
   <option  class= "inputField" value="뷔페">뷔페</option>
   <option  class= "inputField" value="디저트">디저트</option>
   <option  class= "inputField" value="카페">카페</option>
   <option class= "inputField" value="술집" >술집</option>
   <option  class= "inputField" value="치킨">치킨</option>
    <option class= "inputField" value="브런치" >브런치</option>
   <option  class= "inputField" value="이탈리안">이탈리안</option>
   </select>





</td>
		</tr>
		
		<!-- 주차 -->
		
		<tr>
		<th style="text-align: center; vertical-align: middle;"><b class="name_label">주차</b></th>
		<td><input type="text" name="store_parking" value="${store_parking}" placeholder="${store_parking}"></td>
		</tr>
		
		
		<tr>
		<th style="text-align: center; vertical-align: middle;"><b class="name_label">영업시간</b></th>
		<td><textarea rows="3" cols="20" name="store_o_time" placeholder="${store_o_time}" style="resize: none;">${store_o_time}</textarea></td>
		</tr>
		
		
		<tr>
		<th style="text-align: center; vertical-align: middle;"><b class="name_label">쉬는시간</b></th>
		<td><textarea rows="3" cols="20" name="store_b_time" placeholder="${store_b_time}" style="resize: none;">${store_b_time}</textarea></td>
		</tr>
		
		<tr>
		<th style="text-align: center; vertical-align: middle;"><b class="name_label">웹사이트</b></th>
		<td><input type="text" name="store_website" value="${store_website}" placeholder="${store_website}"></td>
		</tr>
		
		<tr>
		<th style="text-align: center; vertical-align: middle;"><b class="name_label">가게소개</b></th>
		<td><textarea rows="5" cols="20" name="store_info" placeholder="${store_info}" style="resize: none;">${store_info}</textarea></td>
		</tr>
		
		
		</table>
		
		
		
		
		
		
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
	