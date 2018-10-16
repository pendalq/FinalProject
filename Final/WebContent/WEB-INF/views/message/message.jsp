<%@page import="kh.com.a.model.MessageDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
List<MessageDto> mlist = (List<MessageDto>)request.getAttribute("mlist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table>
	<tr>
		<th>글번호</th><th>제목</th><th>보낸사람</th><th>작성일</th>
		<%
			for(int i=0; i<mlist.size();i++){
		%>
				<td>i</td><td>${mlist.title }</td><td>${mlist.recieveid }</td><td>${mlist.wdate }</td> 
		<%
			}
		%>
	</tr>
</table>

</body>
</html>