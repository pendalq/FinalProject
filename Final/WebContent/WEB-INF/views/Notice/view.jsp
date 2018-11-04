<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>공지 보기</title>
<script type="text/javascript">
	$(function() {
		// 이벤트 처리
		$("#deleteBtn").on("click", function() {
			// 		alert("delete");
			if (!confirm("정말 삭제하시겠습니까?"))
				// a tag로 이도하는 것을 무시 시킨다.
				return false;
		});

		// 수정 처리된 후 경고 메시지 
		// NoticeController.update()에서 처리가 완료된 후 RedirectAttributes에
		// addFlashAttribute()를 이용해서 "UPDATED" 라고 담아 두면 한번 사용하고 없어진다.
		<c:if test="${msg == 'UPDATED'}">
		alert("공지 수정이 완료되었습니다.");
		</c:if>
	});
	
</script>
</head>
<body>
	<h1>공지 보기</h1>
	<form id="update-Form" action="update.do">
		<table class="table table-bordered" style="width: 65%; margin: 20px auto">
			<tbody>
				<tr>
					<th>공지 번호</th>
					<td>${dto.seq }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${dto.title }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${dto.content }</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${dto.wdate }</td>
				</tr>

				<tr>
					<th>조회수</th>
					<td>${dto.readCount }</td>
				</tr>
			</tbody>
			<tfoot>

				<tr>
					<!-- 	위의 내용이 한중에 2칸을 사용하고 있기 때문에 2칸을 한 칸으로 합쳐야 한다. -> colspan -->
					<td colspan="2">
					<%!
							String auth;
							int iauth;
					%>
					<%
						auth = (request.getSession().getAttribute("loginAuth")==null? "a" : String.valueOf(request.getSession().getAttribute("loginAuth")));
						if(auth != "a"){
							 iauth = Integer.valueOf(auth);
						 }
					%>
					<% if(auth != null && iauth == 4){ %>
			<a href="update.do?seq=${dto.seq }" class="btn btn-default" id="updateBtn">수정하기</a> 
			<a href="delete.do?seq=${dto.seq }" class="btn btn-default"
			id="deleteBtn">삭제</a>
					<%} %>
			<a href="Noticelist.do" class="btn btn-default">리스트</a>
		</td>
	</tr>
</tfoot> 
</table>
</form>

</body>
</html>