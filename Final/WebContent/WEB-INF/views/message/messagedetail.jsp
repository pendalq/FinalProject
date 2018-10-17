<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table border="2">
		<tr>
			<th>보낸사람</th>
			<td style="text-align: left"><input type="text" id='id' name='sendid' readonly="readonly" value="${mdto.sendid} " size="50"/>
			</td>
		</tr>
		<tr>
			<th>받는사람</th>
			<td style="text-align: left"><input type="text" id='id' name='receiveid' readonly="readonly" value="${mdto.receiveid }" size="50"/>
		</tr>
		<tr>
			<th>제목</th>
			<td style="text-align: left"><input type="text" id="title" name='title' readonly="readonly" size="50"/ value="${mdto.title }"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td style="text-align: left"><textarea id="content" name="content" style="height: 600px; width: 800px" readonly="readonly" value="${mdto.content }"></textarea></td>
		</tr>
	</table>

</body>
</html>