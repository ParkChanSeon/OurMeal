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
    text-align: center;
    margin-bottom: 40px;
    margin-top: 50px;">회원가입</h1>
</div>
<form name= "form" id="form" action = "${pageContext.request.contextPath }/join" method="post">
  <div class="form-group">
    <label class= "labelName" for="id">ID </label>
    <input class="inputField" type="text" class="form-control" name="member_id" value="${member_id}">
    <c:if test="${errors.member_id}"><b>ID를 입력하세요.</b></c:if>
   <c:if test="${errors.duplicateId}"><b>이미 사용중인 아이디입니다.</b></c:if>
  </div>
  <div class="form-group">
    <label class= "labelName" for="Password1">비밀번호</label>
    <input  class="inputField" type="password" class="form-control" name="member_pw">
    <c:if test="${errors.member_password}"><b>사용할 비밀번호를 입력하세요.</b></c:if>
  </div>
  <div class="form-group">
    <label class= "labelName" for="Password2">비밀번호 확인</label>
    <input class="inputField" type="password" class="form-control"   name="member_ConfirmPassword" >
  <c:if test="${errors.confirmPassword}"><b>비밀번호를 입력하세요.</b></c:if>
  <c:if test="${errors.notMatch}"><b>비밀번호가 일치하지 않습니다.</b></c:if>
  </div>
  
  <div class="form-group">
    <label class= "labelName" for="Name">이름</label>
    <input class="inputField" type="text" class="form-control" name="member_name" value="${member_name}">
   <c:if test="${errors.member_name}"><b>이름을 입력하세요.</b></c:if>
  </div>
  
  <div class="form-group">
    <label class= "labelName" for="DOB">생년월일</label>
    <input class="inputField" type="text" class="form-control" name="member_birth" value="${member_birth}">
    <c:if test="${errors.member_birth}"><b>생년월일을 입력하세요.</b></c:if>
  </div>
  
  <div class="form-group" >
    <label class= "labelName" for="Gender">성별</label>
    <select class="form-control" name="member_sex" style="height:60px; font-size: 40px">
     <option class= "inputField" value="M" selected>남</option>
   	<option  class= "inputField" value="F">여</option>
  </select>
  </div>
  
  <div class="form-group">
    <label class= "labelName" for="Phone">휴대전화</label>
    <input class="inputField" type="text" class="form-control" name="member_phone" value="${member_phone}">
   <c:if test ="${errors.member_phone}"><b>전화번호를 입력하세요.</b></c:if>
  </div>
  
  <div class="form-group">
    <label class= "labelName" for="Address" >주소</label>
  
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
    <label for="Email"class="labelName">이메일</label>
    <input class="inputField" type="email" class="form-control" name="member_email" value="${member_email}">
   <c:if test ="${errors.member_email}"><b>메일주소를 입력하세요.</b></c:if>
  </div>
  
   <button type="submit" class="btn btn-default">가입하기</button>
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