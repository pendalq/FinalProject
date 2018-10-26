<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
여기는 login.jsp

<form action="loginAF.do" name="loginForm" id="loginForm" method="post"> 

	<input type="login" name="id" id="id">
	<input type="password" name="pw" id="pw">

	<a href="#none" id="loginBTN"><img alt="로그인" src="img/logBTN.png"></a>
	<a href="#none" id="regiBTN" title="회원가입"><img alt="회원가입" src="img/regiBTN.png"></a>


</form>

<script type="text/javascript">
 $(document).ready(function(){
	
});  


$("#loginBTN").click(function() {
	if($("#id").val() == ""){
		alert("아이디를 입력해주세요");
		
	}else if($("#pw").val()==""){
		alert("비밀번호를 입력해주세요");
	}else{
		$("#loginForm").attr("target" ,"_self").submit();
	}

});

$("#regiBTN").click(function() { 
	alert("regiBTN");
	location.href = "choiceRegi.do";
});
</script>
 

</body>
</html>