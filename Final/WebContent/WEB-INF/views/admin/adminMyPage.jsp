<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>adminMypage</title>
</head>
<body>


	<p>승인대기 중 목록</p>
	<table>
		<colgroup>
			
			<col width="70px;">
			<col width="70px;">
			<col width="70px;">
			<col width="70px;">
		</colgroup>
		<tr>
			<th>ID</th>
			<th>주소</th>
			<th>승인상태</th>
			<th>승인</th>
		</tr>
		
	
		
		<c:forEach items="${adD}" var="list" varStatus="vs">
			<c:if test="${list.auth eq 3}">
				<input type="hidden" value="${list.auth }" id="sauth">
					<tr>				
						<td id="userIds">${list.id}</td>
						<td>${list.address }</td>
						<td><p>승인대기중</p></td>
						<td><button id="approval" name="approval">승인</button></td>
					</tr>
			</c:if>	
		</c:forEach>	
		

	</table>
	<p>판매자 승인 완료</p>
	<table>
		<colgroup>
			
			<col width="70px;">
			<col width="70px;">
			<col width="70px;">
			<col width="70px;">
		</colgroup>

		<tr>
			<th>번호</th>
			<th>ID</th>
			<th>승인</th>
			<th>승인완료</th>
		</tr>
		<c:forEach items="${adD}" var="list" varStatus="vs">
			<c:if test="${list.auth eq 2}">
				<c:if test="${list.id eq null }">
					<td colspan="4">승인 할 목록이 없습니다.</td>	
				</c:if>
				<input type="hidden" value="${list.auth }" id="cauth">
					<tr>
						<td id="userIdc">${list.id}</td>
						<td>${list.address}</td>
						<td><p>승인완료</p></td>
						<td><button id="cancel" name="cancel">취소</button></td>
					</tr>
			</c:if>	
		</c:forEach>

	</table>
<!-- 밑에 javascript 해당 아이디를 가지고 가서 controller 에서 해당 id 의 auth 값을 증가 또는 감소 시켜준다 -->
<script type="text/javascript">

$(document).ready(function() {
	$("#approval").click(function () {
		location.href="adminAf.do?id="+$("#userIds").text() + "&auth="+$("#sauth").val();
	});
});

</script>

<script type="text/javascript">
//내려주기
$(document).ready(function() {
	$("#cancel").click(function () {
		location.href="adminAf.do?id="+$("#userIdc").text() + "&auth="+$("#cauth").val();
	});
});



</script>

</body>
</html>