<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.lentManage{
	border: 1px solid;
}
</style>
<meta charset="UTF-8">
<title>lentManage view</title>
</head>
<body>

여기는 lentManage
<table class="lentManage">
	<tr>
		<td>주문 번호</td>
		<td>대여자이름</td>
		<td>대여자주소</td>
		<td>대여자연락처</td>
		<td>대여자상품</td>
		<td>대여 접수일</td>
		<td><select id="select_status">
			  <option value='' selected="selected">--대여상태--</option>
			  <option value="prepare_retal">대여 대기중 </option> 
			  <option value="retal_ing">대여중</option>
 
			</select> </td>
		<td>수정</td>
		
		 
		
		
	</tr>
</table>

<script type="text/javascript">
$(".select_status").click(function() {
	
});
</script>
</body>
</html>