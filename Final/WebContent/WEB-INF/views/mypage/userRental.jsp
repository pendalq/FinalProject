<%@page import="kh.com.a.model.RentalGoods"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.retalInfo{
	margin-left : auto;
	margin-right : auto;
	width: 50%
}

.retalInfo td{
	border: 1px solid #c7c7bc;  
	margin-bottom : 30px; 
	text-align: center;
	border-collapse:collapse;
}

.retalInfo th{
	border: 1px solid #c7c7bc;  
	text-align: center;
	border-collapse:collapse;
}



</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%!

 
%>

<%
RentalGoods rdto = (RentalGoods)request.getAttribute("rDetail");


%>

렌탈 정보
<table class="retalInfo">
	<colgroup>
		<col>
		<col>
		<col>
		<col>
		<col>
		<col>
		<col>
		<col>
		<col>
	</colgroup>
      <tr>
         <td rowspan="5" colspan="2" width="200px" height="300px"> <%=rdto.getImagename() %> </td>
         <th>상품 글 제목</th>
         <td colspan="2"><%=rdto.getTitle() %></td>
      </tr>
      <tr>
      	<th>브랜드 명</th>
        <td colspan="2"><%=rdto.getBrand() %></td>
      </tr>
      <tr>
         <th>옵션</th>
         <td colspan="2"><%=rdto.getOptions() %></td>
      </tr>
      <tr>
         <th>대여기간</th>
         <td><%=rdto.getSdate() %> ~ <%=rdto.getRe_turn() %> </td>
         <td><%=rdto.getTerm() %>개월</td>
      </tr>
      <tr>
         <th>잔여기간</th>
         <td><%=rdto.getReturndday() %></td>
         <td>일</td>
      </tr>
    
    <tr><td colspan="5" style="height: 200px">비어있는공간</td></tr>
	<tr><td colspan="5"><button type="button" onclick="extension()">기간연장</button></td></tr>
	<tr><td colspan="5"><button type="button" onclick="writeReview()">후기작성</button></td></tr>
	<tr><td colspan="5"><button type="button" onclick="gomypage()">마이페이지로</button></td></tr>
</table>

 
<script type="text/javascript">
function extension() {
	alert("extension버튼 클릭");
}

function writeReview() {
	alert("writeReview버튼 클릭");
}

function gomypage() {
	location.href="mypage.do";
}

</script>
</body>
</html>