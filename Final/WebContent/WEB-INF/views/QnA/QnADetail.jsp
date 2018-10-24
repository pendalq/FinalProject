<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnAdetail</title>
</head>
<body>

<form name="frmForm" id="_frmForm" method="post" action="bbsupdate.do">

<table class="list_table" style="width:85%;">

<input type="hidden" name="seq"   value="${qna.seq}"/>
<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>

<tbody>	
	<tr class="id">
		<th>아이디</th>
		<td style="text-align: left" >${qna.id}</td>
	</tr>
	<tr>
		<th>카테고리</th>
		<td style="text-align: left">${qna.category }</td>
	
	</tr>
	<tr>
		<th>제목</th>
		<td style="text-align: left">${qna.title}</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td style="text-align: left">${qna.wdate}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td style="text-align: left">
		<textarea rows="10" cols="50" name='content' id="_content">${qna.content}</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" style="height:50px; text-align:center;">
		<span>
			<c:if test="${qna.id eq login.id}">
			<a href="#none" id="_btnUpdate" title="글수정하기"><img src="image/bupdate.png" alt="수정하기" /></a>
			<a href="#none" id="_btnDel" title="삭제하기"><img src="image/del.png" alt="삭제하기" /></a>
			</c:if>
			<!-- 관리자가 로그인 했을 때 활성화 -->
			<a href="#none" id="_btnReply" title="답글달기"><img src="image/breply.png" alt="답글달기" /></a>
		</span>
		</td>
	</tr>
</tbody>
</table>

</form>


<script type="text/javascript">

$("#_btnUpdate").click(function() {	
	alert('글수정하기');		
	$("#_frmForm").attr({ "target":"_self", "action":"QnAUpdate.do" }).submit();
});
$("#_btnReply").click(function() {	
	alert('답글달기');	
	$("#_frmForm").attr({ "target":"_self", "action":"QnAreply.do" }).submit();
});
$("#_btnDel").click(function() {	
	alert('삭제하기');
	$("#_frmForm").attr({ "target":"_self", "action":"QnADelete.do" }).submit();
});


</script>









</body>
</html>