<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>


    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- table css -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/design/_table.css">
	   
  
<link rel="shortcut icon" type="image/x-icon"
	href="design/images/favicon.ico">
<link rel="apple-touch-icon" href="design/apple-touch-icon.png">
<!-- table css -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/design/_table.css">



<!-- Bootstrap Fremwork Main Css -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/design/css/bootstrap.min.css">
<!-- All Plugins css -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/design/css/plugins.css">
<!-- Theme shortcodes/elements style -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/design/css/shortcode/shortcodes.css">
<!-- Theme main style -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/design/style.css">
<!-- Responsive css -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/design/css/responsive.css">
<!-- User style -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/design/css/custom.css">
	
	
 <script src="<c:out value="design/js/main.js"/>"></script>
     <script src="<c:out value="design/js/vendor/jquery-1.12.4.min.js"/>"></script>
    <script src="<c:out value="design/js/popper.min.js"/>"></script>
    <script src="<c:out value="design/js/bootstrap.min.js"/>"></script>
    <script src="<c:out value="design/js/plugins.js"/>"></script>
    
	
	

    

<style type="text/css">

	*{
		font-size: 15 !important;
	}

	table{
		width: 80% !important;
	}
	
	
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




<form action="frm" id="_frm" method="post" action="putInterest.do">

	<input type="hidden" name="seq" id="seq" value="${goodsdetail.seq }">
	<input type="hidden" name="_id" id="_id" value="${loginID }">
	<br>
	<br>
	

<table class="list_table" style="width: 90%" id="keywords">

	
	
	<%-- 	loginID:${loginID } --%>
	 <%-- ${loginID }  --%>
		<tr class="idAndimage">
			<th rowspan="8" style="text-align: center;">
				<div style="height:360px; width: 360px">
				${goodsdetail.imageName }
				</div>
			</th>
			<th style="text-align: left;">판매자아이디</th>
			<td style="text-align: left;">${goodsdetail.id } | 
			<form action="./messagewrite.do" id="sendmessage" method="post">
				<input type="hidden" name="sendid" value="${loginID }">
				<input type="hidden" name="receiveid" value="${goodsdetail.id }">
			<a href="#none" id="sendM">쪽지 보내기</a>
			</form></td>
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
				<div>
					${goodsdetail.content }
				</div>
			</td>
		</tr>
</table>


<table class="list_table" style="width: 90%" id="keywords">
	<thead style="text-align: center;">
		<th>글번호</th>
		<th>제목</th>
		<th>글쓴이</th>
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

$("#sendM").click(function(){
	
	loc = "./messagewrite.do?sendid=${loginID}&receiveid=${goodsdetail.id}";

	window.open(loc, 'POP', 'top=100px, left=100px, height=400px, width=420px');

	$('#sendmessage').submit();
});

$("#updateRental").click(function() {
	//렌탈수정하기  
 

/* $("#putInterest").click(function () {
	alert("찜하기");
	$("#_frm").attr({"target":"_self","action":"putInterest.do"}).submit();
}); */
});

$(document).ready(function () {


  $(function () {
		var data1={
				"command":"putInterest",
				"id":$("#_id").val(),
				"gseq":$("#seq").val()	
				
		};
//		alert($("#_id").val());
		
		$("#putInterest").click(function () {
			$.ajax({
				url:"putInterest.do",
				type:"POST",
				datatype:"json",
				data:data1,
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
	$("#_frm").attr({ "target":"_self", "action":"rental.do"}).submit();
});
 
 
});
 </script>
 <script>
 

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

<%-- <script src="<c:out value="design/js/main.js"/>"></script>
     <script src="<c:out value="design/js/vendor/jquery-1.12.4.min.js"/>"></script>
    <script src="<c:out value="design/js/popper.min.js"/>"></script>
    <script src="<c:out value="design/js/bootstrap.min.js"/>"></script>
    <script src="<c:out value="design/js/plugins.js"/>"></script>  --%>
</body>
</html>