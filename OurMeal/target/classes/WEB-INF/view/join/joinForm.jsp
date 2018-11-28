<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/join/css/join.css">
<!-- main menu -->
<!--   HEAD  -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main/assets/css/main.css">		
	
	<!-- popup css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/popup/dist/remodal-default-theme.css">
		<!-- main css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/main.css">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main/assets/css/main.css">      
   
   <!-- popup css -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/popup/dist/remodal-default-theme.css">
  <style>
    .remodal-bg.with-red-theme.remodal-is-opening,
    .remodal-bg.with-red-theme.remodal-is-opened {
      filter: none;
    }

    .remodal-overlay.with-red-theme {
      background-color: #f44336;
    }

    .remodal.with-red-theme {
      background: #fff;
    }
    
   
    
   </style>

<%@ include file="/WEB-INF/resources/join/css/bootstrapConfig.jsp"%>

<script language="javascript">
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function goPopup(){
   // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("${pageContext.request.contextPath}/juso","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    
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
<title>회원가입</title>
</head>
<body class="is-preload homepage">


<!-- Main Menu -->
      <%@ include file="../../resources/include/header.jsp" %>
      
      <!-- Main Menu Scripts -->
      <script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.min.js"></script>
      <script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.dropotron.min.js"></script>
      <script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/browser.min.js"></script>
      <script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/breakpoints.min.js"></script>
      <script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/util.js"></script>
      <script type="text/javascript" src="${pageContext.request.contextPath}/resources/main/assets/js/main.js"></script>
   
         
      <!-- 이영역에 각자 구현할 태그를 작성! 샘플로 태그하나 넣어놈-->



<div class="joinBack">
<div class="join_form">
<div class="page-header" style="display:inline;">
  <h1 style="    font-size: 70px;
    text-align: left;
    margin-bottom: 40px;
    margin-top: 50px;">회원가입</h1>
</div>
<form name= "form" id="form" action = "${pageContext.request.contextPath }/join" method="post">
  <div class="form-group" style="margin-bottom: 10px;">
    <label class= "labelName" for="id" style="margin-top: 30px; text-align:left;">ID </label>
    <input class="inputField" type="text" class="form-control" name="member_id" value="${member_id}">
    <c:if test="${errors.member_id}"><b>ID를 입력하세요.</b></c:if>
   <c:if test="${errors.duplicateId}"><b>이미 사용중인 아이디입니다.</b></c:if>
  </div>
  <div class="form-group">
    <label class= "labelName" for="Password1" style="margin-top: 30px; text-align:left;">비밀번호</label>
    <input  class="inputField" type="password" class="form-control" name="member_pw">
    <c:if test="${errors.member_password}"><b>사용할 비밀번호를 입력하세요.</b></c:if>
  </div>
  <div class="form-group">
    <label class= "labelName" for="Password2" style="margin-top: 30px; text-align:left;">비밀번호 확인</label>
    <input class="inputField" type="password" class="form-control"   name="member_ConfirmPassword" >
  <c:if test="${errors.confirmPassword}"><b>비밀번호를 입력하세요.</b></c:if>
  <c:if test="${errors.notMatch}"><b>비밀번호가 일치하지 않습니다.</b></c:if>
  </div>
  
  <div class="form-group">
    <label class= "labelName" for="Name" style="margin-top: 30px; text-align:left;">이름</label>
    <input class="inputField" type="text" class="form-control" name="member_name" value="${member_name}">
   <c:if test="${errors.member_name}"><b>이름을 입력하세요.</b></c:if>
  </div>
  
  <div class="form-group">
    <label class= "labelName" for="DOB" style="margin-top: 30px; text-align:left;">생년월일</label>
    <input class="inputField" type="text" class="form-control" name="member_birth_year" placeholder="출생년도(4자리)" style="display: inline-block; float:left; width: 30%; margin-bottom: 30px;">
     <label class= "labelName" for="년" style="display: inline-block; float:left; width:10%; height: 60px; text-align:center; vertical-align: middle; padding-top: 20px;" >년</label> 
    
   <select class="form-control input-lg" name="member_birth_month" style="height:60px; width:20%; font-size: 40px; display: inline-block; float:left; margin-bottom: 10px;">
   <option class= "inputField" value="01" selected>1</option>
   <option  class= "inputField" value="02">2</option>
   <option  class= "inputField" value="03">3</option>
   <option  class= "inputField" value="04">4</option>
   <option class= "inputField" value="05">5</option>
   <option  class= "inputField" value="06">6</option>
   <option  class= "inputField" value="07">7</option>
   <option  class= "inputField" value="08">8</option>
   <option class= "inputField" value="09" >9</option>
   <option  class= "inputField" value="10">10</option>
    <option class= "inputField" value="11" >11</option>
   <option  class= "inputField" value="12">12</option>
   
   </select>
   <label class= "labelName" for="월" style="display: inline-block; float:left; width:10%; height: 60px; text-align:center; vertical-align: middle; padding-top: 20px;" >월</label>
   
   
    <input class="inputField" type="text" class="form-control" name="member_birth_day" style="display: inline-block; float:left; width: 20%;">
   <label class= "labelName" for="일" style="display: inline-block; float:left; width:10%; height: 60px; text-align:center; vertical-align: middle; padding-top: 20px;" >일</label>
    
    
    <c:if test="${errors.member_birth}"><b>생년월일을 입력하세요.</b></c:if>
  </div>
  
  <div class="form-group" >
    <label class= "labelName" for="Gender" style="clear: both; margin-top: 30px; text-align:left;">성별</label>
    <select class="form-control" name="member_sex" style="height:60px; font-size: 40px">
     <option class= "inputField" value="M" selected>남</option>
   	<option  class= "inputField" value="F">여</option>
  </select>
  </div>
  
  <div class="form-group">
    <label class= "labelName" for="Phone" style="margin-top: 30px; text-align:left;">휴대전화</label>
   <select class="form-control" name="member_phone_front" style="height:60px; width:20%; font-size: 40px; display: inline-block; float:left; margin-bottom: 30px; ">
   <option class= "inputField" value="010" selected>010</option>
   <option  class= "inputField" value="011">011</option>
   <option  class= "inputField" value="016">016</option>
   <option  class= "inputField" value="019">019</option>
   </select>
	 <label class= "labelName" for="-" style="display: inline-block; float:left; width:10%; height: 60px; text-align:center; vertical-align: middle; padding-top: 20px;" >-</label> 
    <input class="inputField" type="text" class="form-control" name="member_phone_middle" style="display: inline-block; float:left; width: 30%;">
    <label class= "labelName" for="-" style="display: inline-block; float:left; width:10%; height: 60px; text-align:center; vertical-align: middle; padding-top: 20px;" >-</label> 
    <input class="inputField" type="text" class="form-control" name="member_phone_end" style="display: inline-block; float:left; width: 30%;">
   
   <c:if test ="${errors.member_phone}"><b>전화번호를 입력하세요.</b></c:if>
  </div>
  
  <div class="form-group">
    <label class= "labelName" for="Address" style="clear: both; margin-top: 30px; text-align:left;">주소</label>
  
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
                  style="float:left; display: inline-block; 
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
                
              
                
                
               
                <c:if test ="${errors.member_address}"><b>주소를 입력하세요.</b></c:if>
               </td>
            </tr>
         </tbody>
      </table>
 
    
 
  
  </div>
  <div class="form-group">
    <label for="Email"class="labelName" style="margin-top: 30px; text-align:left;">이메일</label>
    <input class="inputField" type="email" class="form-control" name="member_email" value="${member_email}">
   <c:if test ="${errors.member_email}"><b>메일주소를 입력하세요.</b></c:if>
  </div>
  
   <button type="submit" class="btn btn-default" float="left">가입하기</button>
</form>

</div>
</div>



<!-- 이영역에 각자 구현할 태그를 작성! 여기까지!!!! -->
      
      
      <!-- footer -->                  
      <%@ include file="../../resources/include/footer.jsp" %>
      
      <!-- popup -->
      <script src="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.js"></script>
      
      <!-- popup content -->
      <%@ include file="../../resources/include/popup.jsp" %>

      <script src="${pageContext.request.contextPath}/resources/main/popup/dist/remodal.js"></script>      
      <script src="${pageContext.request.contextPath}/resources/main/popup/dist/event.js"></script>
   </body>
</html>