<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>    

<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>lentManage view</title>
</head>
<body>

 

<div class="lentManage">
<table class="table table-striped" style="width: 80%; margin: 20px auto">
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
	<c:choose>
		<c:when test="${empty manageRentalList}">
	  		<tr>
	  			<td colspan="6" style="text-align: center">대여된 상품이 없습니다</td>
	  		</tr>
		</c:when>
  		<c:otherwise>
  			<c:forEach begin="0" step="1" items="${manageRentalList }" var="manageList" varStatus="vs">
  		
  				<tr>
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
			  			<td id="updateStatus"><button id="updateStatusBTN" class="update" value="${manageList.seq }">대여시작</button></td>
			  			</c:when>
			  			<c:when test="${manageList.returndday < 0 }">
			  			<td><button id="endRentBtn" class="endRent" value="${manageList.seq }">반납완료</button></td>
			  			</c:when>
			  			<c:otherwise>
			  			<td></td>
			  			</c:otherwise>
		  			</c:choose>
  			
  				</tr>				 
	 		
 	 		</c:forEach>
 	 	</c:otherwise>
	</c:choose> 
 
  
  
</table>
</div>


<script type="text/javascript">
$(".update").click(function(){
	location.href="./RenstalStatusUpdate.do?seq=" + $(this).val() + "&status=startRent";
});

$(".endRent").click(function(){
	location.href="./RenstalStatusUpdate.do?seq=" + $(this).val() + "&status=endRent";
});
</script>



</body>
</html>