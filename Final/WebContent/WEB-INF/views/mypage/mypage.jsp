<%@page import="kh.com.a.model.RentalGoods"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="<%=request.getContextPath() %>/css/bootstrap.css">
<style type="text/css">
/* .mypageTable table{
	border: 0px; 
	margin-left : auto;
	margin-right : auto; 
	margin-bottom : 30px; 
	text-align: center;
	border-collapse:collapse;
	height : 150px;
	width : 500px;
}
.mypageTable table tr td{
	border: 1px solid #c7c7bc; 
	line-height: 2.5em;
	cursor: pointer;
	width : 200px;
	 
	
}
.trtag td a{
	display :block;
	height : 150px;
	width : 100%;
	text-align: center;
}

.trtag td a:hover{
background-color:  #dddddd;
}
  */
  
  table th, table td{
   text-align: center;
  }
  
  #myRental{
  width: 60%;
  margin-left: auto;
  margin-right: auto;
  }
</style>

</head>
<body>
 

<div class="mypageTable">
<h2>여기는_ 유저 _마이페이지</h2>
<table>
	<tr>
		<td>
			${sessionScope.loginID }님 환영합니다 <button type="button" class="memInfoUpdate">회원정보수정</button>
			
		</td>
	</tr>
	
</table>


<h2 style="text-align: center;">최근 렌탈 중인 상품 </h2>
<div id="myRental" style="border: 1px solid black; padding: 10px">
	<c:forEach begin="0" end="2" step="1" items="${srental3 }" var="myrental3" varStatus="vs">
				<c:if test = "${empty srental3 }">
						<span>렌탈 중인 상품이 없습니다</span>
				</c:if>
					
				<%-- 	${myrental3.seq }	 --%>
				<div class="myrental3" style="border: 1px solid black; width: 300px; height: 300px">
				<div style="width:300px; height:250px;">
					<a href='userRental.do?seq=${myrental3.seq }'> <!--gseq -->
						${myrental3.imagename }
					</a>
				</div>
				<div style="width:300px; height: 50px; border: 1px solid black;">
						${myrental3.title }
				</div>	
				</div>
				
	</c:forEach>
</div> 



<h2 style="text-align: center;">문의한 게시판</h2>
<!-- 리스트 -->

	<jsp:useBean id="ubbs" class="kh.com.a.arrow.BbsArrow" />

	<table class="table table-hover" style="width: 85%; margin-left: auto; margin-right: auto;">
		<colgroup>
			<col style="width: 70px;" />
			<col style="width: auto;" />
			<col style="width: 100px;" />
			<col style="width: 200px;" />
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
	<div id="paging_wrap" style="padding-bottom: 30px">
		<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
			<jsp:param value="${pageNumber }" name="pageNumber" />
			<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen" />
			<jsp:param value="${recordCountPerPage }" name="recordCountPerPage" />
			<jsp:param value="${totalRecordCount }" name="totalRecordCount" />
		</jsp:include>
	</div>

</div>

<script type="text/javascript">
$(".memInfoUpdate").click(function() {
	//alert("userInfoUpdate 함수 실행");
	location.href = "updateInfo.do";
	
});

$("#goQnADetail").click(function () {
	
	alert("QnADetail로 이동합니다");
	location.href = "QnADetail.do?seq="+$("#deseq").val();
	
});

/* $("#myqnalist").click(function() {
	//alert("userInfoUpdate 함수 실행");
	location.href = "updateInfo.do";
}); */


</script>

</body>
</html>