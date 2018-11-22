$( document ).ready(function() {
	
	$("#member_id").click(function(){
		$("#member_id").val("");		
	});
	$("#partner_id").click(function(){
		$("#partner_id").val("");		
	});
	$("#admin_id").click(function(){
		$("#admin_id").val("");		
	});	

	$("#member_pw").click(function(){		
		$("#member_pw").val("");
		$("#member_pw").attr("type","password");
	});	
	$("#partner_pw").click(function(){		
		$("#partner_pw").val("");
		$("#partner_pw").attr("type","password");
	});	
	$("#admin_pw").click(function(){		
		$("#admin_pw").val("");
		$("#admin_pw").attr("type","password");
	});	
	
	$('#member_pw').focusin(function(){
		$("#member_pw").val("");
		$("#member_pw").attr("type","password");
	});
	$('#partner_pw').focusin(function(){
		$("#partner_pw").val("");
		$("#partner_pw").attr("type","password");
	});
	$('#admin_pw').focusin(function(){
		$("#admin_pw").val("");
		$("#admin_pw").attr("type","password");
	});
	
	$("#member_login_btn").click(function(){
		var login_name = $(this).attr('name');
		
		var member_id = $("#"+login_name+"_id").val();
		var member_pw = $("#"+login_name+"_pw").val();
		loginCheck(member_id, member_pw, login_name);
	});

	$("#partner_login_btn").click(function(){
		var login_name = $(this).attr('name');
		
		var member_id = $("#"+login_name+"_id").val();
		var member_pw = $("#"+login_name+"_pw").val();
		loginCheck(member_id, member_pw, login_name);
	});
	
	$("#admin_login_btn").click(function(){
		var login_name = $(this).attr('name');
		
		var member_id = $("#"+login_name+"_id").val();
		var member_pw = $("#"+login_name+"_pw").val();
		loginCheck(member_id, member_pw, login_name);
	});
	function loginCheck(id,pw,name){		
		var member_id = id;
		var member_pw = pw;
		var login_name = name;
		
		var division = ",";
		var data = member_id + division + member_pw;
		
		//alert(data);
		
		$.ajax({
			type: "POST",
			url: "/OurMeal/"+login_name+"/checkId/" + data,
			dataType: "json",
			success: function (result) {
				if(result.value!="data"){
					$("#idpwBox").css('visibility', 'visible');
				}else{
					$("#login_close").trigger("click");
					location.reload();
				}
				//result.value가 data라면 로그인성공
				//else 로그인 실패
				//alert(result.value);
			},
			error: function () {
				alert("서버 통신 실패");
			}
		});
	}
	
	
});

