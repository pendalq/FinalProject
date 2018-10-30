<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>    

<!DOCTYPE html>
<html>
<head>

<style type="text/css">

.lentManage table{
	border: 1px solid black;
/* 	width: 100%; */
}

.lentManage table tr td{
	border: 1px solid black;
	 
}
 
</style>

<meta charset="UTF-8">
<title>lentManage view</title>
</head>
<body>

 
<h1>대여자가 렌탈 신청을 한 뒤 판매자에게 보이는 '대여관리 창'</h1>
<div class="lentManage">
<table>
 <colgroup>
	<col style="width: 100px;"/>
	<col style="width: 100px;"/>
	<col style="width: 100px;"/>
	<col style="width: 100px;"/>
	<col style="width: 100px;"/>
	<col style="width: 100px;"/>
</colgroup>  
	<tr>
		<th>주문 번호</th>
		<th>대여자 아이디</th>
		<th>대여자상품</th>
	    <th>대여 접수일</th>
	    <th>대여 상태</th>
		<th>기타</th>
   </tr>
	  
<!--   {empty manageRentalList} -->
  
  	<c:forEach begin="0" step="1" items="${manageRentalList }" var="manageList" varStatus="vs">
  		<tr>
  		<%-- <c:if test="${empty manageList}">
  			<td colspan="6">대여된 상품이 없습니다</td>
  		</c:if> --%>
  		
	  		<td>${manageList.seq }</td>
  			<td><a href="#">${manageList.id }</a></td>
  			<td>${manageList.title }</td>
  			<td>${manageList.wdate} </td>
  		
  		<c:choose>
  			<c:when test="${empty manageList.sdate }">
  				<td id="status">대여대기중</td>
  			</c:when>
  			<c:when test="${!empty manageList.sdate  and  manageList.returndday >= 0}">
  				<td id="status">대여중</td>
  			</c:when>
  			<c:when test="${ manageList.returndday < 0 }">
  				<td id="status">대여종료</td>
  			</c:when>
  			 
  		</c:choose>
 		<c:choose>
 			<c:when  test="${empty manageList.sdate }">
  			<td id="updateStatus"><button id="updateStatusBTN" class="update" value="${manageList.seq }">수정</button></td>
  			</c:when>
  			<c:otherwise>
  			<td></td>
  			</c:otherwise>
  		</c:choose>
  	</tr>				 
	  		
  	</c:forEach>
 
  
  
</table>
</div>


<script type="text/javascript">
$("button").click(function() {
	if($(this).attr("id") == "updateStatusBTN"){
		$("#status").empty().append("<select name='status' id='status'><option value='' selected='selected' disabled='disabled'>--대여상태--</option><option value='prepare_rental'>대여대기중</option><option value='rental_ing'>대여중</option></select>");
		$(this).attr("id","updateBtn");
		$(this).text("확인");
	}else if($(this).attr("id") == "updateBtn"){
		location.href="./RenstalStatusUpdate.do?seq=" + $(this).val() + "&status="+$("#status option:selected").val();
	}
});
</script>



</body>
</html>