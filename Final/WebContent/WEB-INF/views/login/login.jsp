<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  

<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
 
.titleArea{
	margin: 0px auto 50px; 
	width: 100%;
    text-align: center;
    margin-top: 40px;
	margin-bottom: 50px;
	background-color: #e6e6e6;
}
.loginForm{
	margin: 0px auto 50px;
	width: 100%;
    text-align: center;
   
}
.loginAllArea{
  
  color: #606468;
  font: 400 0.875rem/1.5 "Open Sans", sans-serif;
  margin-left : 30%;
  margin-right : 30%;
  height: 60%;
  /* min-height: 100%; */
  margin-top: 50px;
}

input[type="text"],input[type="password"]{

  width: 180px;
  height : 35px;
  border: 1px solid #d5d5d5;
  margin: 5px;
}
/*
.fa-user:before {
	 background-image: url("WEB-INF/views/login/loginID.png"); 
	background-image: url("loginID.png");
}
.fa-lock:before{
	
	background-image: url("/WEB-INF/views/login/loginpw.png");
}
 */
.loginbd a{
	text-decoration :none;
	/* background: transparent none repeat scroll 0 0; */
    border: 1px solid #d5d5d5;
    color: #4b4b4b;
    font-size: 20px;
    height: 45px;
    letter-spacing: 2px;
    line-height: 45px;
    padding: 0 70px;
    font-family: 'Poppins', sans-serif;
    margin-top: 40px;
}
.loginbd a:hover{
    border: 1px solid #ff4136;
    color: #fff;
    background: #ff4136;
	font-family: 'Poppins', sans-serif;
}
h2{
	font-size: 36px;
	
}
h3{
	font-size: 20px;
}

.pwicon{
 position: absolute;
  top: 50%;
  margin-left: 17px;
  margin-top: 17px;
  z-index: 1;
  color: #4f5b66;
 
}

</style>

</style>
</head>
<body>
<div class="loginbd">
	<div class="loginAllArea">
		<div class="titleArea">
			<h2>LOGIN</h2>
		</div>
		<div class="loginFormWrap">	
			<div class="loginForm">
				<h3 style="margin: 6px">Member Login</h3>
				<form action="loginAF.do" name="loginForm" id="loginForm" method="post"> 
					<div class="logLeft">
						<div class="inputtag" style="height: 80px; ">
							<div class="fa-user">
								<span class="usericon"></span>
								<input type="text" name="id" id="id" placeholder="아이디"><br>
								
							</div>
							<div class="fa-pw">
								<span class="pwicon"><img scr="<%=request.getContextPath()%>/views/login/loginpw.png"></span>
								<input type="password" name="pw" id="pw" placeholder="비밀번호"> <!-- style="border-bottom: 30px;" -->
								
							</div>
						</div>	
					<br>
						<div class="loginbtn" style="height: 80px">
							<a href="#none" id="loginBTN">LOGIN</a>							
							<a href="#none" id="regiBTN" title="회원가입">JOIN</a>
						
						</div>
					
				
				</form>
			</div>
		</div>	
	</div>
</div>

</form>

<script type="text/javascript">

$("#loginBTN").click(function() {
	if($("#id").val() == ""){
		alert("아이디 입력해주세요");
		
	}else if($("#pw").val()==""){
		alert("비번 입력해주세요");
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