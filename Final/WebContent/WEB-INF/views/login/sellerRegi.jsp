<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h1>판매자등록</h1>
<form action="" method="post" id="_regiForm" name="regiForm">
					
					<table class="content_table" style="width: 75%">
					<colgroup>
						<col style="width:30%">
						<col style="width:70%">
					</colgroup>	
					
					<tr>
						<th>아이디첵크</th>
						<td>
							<input type="text" id="c_id" size="30">
							<a href="#none" id="_btnGetId" title="회원가입">
								<img alt="회원가입" src="image/idcheck.png">
							</a>
							<div id="_rgetid"></div>
						</td>					
					</tr>
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" name="id" id="_userid" size="30" data-msg="아이디를" readonly="readonly">
						</td>	
					</tr>
					
					<tr>
						<th>패스워드</th>
						<td>
							<input type="text" name="pw" id="_pw" size="30" data-msg="패스워드를">
						</td>	
					</tr>
					
					<tr>
						<th>사업장 주소</th>
						<td>
							<input type="text" name="address" id="_address" size="30" data-msg="사업장 주소를">
						</td>	
					</tr>
					
					<tr>
						<th>사업장 연락처</th>
						<td>
							<input type="text" name="phone" id="_phone" size="30" data-msg="연락처를  ">
						</td>	
					</tr>
					
					<tr>
						<th>기업 이름</th>
						<td>
							<input type="text" name="name" id="_name" size="30" data-msg="기업 이름을 ">
						</td>	
					</tr>

					<tr>
						<td colspan="2" style="height: 50px; text-align: center">
						<a href="#none" id="regiBTN" title="회원가입">
							<img alt="회원가입" src="image/regiBTN.png">
						</a>
						
						<a href="#none" id="logBTN" title="로그인">
							<img alt="회원가입" src="image/logBTN.png">
						</a>
						
						</td>					
					</tr>
						
					</table>
						<input type="hidden" value="2" name="auth">
					
					</form>


<script type="text/javascript">

$("#regiBTN").click(function() {
	if($("#_userid").val()==""){
		alert($("#_userid").attr("data-msg") +"입력해 주세요");
		$("#_userid").focus();
	}else if($("#_name").val() == ""){
		alert($("#_name").attr("data-msg") + " 입력해 주십시오");
		$("#_name").focus();
	} 
	else if($("#_email").val() == ""){
		alert($("#_email").attr("data-msg") + " 입력해 주십시오");
		$("#_email").focus();
	} 
	else if($("#_pwd").val() == ""){
		alert($("#_pwd").attr("data-msg") + " 입력해 주십시오");
		$("#_pwd").focus();
		
	}else{
		 
		$("#_regiForm").attr("action","regiAF.do").submit();
	} 
	
		
});
 
 
 
$("#_btnGetId").click(function() {
	var id = $("#c_id").val();
	if(id == ""){
		alert("아이디를 입력해 주십시오");
	}else{
		idCheckFunc(id);
	}	
});

$("#logBTN").click(function() {
	location.href="login.do"; 
});

function idCheckFunc(id) {
	//alert("idCheckFunc");
	
	$.ajax({
		
		type:"post",
		url:"checkID.do",
		async:true,
		data:"id=" + id,
		success:function(msg){
			alert("ajax success")
			idCheckMsg(msg);
		},
	 	error : function(){
            alert("ajax error");
        }


	});
}	
function idCheckMsg(msg) {
	
		if(msg.message == 'YES'){
			$("#_rgetid").html("사용할 수 없는 아이디");
			$("#_rgetid").css("background-color", "#ff0000");
			$("#_rgetid").val("");		
		}else{
			$("#_rgetid").html("사용가능 아이디");
			$("#_rgetid").css("background-color", "#0000ff");
			$("#_userid").val( $("#c_id").val() );		
		}		
	
	}
</script>



</body>
</html>