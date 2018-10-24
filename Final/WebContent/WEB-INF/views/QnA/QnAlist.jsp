<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div>
	<form name="frmForm1" id="_frmFormSearch" method="get"
		action="QnAlist.do">
		<table>
			<tr>
				<td>검색 :</td>
				<td><select id="_s_category" name="s_category">
						<option value="" selected="selected">선택</option>
						<option value="category">카테고리</option>
						<option value="title">제목</option>
						<option value="contents">내용</option>
				</select></td>
				<td><input type="text" id="_s_keyword" name="s_keyword"
					value="" /></td>
				<td><span>
						<button type="button" id="_btnSearch">검색</button>
				</span></td>
			</tr>
		</table>

		<input type="hidden" name="pageNumber" id="_pageNumber"
			value="${(empty pageNumber)?0:pageNumber}" /> <input type="hidden"
			name="recordCountPerPage" id="_recordCountPerPage"
			value="${(empty recordCountPerPage)?10:recordCountPerPage}" />

	</form>
	</div>
	<!-- 검색 view 끝 -->

	<!-- 리스트 -->

	<jsp:useBean id="ubbs" class="kh.com.a.arrow.BbsArrow" />

	<table class="list_table" style="width: 85%;">
		<colgroup>
			<col style="width: 70px;" />
			<col style="width: auto;" />
			<col style="width: 100px;" />
		</colgroup>

		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
			</tr>
		</thead>

		<tbody>
			<c:if test="${empty QnAlist}">
				<tr>
					<td colspan="3">작성된 글이 없습니다.</td>
				</tr>
			</c:if>

			<c:forEach items="${QnAlist}" var="qna" varStatus="vs">
				<jsp:setProperty property="dept" name="ubbs" value="${qna.dept}" />
								
				<tr class="_hover_tr">
					<td>${vs.count}</td>

					<td style="text-align: left">
					<jsp:getProperty property="arrow" name="ubbs" /> 
						<c:if test="${qna.del == 0 }">
							<a href='QnADetail.do?seq=${qna.seq}'> ${qna.title} </a>
						</c:if> 
						<c:if test="${qna.del == 1 }">
								이 글은 작성자에 의해서 삭제 되었습니다
									
						</c:if></td>

					<td>${qna.id}</td>
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

	<!--  -->

	<div id="buttons_wrap">
		<span class="button blue">
			<button type="button" id="_btnAdd">글쓰기</button>
		</span>
	</div>

	<script type="text/javascript">
		
		$(document).ready(function() {
			$("._hover_tr").mouseover(function() {
				$(this).children().css("background-color", "#F0F5FF");
			}).mouseout(function() {
				$(this).children().css("background-color", "#FFFFFF");
			});
		});
		$("#_btnAdd").click(function() {
			alert('글쓰기');
			//$("#_frmForm").attr({ "target":"_self", "action":"bbswrite.do" }).submit();
			location.href = "QnAWrite.do";
		});
		$("#_btnSearch").click(function() {
			//alert('search');						
			$("#_frmFormSearch").attr({
				"target" : "_self",
				"action" : "QnAlist.do"
			}).submit();

		});
		
		function goPage(pageNumber) {
			$("#_pageNumber").val(pageNumber);
			$("#_frmFormSearch").attr("target", "_self").attr("action",
					"QnAlist.do").submit();
		}
	</script>





</body>
</html>