<%-- 
 <%@page import="kh.com.a.model.GoodsDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
여기는 셀러 렌탈 
이 다음페이지는 렌탈 디테일 
<%
GoodsDto gdto = (GoodsDto)request.getAttribute("sellerGoodsDto");
%>


<table class="list_table">
<colgroup>
<col style="width:100px;" />
<col style="width:auto;" />
</colgroup>

<tr>
<th>아이디</th>
<td style="text-align: left"><input type="text" id='id' name='id' readonly="readonly"
value="${loginID }"  size="50"/></td>
</tr>
<tr>
<th>제목</th>
<td style="text-align: left"><%=gdto.getTitle() %></td>
</tr>

<tr>
<th>파일업로드</th>
<td style="text-align: left">
<!-- <input type="file" name="fileload" id="fileload" style=" width : 400px;">
<div>
<img id="image_section" src="">
</div> -->
<%=gdto.getImageName() %>

</td>
</tr>


<tr>
<th>카테고리</th>
<td><!-- 
<select id="categorys">
<option value="Refrigerator" selected="selected">냉장고</option>
<option value="purifier">정수기</option>
<option value="TV">TV</option>
</select>
<input type="hidden" id="category" name="category" value=""> -->
<%=gdto.getCategory() %>
</td>
</tr> 



<tr>
<th>옵션</th>
<td id="option">
<table>
	<tr>
		<th>제조사</th>
		<td>
			<!-- <input type='radio' id='lg' name='brands' value='lg' checked='checked'>LG 
			<input type='radio' id='samsung' name='brands' value='samsung'>samsung 
			<input type='radio' id='daewoo' name='brands' value='daewoo'>daewoo  -->
			<%=gdto.getBrand() %>
		</td>
	</tr>
	<tr>
		<th>품목</th>
		<td>
			<!-- <input type="radio" id='four' name='subject' value="fourDoor" checked="checked">4문형
			<input type="radio" id='three' name='subject' value="threeDoor">3문형
			<input type="radio" id='double' name='subject' value="doublegateDoor">양문형
			<input type="radio" id='normal' name='subject' value="normal">일반형 -->
			<%=gdto.getOptions() %>
		</td>
	</tr>
<!-- 옵션이 바뀔수있다는걸 잇지마라 다시 ㅠ  	

	<tr>
	
		<th>용량</th>
		<td>
			<input type='text' id='liter' style="width: 200px; text-align: right;" >L
		</td>
	</tr>
	<tr>
		<th>에너지효율</th>
		<td>
			<input type="radio" id="first" name="efficiency" value="first_effi" checked="checked">1등급
			<input type="radio" id="second" name="efficiency" value="second_effi">2등급
			<input type="radio" id="third" name="efficiency" value="third_effi">3등급
			<input type="radio" id="fourth" name="efficiency" value="fourth_effi">4등급
			<input type="radio" id="fifth" name="efficiency" value="fifth_effi">5등급
		</td>
	</tr> -->
	
</table>
<input type="hidden" id="brand" name="brand" value="">
<input type="hidden" id="options" name="options" value="">
</td>
</tr>



<tr>
<th>가격</th>
<td><%=gdto.getPrice() %></td>
</tr>
<tr>
<th>내용</th>
<td style="text-align: left"><textarea id="ir1" name="content" style="height: 600px; width: 800px"><%=gdto.getContent() %></textarea></td>
</tr>

<tr>
<td colspan="2" style="height:50px; text-align:center;">
	<span><a href="#none" id="_btnLogin" title="글 수정하기"><img src="image/bwrite.png" alt="확인" /></a>
</span>
</td>
</tr>
 

</table>


</body>
</html>
 --%>