<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>

<%
String sessionId = (String)session.getAttribute("id");
String sessionIdFalse = "fasle";
%>

	<c:set var="sessionId" value="<%=sessionId%>"></c:set>
	<c:set var="sessionIdFalse" value="<%=sessionIdFalse%>"></c:set>
	<c:out value="${sessionId }"></c:out>
	<c:out value="${sessionIdFalse }"></c:out>

	<%-- <span>2 확인 : ${reviewList.getId() }</span> --%>
	<div id="review_container">
		<span class="review_count">리뷰 총 개수 : ${totalRecordCount}</span>
		<span class="review_likedAvg">리뷰 총 평점 평균 : ${likedAvg }</span>
		<ul id="review_box">
	
		<c:if test="${totalRecordCount == 0}">
		<h2>등록된 후기가 없습니다.</h2>
		</c:if>
		<c:forEach items="${reviewList}" var="review" varStatus="vs">
			<li class="review_item">
				<div class="review_item_header">
					<span class="review_seq"> 리뷰 넘버 : ${review.seq}</span>
					<span class="review_title">리뷰 타이틀 : ${review.title}</span>
					<span class="review_liked">리뷰 평점 : ${review.liked}</span>
					<span class="review_liked">리뷰 상품 번호 : ${review.gseq}</span>
					<%-- <span class="review_liked">리뷰 상품 이름 : ${review.goodsName}</span> --%>
				</div>
				<div class="review_item_main">
					<span class="review_content">리뷰 콘텐츠 : ${review.content}</span>
					<span class="review_id">리뷰 작성자 : ${review.id}</span>
					<span class="review_wdate"> 리뷰 작성일 : ${review.wdate }</span>
				</div>
			<c:if test="${sessionId == review.id }">
				<div class="review_item_footer">
					<form id="reviewForm" action="" method="post">
					<input type="hidden" name="seq" value="${review.seq }">
					<input type="hidden" name="gseq" value="${review.gseq }">
					<input type="hidden" name="searchNum" id="_searchNum" value="${searchNum}">
					<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber}" />
					<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage"value="${(empty recordCountPerPage)?10:recordCountPerPage}" />
					</form>
					<button type="button" class="btn_review" value="update">수정하기</button>
					<button type="button" class="btn_review" value="delete">삭제하기</button>
				</div>
			</c:if>
			</li>
		</c:forEach>
		
		</ul>
		<!---------------------------------------------페이징--------------------------------------------->
					<div id="paging_wrap">
						<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
							<jsp:param value="${pageNumber}" name="pageNumber" />
							<jsp:param value="${pageCountPerScreen}" name="pageCountPerScreen" />
							<jsp:param value="${recordCountPerPage}" name="recordCountPerPage" />
							<jsp:param value="${totalRecordCount}" name="totalRecordCount" />
						</jsp:include>
					</div>
	</div>



	
	<button type="button" id="btn_reviewWrite">글쓰기</button>

	<script>
	function goPage(pageNumber) {
		$("#_pageNumber").val(pageNumber);
		/* alert('페이징'); */
		$("#reviewForm").attr("target", "_self").attr("action",
			"reviewList.do").submit();
	}


		$("#btn_reviewWrite").click(function() {
			/* alert('글쓰기'); */
			//$("#_frmForm").attr({ "target":"_self", "action":"bbswrite.do" }).submit();
			location.href = "reviewWrite.do?goodsSeq=70&goodsName=상품명입니다.";
		});
		
		$(".btn_review").click(function() {
			if ($(this).val() == "update") {
				/* alert("수정하기"); */
				$("#reviewForm").attr({ "target":"_self", "action":"reviewUpdate.do" }).submit();
			}else if($(this).val() == "delete"){
				/* alert("삭제하기"); */
				$("#reviewForm").attr({ "target":"_self", "action":"reviewDelete.do" }).submit();
			}else{
				alert("수정/삭제 오류");
				return false;
			}
		});
	</script>
</body>
</html>