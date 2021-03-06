<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>


<h1 style="position: relative;left:275px">문의글</h1>

<table class="table table-bordered" style="width:65%;margin: 30px auto">
<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>

<tbody>	

<tr class="id">
	<th>아이디</th>
	<td style="text-align: left">${qna.id}</td>
</tr>
<tr>
	<th>제목</th>
	<td style="text-align: left">
		${qna.title}
	</td>
</tr>
<tr>
	<th>작성일</th>
	<td style="text-align: left">${qna.wdate}</td>
</tr>
<tr>
	<th>내용</th>
	<td style="text-align: left">${qna.content}</td>
</tr>
</tbody>

</table>

<hr/>
<h1 style="position: relative;left:275px">답글</h1>

<form name="frmForm" id="_frmForm" method="post" action="bbsreplyAf.do">
<input type="hidden" name="seq"   value="${qna.seq}"/>
<input type="hidden" name="category" value="${qna.category }">
<table class="table table-bordered" style="width:65%;margin: 30px auto">
<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>

<tbody>	

<tr class="id">
	<th>아이디</th>
	<td style="text-align: left"><input type="text" name="id" readonly="readonly" 
	value='${loginId}' size="60"/></td>
</tr>
<tr>
	<th>제목</th>
	<td style="text-align: left"><input type="text" name="title" size="60"/></td>
</tr>
<tr>
	<th>내용</th>
	<td style="text-align: left">
		<textarea rows="10" cols="50" name='content' id="_content"></textarea>
	</td>
</tr>
<tr>
<td colspan="2" style="height:50px; text-align:center;">
	<span>
	<a href="#none" id="_btnReply" title="답글달기"><img src="image/breply.png" alt="답글달기" /></a>
	</span>
</td>
</tr>

</tbody>

</table>
</form>

<script type="text/javascript">
$("#_btnReply").click(function() {	
	alert('답글달기');	
	$("#_frmForm").attr({ "target":"_self", "action":"QnAreplyAf.do" }).submit();
});
</script>