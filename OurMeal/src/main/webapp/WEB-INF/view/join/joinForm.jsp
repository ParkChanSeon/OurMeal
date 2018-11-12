<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include  file="/WEB-INF/resources/join/css/bootstrapConfig.jsp"%>
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
<body>


<div style="width:500px; height:700px"> 
<div class="join_form">
<div class="page-header" style="display:inline;">
  <h1>Join Membership</h1>
</div>
<form name= "form" id="form" action = "${pageContext.request.contextPath }/join" method="post">
  <div class="form-group">
    <label for="id">ID </label>
    <input type="text" class="form-control" name="member_Id">
    <c:if test="${errors.member_Id}"><b>ID를 입력하세요.</b></c:if>
	<c:if test="${errors.duplicateId}"><b>이미 사용중인 아이디입니다.</b></c:if>
  </div>
  <div class="form-group">
    <label for="Password1">비밀번호</label>
    <input type="password" class="form-control" name="member_Password">
    <c:if test="${errors.member_Password}"><b>사용할 비밀번호를 입력하세요.</b></c:if>
  </div>
  <div class="form-group">
    <label for="Password2">비밀번호 확인</label>
    <input type="password" class="form-control"   name="member_ConfirmPassword" >
  <c:if test="${errors.confirmPassword}"><b>비밀번호를 입력하세요.</b></c:if>
  <c:if test="${errors.notMatch}"><b>비밀번호가 일치하지 않습니다.</b></c:if>
  </div>
  
  <div class="form-group">
    <label for="Name">이름</label>
    <input type="text" class="form-control" name="member_Name">
   <c:if test="${errors.member_Name}"><b>이름을 입력하세요.</b></c:if>
  </div>
  
  <div class="form-group">
    <label for="DOB">생년월일</label>
    <input type="text" class="form-control" name="member_Dob">
    <c:if test="${errors.member_Dob}"><b>생년월일을 입력하세요.</b></c:if>
  </div>
  
  <div class="form-group">
    <label for="Gender">성별</label>
    <select class="form-control" name="member_Gender">
  	<option value="남" selected >남</option> 
	<option value="여">여</option> 
  </select>
  </div>
  
  <div class="form-group">
    <label for="Phone">휴대전화</label>
    <input type="text" class="form-control" name="member_Tel">
   <c:if test ="${errors.member_Tel}"><b>전화번호를 입력하세요.</b></c:if>
  </div>
  
  <div class="form-group">
    <label for="Address" >주소</label>
  
  	<table >
			<colgroup>
				<col style="width:20%"><col>
			</colgroup>
			<tbody>
				<tr>
					<th>우편번호</th>
					<td>
					    <input type="hidden" id="confmKey"  name="confmKey" value=""  >
						<input type="text" id="zipNo"   name="zipNo" readonly style="width:100px">
						<input type="button"  value="주소검색" onclick="goPopup();">
					</td>
				</tr>
				<tr>
					<th>도로명주소</th>
					<td><input type="text" id="roadAddrPart1"  style="width:85%"></td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td>
						<input type="text" id="addrDetail"  style="width:40%" value="">
						<input type="text" id="roadAddrPart2"   style="width:40%" value="">
					  <c:if test ="${errors.member_Address}"><b>주소를 입력하세요.</b></c:if>
					</td>
				</tr>
			</tbody>
		</table>
  
  
  
    <input type="hidden" name="member_Address" value="${addrDetail}+${roadAddrPart2}">
 
  
  </div>
  <div class="form-group">
    <label for="Email">이메일</label>
    <input type="email" class="form-control" name="member_Email">
   <c:if test ="${errors.member_Email}"><b>메일주소를 입력하세요.</b></c:if>
  </div>
  
   <button type="submit" class="btn btn-default">가입하기</button>
</form>

</div>
</div>


</body>
</html>
