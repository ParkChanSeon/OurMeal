$( document ).ready(function() {
	
	$("#member_id").click(function(){
		$("#member_id").val("");
	});

	$("#member_pw").click(function(){		
		$("#member_pw").val("");
	});
	
	//아이디 비번 비었는지 체크후 서브밋
	$("#login_btn").click(function(){
				
		var member_id = $("#member_id").val();
		var member_pw = $("#member_pw").val();
		var division = ",";
		var data = member_id + division + member_pw;
		alert(member_id);
		alert(member_pw);
		
		$.ajax({
			type: "POST",			
			url: "/OurMeal/member/checkId/" + data,
			dataType: "json",			
			success: function (result) {				
				alert(result.value);
			},
			error: function () {
				alert("서버 통신 실패");
			}
		});
		
		
		//$( "#login_submit" ).submit();
		
		
		
	});
	
	
});

