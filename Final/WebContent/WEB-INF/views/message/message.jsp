<%@page import="kh.com.a.model.MessageDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
List<MessageDto> mlist = (List<MessageDto>)request.getAttribute("mlist");
List<MessageDto> slist = (List<MessageDto>)request.getAttribute("slist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
div{
width: 100px;
height: 50px;
text-align: center;
display: inline;
cursor: pointer;
}

span{
text-align: center;
}

#receivebtn{
background-color: black;
}

#sendbtn{
background-color: white;
}

#rtext{
color: white;
text-align: center;
}

#stext{
color: black;
text-align: center;
}
</style>
</head>
<body>

<div id="receivebtn">
<span id="rtext">받은 편지함</span>
</div>
<div id="sendbtn" style="">
<span id="stext">보낸 편지함</span>
</div>

<table id="receive" border="2">
	<tr>
		<th>글번호</th><th>제목</th><th>보낸사람</th><th>작성일</th>
	</tr>
		<%
		if(mlist.size() != 0){
			for(int i=0; i<mlist.size();i++){
		%>
			<tr>
				<td><%=i+1 %></td><td><a href="./messagedetail.do?seq=<%=mlist.get(i).getSeq()%>"><%=mlist.get(i).getTitle() %></a></td><td><%=mlist.get(i).getSendid() %></td><td><%=mlist.get(i).getWdate().substring(0, 10) %></td>
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

<table id="send" border="2">
	<tr>
		<th>글번호</th><th>제목</th><th>받는사람</th><th>작성일</th>
	</tr>
	<%
		if(slist.size() != 0){
			for(int i=0; i<slist.size();i++){
		%>
			<tr>
				<td><%=i+1 %></td><td><a href="./messagedetail.do?seq=<%=slist.get(i).getSeq()%>"><%=slist.get(i).getTitle() %></a></td><td><%=slist.get(i).getReceiveid() %></td><td><%=slist.get(i).getWdate().substring(0, 10) %></td>
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

<script type="text/javascript">
$(document).ready(function(){
	$("#send").hide();
});

$("#receivebtn").click(function(){
	$("#receivebtn").css("background-color", "black");
	$("#rtext").css("color", "white");
	$("#sendbtn").css("background-color", "white");
	$("#stext").css("color", "black");
	$("#send").hide();
	$("#receive").show();
});

$("#sendbtn").click(function(){
	$("#sendbtn").css("background-color", "black");
	$("#stext").css("color", "white");
	$("#receivebtn").css("background-color", "white");
	$("#rtext").css("color", "black");
	$("#receive").hide();
	$("#send").show();
});

</script>

</body>
</html>