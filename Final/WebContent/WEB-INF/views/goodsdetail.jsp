<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<style type="text/css">
	textarea{
		width: 100%;
		height: 100%;
		resize: none;
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		box-sizing: border-box;
		background-color: white !important;
	}
	
	.reviewshow{
		cursor: pointer;
	}
	
	.review:hover{
		background-color: #c3d3d3;
	}
	
	.review{
		border-bottom: 1px solid black;
		border-left-style: none;
		border-right-style: none;
	}
	

</style>
<title>GoodsDetail</title>
</head>
<body>




	<input type="hidden" name="seq" id="seq" value="${goodsdetail.seq }">
	<input type="hidden" name="_id" id="_id" value="${loginID }">

<table class="list_table" style="width: 90%">
<form action="frm" id="_frm" method="post" action="putInterest.do">
 	<colgroup>

	</colgroup> 
	
	<tbody>
	<%-- 	loginID:${loginID } --%>
	 <%-- ${loginID }  --%>
		<tr class="idAndimage">
			<th rowspan="8" style="text-align: center;">
				<textarea rows="19" cols="48" name="image" id="_image">
				${goodsdetail.imageName }
				</textarea>
			</th>
			<th style="text-align: left;">판매자아이디</th>
			<td style="text-align: left;">${goodsdetail.id } | <a href="#" id="memberCheck">쪽지 보내기</a></td>
		</tr>
		<tr class="name">
			<th style="text-align: left;">업체이름</th>
			<td style="text-align: left;">${goodsdetail.title }</td>
		</tr>
		<tr class="brand">
			<th style="text-align: left;">브랜드명</th>
			<td style="text-align: left;">${goodsdetail.brand }</td>
		</tr>
		<tr class="price">
			<th style="text-align: left;">가격</th>
			<td style="text-align: left;">${goodsdetail.price }</td>
		</tr>
		<tr class="options">
			<th style="text-align: left;">옵션</th>
			<td style="text-align: left;">${goodsdetail.options }</td>
		</tr>
		<tr class="rentalcount">
			<th style="text-align: left;">누적렌탈수</th>
			<td style="text-align: left;">${goodsdetail.rentalcount }</td>
		</tr>
		<tr class="wdate">
			<th style="text-align: left;">등록일</th>
			<td style="text-align: left;">${goodsdetail.wdate }</td>
		</tr>	
		
			
		
		
		<tr>
			<c:choose>
				<c:when test="${loginAuth eq 1 }">
		
				
					<td><a href="#none" id="doRental" title="렌탈하기">렌탈하기</a></td>
					<td>
						<c:if test="${interCheck.id eq loginID && interCheck.gseq eq goodsdetail.seq}">
							<a href="#none" id="delInterest" title="관심상품삭제">관심상품삭제</a>
						</c:if>
						<c:if test="${interCheck.id ne loginID || interCheck.gseq ne goodsdetail.seq }">
							<a href="#none" id="putInterest" title="관심상품에저장">관심상품에저장</a>
						</c:if>
					</td>
					
				</c:when>
				<c:when test="${loginAuth eq 2 && loginID eq goodsdetail.id}">
					<td>
						<a href="#none" id="goodsUpdate" title="글 수정하기">글 수정하기</a>
					</td>
					<td>
						<a href="#none" id="goodsDelete" title="글 삭제하기">글 삭제하기</a>
					</td>
				</c:when>
				<c:when test="${loginAuth eq 2 && loginID ne goodsdetail.id }">
					<td></td>
				</c:when>
				<c:otherwise>
					<td colspan="2"><a href="#none" id="gotoLogin" title="로그인하기">로그인하기</a></td>
				</c:otherwise>
			</c:choose>
			
		</tr>
		
		
		<tr class="content">
			<td colspan="3" style="text-align: left;">
				<textarea rows="20" cols="115" name="content" id="_content" readonly="readonly">
					${goodsdetail.content }
				</textarea>
			</td>
		</tr>
	</tbody>	
</table>


<table class="list_table" style="width: 90%">
<colgroup>
	<col style="width:70px"/>
	<col style="width:300px"/>
	<col style="width:70px"/>
	<col style="width:70px"/>
	<col style="width:130px"/>
	<col style="width:70px"/>
</colgroup>
	<thead style="text-align: center;">
		<th>글번호</th>
		<th>제목</th>
		<th>글쓴이</th>
		<th>조회수</th>
		<th>별점</th>
		<th>등록일</th>		
	</thead>
	
	<tbody>
		<c:if test="${empty reviewDetail }">
			<td colspan="6" style="text-align: center;">작성된 후기가 없습니다</td>
		</c:if>
		
		<c:forEach items="${reviewDetailList }" var="rd" varStatus="vs">
		<tr class="review" style="text-align: center;">
			<td>${vs.count}</td>
			<td id="reviewshow${vs.count }" class="reviewshow" onclick="func(${vs.count })">${rd.title }</td>
			<td>${rd.id }</td>
			<td>${rd.readcount }</td>
			<td>
				<c:choose>
					<c:when test="${rd.liked==1 }">
						<img alt="이미지없음" src="image/star1.png">
					</c:when>
					<c:when test="${rd.liked==2 }">
						<img alt="" src="image/star2.png">
					</c:when>
					<c:when test="${rd.liked==3 }">
						<img alt="" src="image/star3.png">
					</c:when>
					<c:when test="${rd.liked==4 }">
						<img alt="" src="image/star4.png">
					</c:when>
					<c:when test="${rd.liked==5 }">
						<img alt="" src="image/star5.png">
					</c:when>
					<c:otherwise>
						<img alt="" src="image/star0.png">
					</c:otherwise>				
				</c:choose>
			</td>
			<td>${rd.wdate }</td>
		</tr>
		<tr class="reviewcontents" style="text-align: center;" id="reviewcontents">
			<td colspan="6">
				<textarea rows="20" cols="115" name="reviewcontent" 
				id="_reviewcontent${vs.count }" class="reviewcontent"
				style="border: none;">
					${rd.content }
				</textarea>
			</td>
		</tr>
		</c:forEach> 
	</tbody>
</table>

</form>

<script type="text/javascript">
 
/* 
$("#putInterest").click(function () {
	alert("찜하기");
	$("#_frm").attr({"target":"_self","action":"putInterest.do"}).submit();
});

  */


  $(function () {
		
//		alert($("#_id").val());
		
		$("#putInterest").click(function () {
			$.ajax({
				url:"putInterest.do",
				type:"POST",
				data:{
					"command":"putInterest",
					"id":$("#_id").val(),
					"gseq":$("#seq").val()
				},
				success:function (data) {
					alert("관심상품 목록에 추가되었습니다");
				},
				error:function (request, error) {
				         alert("message:"+request.responseText);
				}
			});
			location.reload();
		});
	});
  
  $(function () {
		$("#delInterest").click(function () {
			$.ajax({
				url:"delInterest.do",
				type:"POST",
				data:{
					"command":"delInterest",
					"id":$("#_id").val(),
					"gseq":$("#seq").val()
				},
				success:function(data){
					alert("관심상품 목록에서 삭제되었습니다");
				},
				error:function(request, error){
					alert("에러났어욤");
					 alert("message:"+request.responseText);
				}
			});
			location.reload();
		});
	});
	 
   
 $("#doRental").click(function () {
	$("#_frm").attr({ "target":"_self", "action":"gotoRental.do"}).submit();
});
 
 

 $(document).ready(function () {
	 
	 for(i = 1;i< ${reviewDetailList.size()} + 1; i++){
//	 alert("reviewshow1");
		$("#_reviewcontent"+i).hide();
//		alert("reviewshow2");

		
	 }
	

});
	
function func(i) {
//	alert(i);
	$("#_reviewcontent" + i).slideToggle("slow");

}



$("#memberCheck").click(function () {
	var value = "<c:out value="${loginID}" />";
	
	if(value == "0"){
	$("#memberCheck").attr("href","login.do");
	}else{
		$("#memberCheck").attr("href","messagewrite.do");
	}
});


$("#goodsUpdate").click(function () {
	$("#_frm").attr({ "target":"_self", "action":"gotoGoodsUpdate.do"}).submit();
});

$("#gotoLogin").click(function () {
	$("#_frm").attr({ "target":"_self", "action":"login.do"}).submit();
});

$("#goodsDelete").click(function () {
	$("#_frm").attr({ "target":"_self", "action":"goodsDel.do"}).submit();
});


 
</script>


</body>
</html>