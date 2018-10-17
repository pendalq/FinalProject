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


<table border="2">
	<tr>
		<th>글번호</th><th>제목</th><th>보낸사람</th><th>작성일</th>
	</tr>
		<%
		if(mlist.size() != 0){
			for(int i=0; i<mlist.size();i++){
		%>
			<tr>
				<td><%=i %></td><td><%=mlist.get(i).getTitle() %></td><td><%=mlist.get(i).getSendid() %></td><td><%=mlist.get(i).getWdate() %></td>
			</tr> 
		<%
			}
		}else{
		%>
			<tr>
				<td></td><td>쪽지가 없습니다.</td><td></td><td></td>
			</tr>
		<%
		}
	%>
	
</table>

</body>
</html>