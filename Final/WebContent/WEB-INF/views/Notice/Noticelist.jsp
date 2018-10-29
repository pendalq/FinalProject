
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL : JSP Standard Tag Library -> java를 쉽게 태그로 만들어 놓은 것 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<title>공지사항 리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


</head>
<body>

	<table border="1px">
		<colgroup>
			<col width="122" />
			<col width="592" />
			<col width="106" />
			<col width="117" />
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성날짜</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty noticelist}">
				<tr>
					<td colspan="4">작성된 글이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach items="${noticelist}" var="list" varStatus="vs">
				<tr>
					<td>${list.seq}</td>
					<c:if test="${list.del == 0 }">
						<td><a href="view.do?seq=${list.seq}"> ${list.title} </a></td>
					</c:if>
					<c:if test="${list.del == 1 }">
						<td colspan="4">해당글을 삭제되었습니다</td>
					</c:if>
					<td>${list.wdate }</td>
					<td>${list.readCount }</td>
				</tr>
			</c:forEach>

		</tbody>

	</table>
	<!-- 페이징 처리 -->
	<div id="paging_wrap">
		<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
			<jsp:param value="${pageNumber }" name="pageNumber" />
			<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen" />
			<jsp:param value="${recordCountPerPage }" name="recordCountPerPage" />
			<jsp:param value="${totalRecordCount }" name="totalRecordCount" />
		</jsp:include>
	</div>

	<!-- 페이징 끝 -->

	<%!
	String auth;
	int iauth;
	%>
	<%
	
	 	//auth = String.valueOf(request.getSession().getAttribute("loginAuth"));
		auth = (request.getSession().getAttribute("loginAuth")==null? "a" : String.valueOf(request.getSession().getAttribute("loginAuth")));
			if(auth != "a"){
				 iauth = Integer.valueOf(auth);
			 }
	
	%>
	<% if(auth != null && iauth == 4){ %>

	<div id="buttons_wrap">
		<span class="button blue">
			<button type="button" id="_btnAdd">글쓰기</button>
		</span>
	</div>
	<%} %>


	<script type="text/javascript">
		$("#_btnAdd").click(function() {
			alert('글쓰기');
			//$("#_frmForm").attr({ "target":"_self", "action":"bbswrite.do" }).submit();
			location.href = "write.do";
		});
		function goPage(pageNumber) {
			$("#_pageNumber").val(pageNumber);
			$("#_frmFormSearch").attr("target", "_self").attr("action",
					"Noticelist.do").submit();
		}
	</script>

</body>
</html>