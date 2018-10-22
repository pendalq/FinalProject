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

메인이다 

<input type="button" value="마이페이지이동" id="gomypage">

<script type="text/javascript">
$("#gomypage").click(function() {
	//location.href="mypage.do"; 
	location.href="authpage.do"; 
	
});
</script>


</body>
</html>