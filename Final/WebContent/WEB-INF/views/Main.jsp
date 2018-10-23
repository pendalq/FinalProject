<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
</head>
<body>
	<div>최신 상품</div>
	<table class="list_table" style="width: 90%" border="1px">
		<colgroup>
			<col style="width: 70px" />
			<col style="width: 70px" />
			<col style="width: 70px" />
			<col style="width: 70px" />
			<col style="width: 70px" />
			<col style="width: 70px" />
		<thead>
			<tr>
				<th>번호</th>
				<th>이미지</th>
				<th>이름</th>
				<th>카테고리</th>
				<th>제조사</th>
				<th>옵션</th>
				<th>등록일</th>
				<th>평균평점</th>
			</tr>
		</thead>

		<tbody>
			<c:if test="${empty mainbbslist }">
				<tr>
					<td colspan="11">글 없음</td>
				</tr>
			</c:if>

			<c:forEach items="${mainbbslist }" var="mbl" varStatus="vs">
				<tr class="_hover_tr">
					<td>${mbl.seq }</td>
					<td>${mbl.image }</td>
					<td><a href="goodsdetail.do?seq=${mbl.seq }"> ${mbl.title }
					</a></td>
					<td>${mbl.category }</td>
					<td>${mbl.brand }</td>
					<td>${mbl.options }</td>
					<td>${mbl.wdate }</td>
					<td>${mbl.liked } </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div>인기상품</div>
	<table class="list_table" style="width: 90%" border="1px">
		<colgroup>
			<col style="70px" />
			<col style="70px" />
			<col style="70px" />
			<col style="70px" />
			<col style="70px" />
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>이미지</th>
				<th>이름</th>
				<th>카테고리</th>
				<th>제조사</th>
				<th>옵션</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty mainbbslist2 }">
				<tr>
					<td colspan="11">글 없음</td>
				</tr>
			</c:if>

			<c:forEach items="${mainbbslist2 }" var="mbl2" varStatus="vs2">
				<tr class="_hover_tr">
					<td>${mbl2.seq }</td>
					<td>${mbl2.image }</td>
					<td><a href='goodsdetail.do?seq=${mbl2.seq }'> ${mbl2.title }
					</a></td>
					<td>${mbl2.category }</td>
					<td>${mbl2.brand }</td>
					<td>${mbl2.options }</td>
					<td>${mbl2.wdate }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	
	<div>후기</div>
	<table class="list_table" style="width: 90%" border="1px">
		<colgroup>
			<col style="70px" />
			<col style="70px" />
			<col style="70px" />
			<col style="70px" />
			<col style="70px" />
		</colgroup>
		<thead>
			<th>번호</th>
			<th>아이디</th>
			<th>물품번호</th>
			<th>제목</th>
			<th>등록일</th>
			<th>조회수</th>
		</thead>
		<tbody>
			<c:if test="${empty reviewlist }">
				<tr>
					<td>등록된 후기가 없습니다</td>
				</tr>
			</c:if>
			
			<c:forEach items="${reviewlist }" var="rl" varStatus="vs3">
				<tr class="_hover_tr">
					<td>${rl.seq }</td>
					<td>${rl.id }</td>
					<td>${rl.gseq }</td>
					<td>
						<a href='goodsdetail.do?seq=${rl.gseq}'>
						${rl.title }</a></td>
					<td>${rl.wdate }</td>
					<td>${rl.readcount }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	

</body>
</html>