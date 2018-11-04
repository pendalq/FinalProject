<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/bootstrap.css">
</head>
<body>

<h3 style="position: relative;left:25px">쪽지 쓰기</h3>
<form name="frmForm" id="_frmForm" action="messagewriteAf.do" method="post">
	<table class="table table-bordered" style="margin: 5px auto">
		<tr>
			<th>아이디</th>
			<td style="text-align: left">${mdto.sendid }
			</td>
		</tr>
		<tr>
			<th>받는사람</th>
			<td style="text-align: left">${mdto.receiveid }
		</tr>
		<tr>
			<th>제목</th>
			<td style="text-align: left"><input type="text" id="title" name='title' size="35"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td style="text-align: left"><textarea id="content" name="content" style="height: 200px; width: 297px"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;">
	<a href="#none" id="_btnLogin" title="글쓰기" style="margin-right: 20px">쪽지보내기</a>
	<a href="message.do" style="margin-right: 20px">돌아가기</a>
		</tr>
	</table>
</form>

<script type="text/javascript">
$("#_btnLogin").click(function(){
	$("#_frmForm").submit();
});
</script>

</body>
</html>