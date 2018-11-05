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
<style type="text/css">


table tr th, table tr td {
	width:150px;
	text-align: center;
	vertical-align:middle !important;
} 

/* body {
	text-align: center;
	margin-bottom: 100px;
	margin-top: 100px;
} */
/* 버튼 css 적용한 곳   */
.approval , .cancel{
    text-decoration :none;
    border: 1px solid #d5d5d5;
    color: #4b4b4b;
    font-size: 20px;
    height: 40px;
    letter-spacing: 2px;
    line-height: 20px;
    padding: 0 70px;
    font-family: 'Poppins', sans-serif;
    background: #fff;
}
.approval:hover , .cancel:hover{
    border: 1px solid #ff4136;
    color: #fff;
    background: #ff4136;
   font-family: 'Poppins', sans-serif;
}
.adminclass{
	margin-bottom: 50px;
	margin-top: 50px;

}



</style>
</head>
<body>

<div>
	
	<h1 style="position: relative;left: 100;margin-top: 25px;">승인대기 중 목록</h1>
	
	<table class="table table-striped" style="width: 85%;margin:30px auto">
		<tr>
			<th>ID</th>
			<th>주소</th>
			<th>승인상태</th>
			<th>승인확인</th>
		</tr>
		
	
		
		<c:forEach items="${adD}" var="list" varStatus="vs">
			<c:if test="${list.auth eq 3}">
				<input type="hidden" value="${list.auth }" id="sauth">
					<tr>				
						<td id="userIds">${list.id}</td>
						<td>${list.address }</td>
						<td><p>승인대기중</p></td>
						<td><button id="approval${vs.index }" class="approval" name="approval" value="${list.id }">승인</button></td>
					</tr>
			</c:if>	
		</c:forEach>	
		

	</table>
	<h1 style="position: relative;left: 100;margin-top: 25px;">판매자 승인 완료</h1>
	
	<table class="table table-striped" style="width: 85%;margin: 30px auto">

		<tr>
			<th>ID</th>
			<th>주소</th>
			<th>승인상태</th>
			<th>승인취소</th>                                                                                                                                                                                                                    
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
						<td><button id="cancel${vs.index}" class="cancel" name="cancel"  value="${list.id }" >취소</button></td>
					</tr>
			</c:if>	
		</c:forEach>

	</table>
	
	
	</div>
<!-- 밑에 javascript 해당 아이디를 가지고 가서 controller 에서 해당 id 의 auth 값을 증가 또는 감소 시켜준다 -->
<script type="text/javascript">

$(document).ready(function() {
	$(".approval").click(function () {
		/* var value = this.val(); */
		location.href="adminAf.do?id="+$(this).val()+"&auth="+$("#sauth").val();
	});
});

//내려주기
$(document).ready(function() {
	$(".cancel").click(function () {
		location.href="adminAf.do?id="+$(this).val() + "&auth="+$("#cauth").val();
	});
});



</script>

</body>
</html>