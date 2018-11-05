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
<style type="text/css">
.list_table{
   border : 2px solid #e6e6e6;
/*    width: 50%;	 */
   margin-left : auto;
   margin-right : auto;
   margin-top : 50px;
   margin-bottom : 50px;
/*    border: 1px solid pink; */ /* 지워주세요 */
   
}
/* .BTN{
 border:0;
} */
#_btnUpdate, #_btnDel, #_btnReply{
 	text-decoration :none;
    border: 1px solid #d5d5d5;
    color: #4b4b4b;
    font-size: 25px;
    height: 40px;
    letter-spacing: 2px;
    line-height: 25px;
    padding: 0 70px;
    font-family: 'Poppins', sans-serif;
    background: #fff;
    margin-top:  50px;
}
#_btnUpdate:hover,#_btnDel:hover ,#_btnReply:hover {
	 border: 1px solid #ff4136;
	 color: #fff;
	 background: #ff4136;
	 font-family: 'Poppins', sans-serif;
	
} 
.tbody tr th{
	padding: 15px;
	width: 40px;
	border-right:  2px solid #e6e6e6;
	border-bottom: 1px solid #e6e6e6;
}
.tbody tr td{
	padding: 15px;
	border-bottom: 1px solid #e6e6e6;
}
</style>
 </head>
<body>


 <div>
	<form name="frmForm" id="_frmForm" method="post" action="bbsupdate.do">
		<table class="table table-bordered" style="width:65%;margin: 30px auto">
			<input type="hidden" name="seq"   value="${qna.seq}"/>
			<colgroup>
			<col style="width:100px;" />
			<col style="width:auto;" />
			<col style="width:100px;" />
			<col style="width:100px;" />
			</colgroup>
			
			<tbody class="tbody">	
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
						${qna.content}
					</td>
				</tr>
				<tr> 
					<td colspan="2" style="height:50px; text-align:center;">
					
 					<!-- login id 와 해당 글 쓴 id 가 일치했을 때 뜸  -->
						<c:if test="${qna.id eq loginid}">
						<a href="#none" id="_btnUpdate" title="글수정하기">글 수정</a>
						<a href="#none" id="_btnDel" title="삭제하기">글 삭제</a>
						</c:if>
						<!-- 관리자가 로그인 했을 때 활성화 -->
						<c:choose>
						<c:when test="${auth==1 or auth==2 or auth==3 or auth==4 }">
						<a href="#none" id="_btnReply" title="답글달기">답변달기</a>
						</c:when> 
						</c:choose>
					
					</td>
				</tr>
			</tbody>
		</table>
 	</form>
 </div>

<script type="text/javascript">

$("#_btnUpdate").click(function() {	
/* 	alert('글수정하기');	 */	
	$("#_frmForm").attr({ "target":"_self", "action":"QnAUpdate.do" }).submit();
});
$("#_btnReply").click(function() {	
	/* alert('답글달기');	 */
	$("#_frmForm").attr({ "target":"_self", "action":"QnAreply.do" }).submit();
});
$("#_btnDel").click(function() {	
	alert('삭제하기');
	$("#_frmForm").attr({ "target":"_self", "action":"QnADelete.do" }).submit();
});


</script>









</body>
</html>