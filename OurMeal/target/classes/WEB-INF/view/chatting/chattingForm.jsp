<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
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

		window.onbeforeunload = function ()
		{       
		    if (pasteEditorChange) {
		        var btn = confirm('Do You Want to Save the Changess?');
		           if(btn === true ){
		               SavetoEdit();//your function call
		           }
		           else{
		                windowClose();//your function call
		           }
		    }  else { 
		        windowClose();//your function call
		    }
		};		
		
	});

	// 웹소켓을 지정한 url로 연결한다.
	let sock = new SockJS("<c:url value="/echo"/>");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	
	window.onbeforeunload = function ()
	{       
	    if (pasteEditorChange) {
	        var btn = confirm('Do You Want to Save the Changess?');
	           if(btn === true ){
	               SavetoEdit();//your function call
	           }
	           else{
	                windowClose();//your function call
	           }
	    }  else { 
	        windowClose();//your function call
	    }
	};	
	
	// 메시지 전송
	function sendMessage() {		
		sock.send($("#message").val());
	}


	
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {		
		var data = msg.data;

		
		if(data=="login"){
			let sock = new SockJS("<c:url value="/echo"/>");
			alert("로그인 후 채팅이 가능 합니다.");
			self.close();
			return;
		}else if(data=="adminNotLogin"){			
			let sock = new SockJS("<c:url value="/echo"/>");
			alert("현재 관리자가 접속중이지 않아서 채팅이 불가능 합니다.");
			
			self.close();
			return;
		}else if(data=="chatting"){
			let sock = new SockJS("<c:url value="/echo"/>");
			alert("현재 관리자는 다른 사람과 채팅 중 입니다.");			
			self.close();
			return;
		}else if(data=="overlap"){			
			//let sock = new SockJS("<c:url value="/echo"/>");
			alert("이미 채팅창을 사용하고 있습니다.");		
			return;
		}
		
		$("#data").append(data + "<br/>");
	}
	
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		alert("채팅 연결이 끊겼습니다.");
		self.close();
		$("#data").append("연결 끊김");
	}
</script>
</head>
<body>
<div class="remodal" data-remodal-id="chatting_modal" role="dialog" aria-labelledby="modal1Title" aria-describedby="modal1Desc">
  	<div>
		<input type="text" id="message" />
		<input type="button" id="sendBtn" value="전송" />
		<div id="data"></div>
	</div>
</div>	
</body>
</html>