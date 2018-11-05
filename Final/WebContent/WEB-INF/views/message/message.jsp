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
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/bootstrap.css">
<style>
div{
text-align: center;
margin-left:auto;
margin-right:auto;
margin-bottom: 20px;
margin-top: 20px;
}

span{
cursor: pointer;
}

#receivebtn{
width: 20%;
height: 50px;
background-color: black;
color: white;
text-align: center;
}

#sendbtn{
width: 20%;
height: 50px;
background-color: white;
color: black;
text-align: center;
}

</style>
</head>
<body>
<div>
<span id="receivebtn">받은 편지함</span>
<span id="sendbtn">보낸 편지함</span>
</div>
<form action="rdel.do" id="rdelForm" method="post">
<table class="table table-hover" id="receive" >

	
	<thead>
		<th><input type="checkbox" name="rall" id="rallcheck"></th><th>글번호</th><th>제목</th><th>보낸사람</th><th>작성일</th>
	</thead>
	
	
		<%
		if(mlist.size() != 0){
			for(int i=0; i<mlist.size();i++){
				int mNum = 1;
				if(mlist.get(i).getRdel() == 1){
					continue;
				}
				mNum++;
		%>
			<tbody>
				<td><input type="checkbox" name="rcheck" class="rcheck" value="<%=mlist.get(i).getSeq()%>"><td><%=mNum %></td><td><a href="./messagedetail.do?seq=<%=mlist.get(i).getSeq()%>"><%=mlist.get(i).getTitle() %></a></td><td><%=mlist.get(i).getSendid() %></td><td><%=mlist.get(i).getWdate().substring(0, 10) %></td>
			</tbody>
		<%
				
			}
		}else{
		%>
			<tbody>
				<td colspan="5">쪽지가 없습니다.</td>
			</tbody>
		<%
		}
	%>
	
	
</table>
</form>

<form action="sdel.do" id="sdelForm" method="post">
<table class="table table-hover" id="send">
	<thead>
		<th><input type="checkbox" name="sall" id="sallcheck"></th><th>글번호</th><th>제목</th><th>받는사람</th><th>작성일</th>
	</thead>
	<%
		if(slist.size() != 0){
			for(int i=0; i<slist.size();i++){
				int mNum = 1;
				if(slist.get(i).getSdel() == 1){
					continue;
				}
				mNum++;
		%>
			<tbody>
				<td><input type="checkbox" name="scheck" class="scheck" value="<%=slist.get(i).getSeq()%>"></td><td><%=mNum %></td><td><a href="./messagedetail.do?seq=<%=slist.get(i).getSeq()%>"><%=slist.get(i).getTitle() %></a></td><td><%=slist.get(i).getReceiveid() %></td><td><%=slist.get(i).getWdate().substring(0, 10) %></td>

			</tbody> 
		<%
			
			}
		}else{
		%>
			<tbody>
				<td colspan="5">쪽지가 없습니다.</td>
			</tbody>
		<%
		}
	%>
</table>
</form>

<button id="rdel">선택삭제</button>
<button id="sdel">선택삭제</button>


<script type="text/javascript">
$(document).ready(function(){
	$("#send").hide();
	$("#sdel").hide();
});

$("#receivebtn").click(function(){
	$("#receivebtn").css("background-color", "black");
	$("#receivebtn").css("color", "white");
	$("#sendbtn").css("background-color", "white");
	$("#sendbtn").css("color", "black");
	$("#send").hide();
	$("#sdel").hide();
	$("#receive").show();
	$("#rdel").show();
});

$("#sendbtn").click(function(){
	$("#sendbtn").css("background-color", "black");
	$("#sendbtn").css("color", "white");
	$("#receivebtn").css("background-color", "white");
	$("#receivebtn").css("color", "black");
	$("#receive").hide();
	$("#rdel").hide();
	$("#send").show();
	$("#sdel").show();
});

$("#rallcheck").click(function(){
	$(".rcheck").prop('checked', this.checked);
});

$("#sallcheck").click(function(){
	$(".scheck").prop("checked", this.checked);
});

$("#rdel").click(function(){
	$("#rdelForm").submit();
});

$("#sdel").click(function(){
	$("#sdelForm").submit();
});
</script>

</body>
</html>