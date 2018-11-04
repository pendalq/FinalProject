<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
<style type="text/css">

.sellerTable{
	border: 0px; 
	margin-left : auto;
	margin-right : auto; 
	margin-bottom : 30px; 
	text-align: center;
	border-collapse:collapse;
	height : 150px;
	width : 800px;
}

.sellerTable table tr td{
	border: 1px solid #c7c7bc;
	text-align: center;
	line-height: 2.5em;
	cursor: pointer;
	width : 200px;	
} 

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 
<div class="sellerTable">
<h2>여기는_ seller _page</h2>
<br>
<table class="menu" border="1">
	<tr>
		<td colspan="2">
			${sessionScope.loginID }님 환영합니다 <button type="button" class="memInfoUpdate">회원정보수정</button>
			 	
		</td>
	</tr>
	<tr>
		<td><button type="button" id="sellerRegiGoods">렌탈상품등록하기</button></td>
		<td><button type="button" id="lentManage">대여관리</button></td>
	</tr>
</table>

<h2 style="text-align: center;">등록되어있는 렌탈 상품 </h2>

<table class="retalinglist" > 
 
	 	<tr>
	 	<c:forEach begin="0" end="2" step="1" items="${srental3 }" var="sellerRental3" varStatus="vs">
 			<c:if test="${empty srental3 }">	
 				<td>
					렌탈 중인 상품이 없습니다
				</td>
			</c:if>			 		
				<td>
				 <a href='sellerRental.do?seq=${sellerRental3.seq }'>
					${sellerRental3.imageName }
					${sellerRental3.title } 
				</a>	
				</td>		
		</c:forEach>
		</tr>
			 
	
	
</table>

<h2 style="text-align: center;">문의한 게시판</h2>

<!-- 리스트 -->

	<jsp:useBean id="ubbs" class="kh.com.a.arrow.BbsArrow" />

	<table class="list_table" style="width: 85%;">
		<colgroup>
			<col style="width: 70px;" />
			<col style="width: auto;" />
			<col style="width: 100px;" />
			<col style="width: 100px;" />
			<col style="width: 100px;" />
		</colgroup>

		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성날짜</th>
				<th>조회수</th>
			</tr>
		</thead>

		<tbody>
			<c:if test="${empty myqnalist}">
				<tr>
					<td colspan="3">작성된 글이 없습니다.</td>
				</tr>
			</c:if>

			<c:forEach items="${myqnalist}" var="myqnalist" varStatus="vs">
				<jsp:setProperty property="dept" name="ubbs" value="${myqnalist.dept}" />
								
				<tr class="_hover_tr">
					<td>${vs.count}</td>

					<td style="text-align: left">
					<jsp:getProperty property="arrow" name="ubbs" /> 
						<c:if test="${myqnalist.del == 0 }">
							<a href='QnADetail.do?seq=${myqnalist.seq}'> ${myqnalist.title} </a>
						</c:if> 
						<c:if test="${myqnalist.del == 1 }">
								이 글은 작성자에 의해서 삭제 되었습니다
									
						</c:if></td>

					<td>${myqnalist.id}</td>
					<td>${myqnalist.wdate }</td>
					<td>${myqnalist.readcount }</td>
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
</div>

<script type="text/javascript">


function goPage(pageNumber) {
	$("#_pageNumber").val(pageNumber);
	$("#_frmFormSearch").attr("target", "_self").attr("action",
			"QnAlist.do").submit();
}


$(".memInfoUpdate").click(function() {
	//alert("userInfoUpdate 함수 실행");
	location.href = "updateInfo.do";
});

$("#lentManage").click(function() {
	alert("lentManage 함수 실행");
	location.href = "lentManage.do";
});



$("#sellerRegiGoods").click(function() {
	alert("sellerRegiGoods 함수 실행");
	location.href = "goodswrite.do";
});

$("#goQnADetail").click(function () {
	
	alert("QnADetail로 이동합니다");
	location.href = "QnADetail.do?seq="+$("#deseq").val();
	
});

</script>

</body>
</html>