<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 리뷰에 필요한 css  -->
<script src="<%=request.getContextPath()%>/js/reviewList.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/reviewList.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/reviewWrite.css">



<script type="text/javascript">
//수정 및 삭제 시 알림창 
var msg = '${msg}';
if (msg == '1') {
		alert("삭제를 완료하였습니다.");
	}else if(msg == '2'){
			alert("수정을 완료하였습니다.");
};
</script>



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
	<input type="hidden" name="seq" id="seq" value="${goodsdetail.seq }">
	<input type="hidden" name="_id" id="_id" value="${loginID }">
<table class="list_table" style="width: 90%">
	
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
				<textarea rows="20" cols="115" name="content" id="_content" readonly="readonly">
					${goodsdetail.content }
				</textarea>
			</td>
		</tr>
	</tbody>	
</table>
</form>

<!-- ------------------------review html start ----------------------------- -->
<section id="reviewList">
        <div id="reviewH2_box"><h2 id="reviewH2">고객님들의 솔직한 후기 이야기 입니다.</h2></div>
        <c:if test="${totalRecordCount == 0}">
		<div id="review_none">
			<h2>등록된 후기가 없습니다.</h2>
		</div>
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
                           <!-- goodsDetail을 위한 폼 벨류 -->
                            <input type="hidden" name="seq" value="${goodsdetail.seq }">
                            <input type="hidden" name="gseq"  value="${review.gseq }">
                            <!-- 리뷰 삭제를 위한 리뷰 시퀀스 벨류 -->
                            <input type="hidden" name="delSeq" id="_delSeq" value="${review.seq }">
                            <!-- 페이징을 위한 폼 벨류 -->
                            <input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber}" />
                            <input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}" />
                        </form>
                        <button type="button" onclick="reviewUp(${review.seq })" class="btn_review_modal" data-toggle="modal" data-target="#myModal" >수정하기</button>
                        <button type="button" class="btn_reviewDel" onclick="reviewDel(${review.seq })">삭제하기</button>
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

<!--------------------------review html start ------------------------------->
  <section id="reviewList">
        <div id="reviewH2_box"><h2 id="reviewH2">고객님들의 솔직한 후기 이야기 입니다.</h2></div>
        <c:if test="${totalRecordCount == 0}">
		<div id="review_none">
			<h2>등록된 후기가 없습니다.</h2>
		</div>
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
                            <!-- goodsDetail을 위한 폼 벨류 -->
                            <input type="hidden" name="seq" value="${goodsdetail.seq }">
                            <input type="hidden" name="gseq"  value="${review.gseq }">
                            <!-- 리뷰 삭제를 위한 리뷰 시퀀스 벨류 -->
                            <input type="hidden" name="delSeq" id="_delSeq" value="${review.seq }">
                            <!-- 페이징을 위한 폼 벨류 -->
                            <input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber}" />
                            <input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}" />
                        </form>
                        <button type="button" onclick="reviewUp(${review.seq })" class="btn_review_modal" data-toggle="modal" data-target="#myModal">수정하기</button>
                        <button type="button" class="btn_reviewDel" onclick="reviewDel(${review.seq })">삭제하기</button>
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
<!-------------------------review html end ------------------------------->
<%}    %>

<script type="text/javascript">

$("#sendM").click(function(){
	
	loc = "./messagewrite.do?sendid=${loginID}&receiveid=${goodsdetail.id}";

	window.open(loc, 'POP', 'top=100px, left=100px, height=400px, width=420px');

	$('#sendmessage').submit();
});

</script>

<!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h2 class="modal-title" id="myModalLabel">후기를 수정하세요.</h2>
                </div>
                <div class="modal-body">
                    <form action="" method="post" id="reviewUpForm" class="align-center">
                        <div class="formMain">
                            <span class="goods_text">상품</span>
                            <input class="item" type="text" name="goodsName" id="_goodsName" value="${goodsdetail.title }" readOnly>
                            <span class="id_text">작성자</span>
                            <input class="item" type="text" name="id" id="_rId" value="" readOnly>
                            <span class="title_text">제목</span>
                            <input class="item" type="text" name="title" id="_reviewTitle" placeholder="" autocomplete="off" required="required" >
                            <span class="content_text">내용</span>
                            <textarea class="item" name="content" id="_content" placeholder="" required="required"></textarea>
                            <span class="liked_text">만족도</span>
                            <div id="liked_radio">
                                <input type="radio" name="liked" id="_liked1" class="a11y-hidden" value="1">
                                <label for="_liked1" class="_liked1"></label>
                                <input type="radio" name="liked" id="_liked2" class="a11y-hidden" value="2">
                                <label for="_liked2" class="_liked2"></label>
                                <input type="radio" name="liked" id="_liked3" class="a11y-hidden" value="3">
                                <label for="_liked3" class="_liked3"></label>
                                <input type="radio" name="liked" id="_liked4" class="a11y-hidden" value="4">
                                <label for="_liked4" class="_liked4"></label>
                                <input type="radio" name="liked" id="_liked5" class="a11y-hidden" value="5" checked>
                                <label for="_liked5" class="_liked5"></label>
                                <input type="hidden" name="seq" id="_seq" value="" readOnly>
                                <input type="hidden" name="ggseq" id="_ggseq" value="${goodsdetail.seq }" readOnly>
                            </div>
                        </div>
                </div>
                <div class="modal-footer">
                    <div class="btn_box">
                        <button type="reset" class="btn_reviewWrite">초기화</button>
                        <button type="button" id="btn_reviewUp" class="btn_reviewWrite">수정</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

<script type="text/javascript">

/* -------------------------------------------은택 review Script start------------------------------ */
	
//리뷰 페이징
function goPage(pageNumber) {
	$("#_pageNumber").val(pageNumber);
	$("#reviewForm").attr("target", "_self").attr("action",
		"goodsdetail.do").submit();
}



//리뷰삭제
function reviewDel(seq) {
	var num = seq;
	var str = confirm("후기를 삭제하시겠습니까?");
	if (str == true) {
		$('#_delSeq').val(num);
		$("#reviewForm").attr({ "target":"_self", "action":"reviewDelete.do" }).submit();
	}else{
		return false;
	}
};

//리뷰 모달창 
function reviewUp(seq) {
	var num = seq;
	var str = confirm("후기를 수정 하시겠습니까?");
	if (str == true) {
		$.ajax({
			url:"reviewUpdateAjax.do",
			type:"POST",
			dataType:"JSON",
			data: {"delSeq":num},
			success:function (data) {
				console.log(data);
				$('#_rId').val(data.id) 
				$('#_reviewTitle').val(data.title)
				$('#_content').val(data.content);
				$('#_seq').val(data.seq);
			},
			error:function (request, error) {
			         alert("통신 실패");
			}
		});
	}else{
		return false;
	}
} ;

$("#btn_reviewUp").click(function() {
	
	$("#reviewUpForm").attr({ "target":"_self", "action":"reviewUpdateAf.do" }).submit();
});


/* -------------------------------------------은택 review Script end------------------------------ */

$("#updateRental").click(function() {
	//렌탈수정하기  
 
/* 
$("#putInterest").click(function () {
	alert("찜하기");
	$("#_frm").attr({"target":"_self","action":"putInterest.do"}).submit();
});


$('#btn_reviewWrite').click(function () {
	alert('123123')
});

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