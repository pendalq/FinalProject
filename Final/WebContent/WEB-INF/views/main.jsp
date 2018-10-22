<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<fmt:requestEncoding value="utf-8"/> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <!DOCTYPE html>
<html>
<head>
  

<meta charset="UTF-8">
<title>Insert title here</title>
</head> 
<body> -->

<div>
	<c:if test="${empty loginID }">
			<input type="button" value="로그인하기" id="dologin">
	</c:if>
	
	<c:if test="${loginAuth eq '1' }">
		<input type="button" value="마이페이지이동" id="authpage">
		<input type="button" value="로그아웃" id="logout">		
	</c:if>
	
	
	<c:if test="${loginAuth eq '2' }">
		<input type="button" value="셀러페이지이동" id="authpage">		
		<input type="button" value="로그아웃" id="logout">
	</c:if>
</div>


<script type="text/javascript">
$("#dologin").click(function() {
	location.href="login.do"
});

 
$("#authpage").click(function() {
	//location.href="mypage.do"; 
	location.href="authpage.do"; 
	
});

$("#logout").click(function() {
	location.href="logout.do"
	
});



</script>
<!-- 
</body>
</html> -->