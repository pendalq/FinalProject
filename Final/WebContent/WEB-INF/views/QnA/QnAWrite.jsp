<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<form name="frmForm" id="_frmForm" method="post" action="bbswriteAf.do">

<table width="89%" class="list_table" style="width:85%;">
<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>


<%! String loginId; %>
<%

loginId =String.valueOf(request.getSession().getAttribute("loginID"));

%>


<tbody>	
	<tr class="id">
		<th>아이디</th>
		<td style="text-align: left">
			<input type="text" name="id" readonly="readonly" value=<%=loginId %> size="60"/>
		</td>
	</tr>
	<tr>
		<th>카테고리</th>
		<td>
			<select name="category">
				<option value="냉장고" selected="selected">냉장고</option>
				<option value="TV">TV</option>
				<option value="정수기">정수기</option>
				<option value="기타">기타</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>제목</th>
			<td style="text-align: left">
				<input type="text" name="title" size="60"/>
			</td>
	</tr>
	<tr>
		<th>내용</th>
		<td style="text-align: left"><textarea rows="10" cols="50" name='content' id="_content"></textarea>		</td>
	</tr>
	<tr>
		<td colspan="2" style="height:50px; text-align:center;">
			<p id="_btnLogin" title="글쓰기" href="#none"><span id="_btnLogin" title="글쓰기" href="#none"><a href="#none" id="_btnLogin" title="글쓰기">		
			  <img src="image/bwrite.png" alt="로그인" />
		    </a>
		    </span>
	    </p></td>
	</tr>
</tbody>

</table>

</form>

<script type="text/javascript">
$("#_btnLogin").click(function() {	
	alert('글작성');	
	$("#_frmForm").attr({ "target":"_self", "action":"QnAWriteAf.do" }).submit();	
});
</script>
