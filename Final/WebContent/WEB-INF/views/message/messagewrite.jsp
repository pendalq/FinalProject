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
</head>
<body>
<form name="frmForm" id="_frmForm" action="messagewriteAf.do" method="post">
	<table border="2">
		<tr>
			<th>아이디</th>
			<td style="text-align: left"><input type="text" id='id' name='sendid' readonly="readonly" value="${mdto.sendid }" size="50"/>
			</td>
		</tr>
		<tr>
			<th>받는사람</th>
			<td style="text-align: left"><input type="text" id='id' name='receiveid' readonly="readonly" value="${mdto.receiveid }" size="50"/>
		</tr>
		<tr>
			<th>제목</th>
			<td style="text-align: left"><input type="text" id="title" name='title' size="50"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td style="text-align: left"><textarea id="content" name="content" style="height: 600px; width: 800px"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" style="height:50px; text-align:center;">
	<span><a href="#none" id="_btnLogin" title="글쓰기"><img src="image/bwrite.png" alt="로그인" /></a></span>
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