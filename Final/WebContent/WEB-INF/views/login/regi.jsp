<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member.css">
	<link rel="stylesheet" type="text/css" href="member.css">

</head>
<body>  
	<div class="choiceRegiArea">
		<div class="CRtitle">
			<h1> 원하시는 회원을 선택해 주세요 </h1> 
		</div>
		<div class="CRhref">
		<!-- 	<div class="CRleft">
				<a href="regi.do?auth=1" ><div class="regi1"></div></a>
			</div>
			<div class="CRRight">
				<a href="regi.do?auth=2"><div class="regi2"></div></a>
	 		</div> -->
	 		<a href="regi.do?auth=1" ><div class="regi1"></div></a>
	 		<a href="regi.do?auth=2"><div class="regi2"></div></a>
	 		
	 	</div>
	</div>	
</body> 
</html>         