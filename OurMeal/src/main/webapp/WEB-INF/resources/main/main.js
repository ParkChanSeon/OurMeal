$( document ).ready(function() {
	$("#member_id").click(function(){
		$("#member_id").val("");
	});

	$("#member_pw").click(function(){		
		$("#member_pw").val("");
	});
	
	//아이디 비번 비었는지 체크후 서브밋
	$("#login_btn").click(function(){		
		$( "#login_submit" ).submit();
	});	
});

