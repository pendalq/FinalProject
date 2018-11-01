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

<!-- 리뷰에 필요한 css  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/reviewList.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/reviewList.css">

<style type="text/css">
	textarea{
		width: 100%;
		height: 100%;
		resize: none;
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		box-sizing: border-box;
	}
</style>
<title>GoodsDetail</title>
</head>
<body>
<%
String sessionId = (String)request.getSession().getAttribute("loginID");
%>
<c:set var="sessionId" value="<%= sessionId%>"></c:set>

<%if(request.getSession().getAttribute("loginID") != null && 
  ((int)request.getSession().getAttribute("loginAuth")) == 1){ %>
		
<form action="frm" id="_frm" method="post" action="putInterest.do">

<table class="list_table" style="width: 90%">
	<input type="hidden" name="seq" id="seq" value="${goodsdetail.seq }">
	<input type="hidden" name="_id" id="_id" value="${loginID }">
 	<colgroup>

	</colgroup> 
	
	<tbody>
	<%-- 	loginID:${loginID } --%>
	 <%-- ${loginID }  --%>
		<tr class="idAndimage">
			<th rowspan="8" style="text-align: center;">
				${goodsdetail.imageName }
			</th>
			<th style="text-align: left;">판매자아이디</th>
			<td style="text-align: left;">${goodsdetail.id } | <a href="./messagewrite.do?sendid=${loginID}&receiveid=${goodsdetail.id }">쪽지 보내기</a></td>
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
				
					<td><a href="./rental.do?seq=${goodsdetail.seq }" id="doRental" title="렌탈하기">렌탈하기</a></td>

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
					<td colspan="2">
						<a href="#none" id="goodsUpdate" title="글 수정하기">글 수정하기</a>
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
				${goodsdetail.content }
			</td>
		</tr>
	</tbody>	
</table>
</form>

<!-- ------------------------review html start ----------------------------- -->
<section id="reviewList">
        <h2>후기</h2>
        <c:if test="${totalRecordCount == 0}">
		<h2>등록된 후기가 없습니다.</h2>
		</c:if>
		<c:if test="${totalRecordCount >= 1}">
        <div class="review_q">
            <div class="review_likedAvg">
            <c:choose>
                <c:when test="${likedAvg < 1.5}">
                <p class="">고객님들의 평균 만족도는 <em>최악</em> 입니다.</p>
                </c:when>
                <c:when test="${likedAvg > 1.5 && likedAvg < 2.5}">
                <p class="">고객님들의 평균 만족도는 <em>불만족</em> 입니다.</p>
                </c:when>
                <c:when test="${likedAvg > 2.5 && likedAvg < 3.5}">
                <p class="">고객님들의 평균 만족도는 <em>보통</em> 입니다.</p>
                </c:when>
                <c:when test="${likedAvg > 3.5 && likedAvg < 4.5}">
                <p class="">고객님들의 평균 만족도는 <em>만족</em> 입니다.</p>
                </c:when>
                <c:when test="${likedAvg > 4.5}">
                <p class="">고객님들의 평균 만족도는 <em>최고</em> 입니다.</p>
                </c:when>
            </c:choose>
            </div>
            <p class="review_count">총 <em>${totalRecordCount}</em> 개의 리뷰가 있습니다.</p>
        </div>
        <ul id="review_box">
            <li class="review_header">
                <span class="header_item">만족도</span>
                <span class="header_item">제목</span>
                <span class="header_item">작성자</span>
                <span class="header_item">작성일</span>
                <span>-</span>
            </li>
            <c:forEach items="${reviewList}" var="review" varStatus="vs">
            <li class="review_itemOff">

                <a href="javascript:void(0);" class="review_click" value="1">
                    <div class="review_item_headerOff">
                        <div class="review_liked item">
                        <c:choose>
                        	<c:when test="${review.liked == 1}">
                            <img src="<%=request.getContextPath()%>/img/liked_1.svg" alt="" class="likedImg">
                            </c:when>
                            <c:when test="${review.liked == 2}">
                            <img src="<%=request.getContextPath()%>/img/liked_2.svg" alt="" class="likedImg">
                            </c:when>
                            <c:when test="${review.liked == 3}">
                            <img src="<%=request.getContextPath()%>/img/liked_3.svg" alt="" class="likedImg">
                            </c:when>
                            <c:when test="${review.liked == 4}">
                            <img src="<%=request.getContextPath()%>/img/liked_4.svg" alt="" class="likedImg">
                            </c:when>
                            <c:when test="${review.liked == 5}">
                            <img src="<%=request.getContextPath()%>/img/liked_5.svg" alt="" class="likedImg">
                            </c:when>
                        </c:choose>
                        </div>
                        <span class="review_title item">${review.title}</span>
                        <span class="review_id item">${review.id}</span>
                        <time class="review_wdate item" datetime="${review.wdate }">${review.wdate }</time>
                        <span class="review_openImgOff"></span>
                    </div>
                </a>

                <div class="review_item_mainOff">
                    <div class="review_item_content item_main">
                        <p class="review_content">
                            ${review.content}
                        </p>
                    </div>
					<c:if test="${sessionId == review.id }">
                    <div class="review_item_footer item_main">
                        <form id="reviewForm" action="" method="post">
                            <input type="hidden" name="seq" value="${review.seq }">
                            <input type="hidden" name="gseq" value="${review.gseq }">
                            <input type="hidden" name="searchNum" id="_searchNum" value="${searchNum}">
                            <input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber}" />
                            <input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}" />
                        </form>
                        <button type="button" class="btn_review" value="update">수정하기</button>
                        <button type="button" class="btn_review" value="delete">삭제하기</button>
                    </div>
                    </c:if>
                </div>
            </li>
            </c:forEach>
        </ul>
        
        <!---페이징--->
		<div id="paging_wrap">
			<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
			<jsp:param value="${pageNumber}" name="pageNumber" />
			<jsp:param value="${pageCountPerScreen}" name="pageCountPerScreen" />
			<jsp:param value="${recordCountPerPage}" name="recordCountPerPage" />
			<jsp:param value="${totalRecordCount}" name="totalRecordCount" />
			</jsp:include>
		</div>
		</c:if>
		<span>${sessionId}</span>
		<span>${review.id }</span>
		<button type="button" id="btn_reviewWrite">글쓰기</button>
</section>
<!-- ------------------------review html end ----------------------------- -->
<%} %>


<%if(request.getSession().getAttribute("loginID") != null && 
					(((int)request.getSession().getAttribute("loginAuth")) == 2) || ((int)request.getSession().getAttribute("loginAuth") == 3) || (int)request.getSession().getAttribute("loginAuth") == 4) { %>

<form action="frm" id="_frm" method="post" action="putInterest.do">

<table class="list_table" style="width: 90%">
	<input type="hidden" name="seq" id="seq" value="${goodsdetail.seq }">
	<input type="hidden" name="id" id="id" value="ID2">
 	<colgroup>

	</colgroup> 
	
	<tbody>
		<tr class="idAndimage">
			<th rowspan="8" style="text-align: center;">
				${goodsdetail.imageName }
			</th>
			<th style="text-align: left;">판매자아이디</th>
			<td style="text-align: left;">${goodsdetail.id } </td>
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
			<c:if test="로그인한 사람의 정보와 글을 작성한사람이 같을때 !!!!!!!!!!!!!!!!!!">
			<td>
			<a href="#none" id="updateRental" title="글수정하기">글 수정하기</a>
			</td>
			</c:if> 
		</tr>
		
		
		<tr class="content">
			<td colspan="3" style="text-align: left;">
				${goodsdetail.content }
			</td>
		</tr>
	</tbody>	
</table>
</form>

<!-- ------------------------review html start ----------------------------- -->
  <section id="reviewList">
        <h2>후기</h2>
        <c:if test="${totalRecordCount == 0}">
		<h2>등록된 후기가 없습니다.</h2>
		</c:if>
		<c:if test="${totalRecordCount >= 1}">
        <div class="review_q">
            <div class="review_likedAvg">
            <c:choose>
                <c:when test="${likedAvg < 1.5}">
                <p class="">고객님들의 평균 만족도는 <em>최악</em> 입니다.</p>
                </c:when>
                <c:when test="${likedAvg > 1.5 && likedAvg < 2.5}">
                <p class="">고객님들의 평균 만족도는 <em>불만족</em> 입니다.</p>
                </c:when>
                <c:when test="${likedAvg > 2.5 && likedAvg < 3.5}">
                <p class="">고객님들의 평균 만족도는 <em>보통</em> 입니다.</p>
                </c:when>
                <c:when test="${likedAvg > 3.5 && likedAvg < 4.5}">
                <p class="">고객님들의 평균 만족도는 <em>만족</em> 입니다.</p>
                </c:when>
                <c:when test="${likedAvg > 4.5}">
                <p class="">고객님들의 평균 만족도는 <em>최고</em> 입니다.</p>
                </c:when>
            </c:choose>
            </div>
            <p class="review_count">총 <em>${totalRecordCount}</em> 개의 리뷰가 있습니다.</p>
        </div>
        <ul id="review_box">
            <li class="review_header">
                <span class="header_item">만족도</span>
                <span class="header_item">제목</span>
                <span class="header_item">작성자</span>
                <span class="header_item">작성일</span>
                <span>-</span>
            </li>
            <c:forEach items="${reviewList}" var="review" varStatus="vs">
            <li class="review_itemOff">

                <a href="javascript:void(0);" class="review_click" value="1">
                    <div class="review_item_headerOff">
                        <div class="review_liked item">
                        <c:choose>
                        	<c:when test="${review.liked == 1}">
                            <img src="<%=request.getContextPath()%>/img/liked_1.svg" alt="" class="likedImg">
                            </c:when>
                            <c:when test="${review.liked == 2}">
                            <img src="<%=request.getContextPath()%>/img/liked_2.svg" alt="" class="likedImg">
                            </c:when>
                            <c:when test="${review.liked == 3}">
                            <img src="<%=request.getContextPath()%>/img/liked_3.svg" alt="" class="likedImg">
                            </c:when>
                            <c:when test="${review.liked == 4}">
                            <img src="<%=request.getContextPath()%>/img/liked_4.svg" alt="" class="likedImg">
                            </c:when>
                            <c:when test="${review.liked == 5}">
                            <img src="<%=request.getContextPath()%>/img/liked_5.svg" alt="" class="likedImg">
                            </c:when>
                        </c:choose>
                        </div>
                        <span class="review_title item">${review.title}</span>
                        <span class="review_id item">${review.id}</span>
                        <time class="review_wdate item" datetime="${review.wdate }">${review.wdate }</time>
                        <span class="review_openImgOff"></span>
                    </div>
                </a>

                <div class="review_item_mainOff">
                    <div class="review_item_content item_main">
                        <p class="review_content">
                            ${review.content}
                        </p>
                    </div>
					<c:if test="${sessionId == review.id }">
                    <div class="review_item_footer item_main">
                        <form id="reviewForm" action="" method="post">
                            <input type="hidden" name="seq" value="${review.seq }">
                            <input type="hidden" name="gseq" value="${review.gseq }">
                            <input type="hidden" name="searchNum" id="_searchNum" value="${searchNum}">
                            <input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber}" />
                            <input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}" />
                        </form>
                        <button type="button" class="btn_review" value="update">수정하기</button>
                        <button type="button" class="btn_review" value="delete">삭제하기</button>
                    </div>
                    </c:if>
                </div>
            </li>
            </c:forEach>
        </ul>
        
        <!---페이징--->
		<div id="paging_wrap">
			<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
			<jsp:param value="${pageNumber}" name="pageNumber" />
			<jsp:param value="${pageCountPerScreen}" name="pageCountPerScreen" />
			<jsp:param value="${recordCountPerPage}" name="recordCountPerPage" />
			<jsp:param value="${totalRecordCount}" name="totalRecordCount" />
			</jsp:include>
		</div>
		</c:if>
		<button type="button" id="btn_reviewWrite">글쓰기</button>
</section>
<!-- ------------------------review html end ----------------------------- -->
<%}    %>

<script type="text/javascript">

$(".btn_review").click(function() {
	if ($(this).val() == "update") {
		alert("수정하기");
		$("#reviewForm").attr({ "target":"_self", "action":"reviewUpdate.do" }).submit();
	}else if($(this).val() == "delete"){
		alert("삭제하기");
		$("#reviewForm").attr({ "target":"_self", "action":"reviewDelete.do" }).submit();
	}else{
		alert("수정/삭제 오류");
		return false;
	}
});

$("#updateRental").click(function() {
	//렌탈수정하기  


});

$('#btn_reviewWrite').click(function () {
	alert('123123')
})	



$(function () {
	
//	alert($("#_id").val());
	
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
	});
});
  
  
$(function () {
	$("#delInterest").click(function () {
		$.ajax({
			url : "delInterest.do",
			type : "POST",
			data : {
				command : "delInterest",
				id : $("#id").val(),
				gseq : $("#seq").val()
			},
			success : function (data) {
				alert("관심상품 목록에서 삭제되었습니다")
			},
			error : function () {
				alert("에러났어욤");
			}
		});
	});
});

$(document).ready(function () {

});
	
function func(i) {
//	alert(i);
	$("#_reviewcontent" + i).slideToggle("slow");

}



$("#memberCheck").click(function () {
	var value = "<c:out value="${loginID}" />";
	
	if(value == ""){
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

</script>


</body>
</html>