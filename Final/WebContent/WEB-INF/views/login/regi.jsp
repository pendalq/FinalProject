<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member.css">
	<link rel="stylesheet" type="text/css" href="member.css">
<style type="text/css">
h1 {
	font: 400 0.875rem/1.5 "Open Sans", sans-serif;
}

</style>

</head>
<body>  
<div class="choiceRegiArea">
	<div>
		<h1> 원하시는 회원을 선택해 주세요 </h1> 
	</div>
	 
		<a href="regi.do?auth=1"><div class="regi1"></div>회원가입</a>
		
		<a href="regi.do?auth=2"><div class="regi2"></div>회원가입2</a>
		
		<%-- <a href="regi.do?auth=2"><img src="<%=request.getContextPath()%>/WEB-INF/views/login/regi2.png" alt="판매자 회원가입">테스트a</a> --%>
	 
</div>	
</body> 
</html>         