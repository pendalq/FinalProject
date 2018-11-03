<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<table border="2">

	<c:choose>
		<c:when test="${loginID eq mdto.receiveid }">
			<h3 style="position: relative;left:25px">받은 쪽지</h3>
		</c:when>
		<c:otherwise>
			<h3 style="position: relative;left:25px">보낸 쪽지</h3>
		</c:otherwise>	
	</c:choose>
	<table class="table table-bordered" style="margin: 5px auto">

		<tr>
			<th>보낸사람</th>
			<td style="text-align: left"><input type="text" id='id' name='sendid' readonly="readonly" value="${mdto.sendid} " size="40"/>
			</td>
		</tr>
		<tr>
			<th>받는사람</th>
			<td style="text-align: left"><input type="text" id='id' name='receiveid' readonly="readonly" value="${mdto.receiveid }" size="40"/>
		</tr>
		<tr> 
			<th>제목</th>
			<td style="text-align: left"><input type="text" id="title" name='title' readonly="readonly" size="40"/ value="${mdto.title }"></td>
		</tr>
		<tr>
			<th>내용</th>

			<td style="text-align: left"><textarea id="content" name="content" style="height: 200px; width: 308px" readonly="readonly" >${mdto.content }</textarea></td>

			<td style="text-align: left"><div style="height: 200px; width: 297px">${mdto.content }</div></td>
		</tr>
		<tr>
			<td colspan="2">
					<c:if test="${loginID eq mdto.receiveid }">
						<a href="./messagewrite.do?sendid=${loginID }&receiveid=${mdto.sendid }" style="margin-right: 20px">답장하기</a>
					</c:if>
			
			
			<a href="message.do" style="margin-right: 20px">돌아가기</a></td>

		</tr>
	</table>

</body>
</html>