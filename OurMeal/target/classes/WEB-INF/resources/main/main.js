$( document ).ready(function() {
	$("#member_id").click(function(){		
		var text = $("#member_id").val();
		
		if(text=="아이디"){
			$("#member_id").val("");
		}
		
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
	var idtext = $("#member_id").val();
	var idsize = $("#member_id").val().trim().length;
	var pwtext = $("#member_pw").val();
	var pwsize = $("#member_pw").val().trim().length;
	
	if(idsize==0 || idtext=="아이디"){
		alert("아이디를 입력해 주세요.");
		$("#member_id").focus();
		$("#member_id").val("");
		return;
	}
	
	if(pwsize==0 || pwtext=="패스워드"){
		alert("비밀번호를 입력해 주세요.");
		$("#member_pw").focus();
		$("#member_pw").val("");
		return;
	}	
				
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
					location.reload();
					$("#login_close").trigger("click");					
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

