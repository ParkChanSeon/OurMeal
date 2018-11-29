<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
html {overflow:hidden;} 
	.member_id{
		font-weight: bold;
	}
.textbox {position: relative;} .textbox label { position: absolute; top: 1px; /* input 요소의 border-top 설정값 만큼 */ left: 1px; /* input 요소의 border-left 설정값 만큼 */ padding: .8em .5em; /* input 요소의 padding 값 만큼 */ color: #999; cursor: text; } .textbox input[type="text"], .textbox input[type="password"] { width: 100%; /* 원하는 너비 설정 */ height: auto; /* 높이값 초기화 */ line-height : normal; /* line-height 초기화 */ padding: .8em .5em; /* 원하는 여백 설정, 상하단 여백으로 높이를 조절 */ font-family: inherit; /* 폰트 상속 */ border: 1px solid #999; border-radius: 0; /* iSO 둥근모서리 제거 */ outline-style: none; /* 포커스시 발생하는 효과 제거를 원한다면 */ -webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */ -moz-appearance: none; appearance: none; }


.container{max-width:1170px; margin:auto;}
img{ max-width:100%;}
.inbox_people {
  background: #f8f8f8 none repeat scroll 0 0;
  float: left;
  overflow: hidden;
  width: 40%; border-right:1px solid #c4c4c4;
}
.inbox_msg {
  border: 1px solid #c4c4c4;
  clear: both;
  overflow: hidden;
}
.top_spac{ margin: 20px 0 0;}


.recent_heading {float: left; width:40%;}
.srch_bar {
  display: inline-block;
  text-align: right;
  width: 60%; padding:
}
.headind_srch{ padding:10px 29px 10px 20px; overflow:hidden; border-bottom:1px solid #c4c4c4;}

.recent_heading h4 {
  color: #05728f;
  font-size: 21px;
  margin: auto;
}
.srch_bar input{ border:1px solid #cdcdcd; border-width:0 0 1px 0; width:80%; padding:2px 0 4px 6px; background:none;}
.srch_bar .input-group-addon button {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
  padding: 0;
  color: #707070;
  font-size: 18px;
}
.srch_bar .input-group-addon { margin: 0 0 0 -27px;}

.chat_ib h5{ font-size:15px; color:#464646; margin:0 0 8px 0;}
.chat_ib h5 span{ font-size:13px; float:right;}
.chat_ib p{ font-size:14px; color:#989898; margin:auto}
.chat_img {
  float: left;
  width: 11%;
}
.chat_ib {
  float: left;
  padding: 0 0 0 15px;
  width: 88%;
}

.chat_people{ overflow:hidden; clear:both;}
.chat_list {
  border-bottom: 1px solid #c4c4c4;
  margin: 0;
  padding: 18px 16px 10px;
}
.inbox_chat { height: 550px; overflow-y: scroll;}

.active_chat{ background:#ebebeb;}

.incoming_msg_img {
  display: inline-block;
  width: 6%;
}
.received_msg {
  display: inline-block;
  padding: 0 0 0 10px;
  vertical-align: top;
  width: 92%;
 }
 .received_withd_msg p {
  background: #ebebeb none repeat scroll 0 0;
  border-radius: 3px;
  color: #646464;
  font-size: 14px;
  margin: 0;
  padding: 5px 10px 5px 12px;
  width: 100%;
}
.time_date {
  color: #747474;
  display: block;
  font-size: 12px;
  margin: 8px 0 0;
}
.received_withd_msg { width: 57%;}
.mesgs {
  float: left;
  padding: 30px 15px 0 25px;
  width: 100%;
}

 .sent_msg p {
  background: #05728f none repeat scroll 0 0;
  border-radius: 3px;
  font-size: 14px;
  margin: 0; color:#fff;
  padding: 5px 10px 5px 12px;
  width:100%;
}
.outgoing_msg{ overflow:hidden; margin:26px 0 26px;}
.sent_msg {
  float: right;
  width: 46%;
}
.input_msg_write input {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
  color: #4c4c4c;
  font-size: 15px;
  min-height: 48px;
  width: 100%;
}

.type_msg {border-top: 1px solid #c4c4c4;position: relative;}
.msg_send_btn {
  background: #05728f none repeat scroll 0 0;
  border: medium none;
  border-radius: 50%;
  color: #fff;
  cursor: pointer;
  font-size: 17px;
  height: 33px;
  position: absolute;
  right: 0;
  top: 11px;
  width: 33px;
}
.messaging { padding: 0 0 50px 0;}
.msg_history {
  height: 516px;
  overflow-y: auto;  
}
</style>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!------ Include the above in your HEAD tag ---------->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<meta charset="UTF-8">
<title>고객센터 관리자와 채팅</title>
<script type="text/javascript">
	
	// 웹소켓을 지정한 url로 연결한다.
	let sock = new SockJS("<c:url value="/echo"/>");
	sock.onmessage = onMessage;
	sock.onclose = onClose;

	$(document).ready(function() {
		
		/*
		window.onbeforeunload = function() {
			alert("종료될때");
			return "떠나려고 하시나요? ㅠㅠ 떠나려고 하시나요? ㅠㅠ 떠나려고 하시나요? ㅠㅠ 떠나려고 하시나요? ㅠㅠ 떠나려고 하시나요? ㅠㅠ 떠나려고 하시나요? ㅠㅠ";
		}
		*/
		
		$("#sendBtn").click(function() {
			sendMessage();
			$('#message').val('');
		});

		$("#message").keydown(function(key) {
			// 엔터키 입력 감지
			if (key.keyCode == 13) {
				sendMessage();
				$('#message').val('');
			}
		});

	});


	
	// 메시지 전송
	function sendMessage() {
		//let sock = new SockJS("<c:url value="/echo"/>");
		
		sock.send($("#message").val());
	}

	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = "";
		data = msg.data;

		if(data=="login"){
			alert("로그인 후 채팅이 가능 합니다.");
			opener.parent.location.reload();
			window.close();
		}

		if(data=="adminNotLogin"){
			alert("현재 관리자가 접속중이지 않아서 채팅이 불가능 합니다.");
			opener.parent.location.reload();
			window.close();
		}

		if(data=="chatting"){
			alert("현재 관리자는 다른 사람과 채팅 중 입니다.");
			opener.parent.location.reload();
			window.close();
		}
		
		if(data=="overlap"){
			alert("이미 채팅창을 사용하고 있습니다.");
			return;
		}		

		if(data=="adminout"){
			alert("관리자가 접속을 종료 했습니다.");	
			opener.parent.location.reload();
			window.close();			
		}
		
		$("#data").append(data);

		scrollEvent();
	}
	
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		alert("채팅 서버와 접속이 끊겨 브라우저를 종료 합니다.");
		opener.parent.location.reload();
		window.close();
	}

	//자동 스크롤
	function scrollEvent() {
		var scHeight = $('#data').prop('scrollHeight');
		$('#data').scrollTop(scHeight);
	}



</script>
</head>
<body>
<div class="container">
<h3 class=" text-center">고객센터 채팅</h3>
<div class="messaging">
      <div class="inbox_msg">        
        <div class="mesgs">
          <div class="msg_history" id="data">
			<!-- 채팅 내용 출력 -->
          </div>
          <div class="type_msg">
            <div class="input_msg_write">
              <input type="text" class="write_msg" id="message" placeholder="메세지를 입력 하세요."  />
              <button class="msg_send_btn" type="button" id="sendBtn"><i class="fa fa-paper-plane-o" aria-hidden="true" ></i></button>
            </div>
          </div>
        </div>
      </div>      
    </div></div>
    
</body>
</html>