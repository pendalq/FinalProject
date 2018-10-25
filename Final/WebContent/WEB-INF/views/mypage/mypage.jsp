<%@page import="kh.com.a.model.RentalGoods"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.mypageTable table{
	border: 0px; 
	margin-left : auto;
	margin-right : auto; 
	margin-bottom : 30px; 
	text-align: center;
	border-collapse:collapse;
	height : 150px;
	width : 500px;
}
.mypageTable table tr td{
	border: 1px solid #c7c7bc; 
	line-height: 2.5em;
	cursor: pointer;
	width : 200px;
	 
	
}
.trtag td a{
	display :block;
	height : 150px;
	width : 100%;
	text-align: center;
}

.trtag td a:hover{
background-color:  #dddddd;
}
 
</style>

</head>
<body>
 
<div class="mypageTable">
<h2>여기는_ 유저 _마이페이지</h2>
<table>
	
	
	
	<tr>
		<td>
			${sessionScope.loginID }님 환영합니다 <button type="button" class="memInfoUpdate">회원정보수정</button>
			 	
		</td>
	</tr>
	
</table>


<h2 style="text-align: center;">최근 렌탈 중인 상품 </h2>
<table class="retallist" > 
	
<%--  	
	<tr>
		<c:if test = "${empty rental3 }">
			렌탈 중인 상품이 없습니다 
		</c:if>	
	</tr> 
	
${myrental3.title }
			<a href="userRental.do">
				${myrental3.image }
 --%>
 	<tr class="trtag">
	<c:forEach begin="0" end="2" step="1" items="${rental3 }" var="myrental3" varStatus="vs">
				<c:if test = "${empty rental3 }">
					<td>
						렌탈 중인 상품이 없습니다
					</td>
				</c:if>
				<td>
					${myrental3.title }
					${myrental3.seq }		
						   <a href='userRental.do?seq=${myrental3.seq }'>
						${myrental3.image }
					</a>
				</td>		
	</c:forEach>
	</tr>		 

</table>

<h2 style="text-align: center;">문의한 게시판</h2>
<table class="qnalist">
	<tr>
		<th>번호</th>
		<th>category</th>
		<th>제목</th>
		<th>날짜</th>
	</tr>
	<tr>
		<td>
			<c:if test="${empty myqnalist }">
				등록한 문의가 없습니다
			</c:if>
		</td>
	</tr>
	<c:forEach items="${myqnalist }" var="myqna" varStatus="vs">
	<tr id="myqnalist">
		 
			<td>${myqna.seq }</td>
			<td>${myqna.category }</td>
			<td>${myqna.title }</td>
			<td>${myqna.wdate }</td>
	</tr>
	
	
	</c:forEach>
</table>
</div>

<script type="text/javascript">
$(".memInfoUpdate").click(function() {
	//alert("userInfoUpdate 함수 실행");
	location.href = "updateInfo.do";
});

/* $("#myqnalist").click(function() {
	//alert("userInfoUpdate 함수 실행");
	location.href = "updateInfo.do";
}); */


</script>

</body>
</html>