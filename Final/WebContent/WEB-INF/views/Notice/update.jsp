<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>공지 글수정</title>
</head>
<body>

	<ul class="tabs">
		<li class="active" rel="tab1">공지사항</li>
		<!-- <li rel="tab2">자주묻는질문</li>
        <li rel="tab3">1:1문의</li> -->
	</ul>


	<form action="updateAf.do" method="get">
		<table border="1px">
			<colgroup>
				<col width="122" />
				<col width="592" />
				<col width="106" />
				<col width="117" />
			</colgroup>


			<tbody>
				<tr>
					<th>번호</th>
					<td><input type="text" value="${dto.seq }" name="seq"
						readonly="readonly"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" value="${dto.title }" name="title"
						required="required" autofocus="autofocus"></td>
				</tr>

				<tr>
					<th>작성날짜</th>
					<td><input type="text" value="${dto.wdate }" name="wdate"
						required="required" autofocus="autofocus"></td>
				</tr>
				<tr>
					<th>조회수</th>
					<td><input type="text" name="readCount" value="${dto.readCount }"
						readonly="readonly"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="10" cols="50" name='content' id="_content">${dto.content}</textarea></td>
				</tr>


			</tbody>
			<tfoot>
				<tr>
					<th><input type="reset" value="취소"></th>
					<td><input type="submit" value="수정완료"></td>
				</tr>
				<tr>

				</tr>
			</tfoot>
		</table>
	</form>

	<script type="text/javascript">
		
	</script>


</body>
</html>
