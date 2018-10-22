<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>유저updateInfo.jsp이다</h2>

	<form action="" method="post" id="_regiForm" name="updateForm">	
			<table class="content_table" style="width: 75%">
					<colgroup>
						<col style="width:30%">
						<col style="width:70%">
					</colgroup>	
					
				
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" name="id" id="_userid" size="30" data-msg="아이디를" readonly="readonly">
						</td>	
					</tr>
					
					<tr>
						<th>패스워드</th>
						<td>
							<input type="text" name="pw" id="_pw" size="30" data-msg="패스워드를">
						</td>	
					</tr>
					
					<tr>
						<th>주소</th>
						<td>
							<input type="text" name="address" id="_address" size="30" data-msg="이름을 ">
						</td>	
					</tr>
					
					<tr>
						<th>핸드폰 번호</th>
						<td>
							<input type="text" name="phone" id="_phone" size="30" data-msg="이메일을 ">
						</td>	
					</tr>
					
					<tr>
						<th>이름</th>
						<td>
							<input type="text" name="name" id="_name" size="30" data-msg="이메일을 ">
						</td>	
					</tr>
					<tr>
						<td>
							<input type="submit" value="회원정보수정 기능넣기전이요">
							
							<a href="mypage.do">마이페이지로
							<!-- 	<img alt="회원가입" src="img/logBTN.png"> -->
							</a>
						</td>	
					</tr>			
				</table>
			</form>
<script type="text/javascript">
 
</script>

</body>
</html>