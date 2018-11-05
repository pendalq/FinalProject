<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member.css">
	<link rel="stylesheet" type="text/css" href="member.css">
	
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">	
	<style type="text/css">
.CRtitle , .CRhref {
	position :relative;
	width: 70%;
	margin-left: auto;
	margin-right: auto;

}

.choiceRegiArea{
	width: 100%;
}
	
	
	
	
	</style>
</head>

<body>  
	<div class="choiceRegiArea">
		<div class="CRtitle">
			<h1 style="font-family: 'Noto Sans KR', sans-serif; text-align: center; width: 700px;"> 원하시는 회원을 선택해 주세요 </h1> 
		</div>
		<div class="CRhref">
	 		<a href="regi.do?auth=1" ><div class="regi1"></div></a>
	 		<a href="regi.do?auth=3"><div class="regi2"></div></a>
	 	</div>
	</div>	
</body> 
</html>         