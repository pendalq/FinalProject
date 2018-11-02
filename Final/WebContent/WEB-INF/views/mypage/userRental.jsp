<%@page import="kh.com.a.model.RentalGoods"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/reviewWrite.css">
	
<style type="text/css">
.retalInfo{
	margin-left : auto;
	margin-right : auto;
	width: 50%
}

.retalInfo td{
	border: 1px solid #c7c7bc;  
	margin-bottom : 30px; 
	text-align: center;
	border-collapse:collapse;
}

.retalInfo th{
	border: 1px solid #c7c7bc;  
	text-align: center;
	border-collapse:collapse;
}



</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%!

 
%>

<%
RentalGoods rdto = (RentalGoods)request.getAttribute("rDetail");


%>

렌탈 정보
<table class="retalInfo">
	<colgroup>
		<col>
		<col>
		<col>
		<col>
		<col>
		<col>
		<col>
		<col>
		<col>
	</colgroup>
      <tr>
         <td rowspan="5" colspan="2" width="200px" height="300px"> <%=rdto.getImagename() %> </td>
         <th>상품 글 제목</th>
         <td colspan="2"><%=rdto.getTitle() %>//<%=rdto.getGseq()%>//<%=rdto.getId()%></td>
      </tr>
      <tr>
      	<th>브랜드 명</th>
        <td colspan="2"><%=rdto.getBrand() %></td>
      </tr>
      <tr>
         <th>옵션</th>
         <td colspan="2"><%=rdto.getOptions() %></td>
      </tr>
      <tr>
         <th>대여기간</th>
         <td><%=rdto.getSdate() %> ~ <%=rdto.getRe_turn() %> </td>
         <td><%=rdto.getTerm() %>개월</td>
      </tr>
      <tr>
         <th>잔여기간</th>
         <td><%=rdto.getReturndday() %></td>
         <td>일</td>
      </tr>
    
    <tr><td colspan="5" style="height: 200px">비어있는공간</td></tr>
	<tr><td colspan="5"><button type="button" onclick="extension()">기간연장</button></td></tr>
	<!-- -----------------------후기 1개 이상 작성 불가  ----------------------------- -->
	<c:if test="${reWriteCount > 0 }">
	<tr><td colspan="5"><p>후기를 작성하였습니다.</p></td></tr>
	</c:if>
	<c:if test="${reWriteCount == 0 }">
	<tr><td colspan="5"><button type="button" data-toggle="modal" data-target="#myModal">후기작성</button></td></tr>
	</c:if>
	
	<tr><td colspan="5"><button type="button" onclick="gomypage()">마이페이지로</button></td></tr>
</table>



<!-- Modal ---------------------은택 리뷰 모달창 start----------------------------------------------->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h2 class="modal-title" id="myModalLabel">멋진 후기를 작성해 주세요.</h2>
                </div>
                <div class="modal-body">
                    <form action="" method="post" id="reviewForm" class="align-center">
                        <div class="formMain">
                            <span class="goods_text">상품</span>
                            <input class="item" type="text" name="goodsName" id="_goodsName" value="<%=rdto.getTitle() %>" readOnly>
                            <span class="id_text">작성자</span>
                            <input class="item" type="text" name="id" id="_rId" value="${getUrentalList.id}" readOnly>
                            <span class="title_text">제목</span>
                            <input class="item" type="text" name="title" id="_reviewTitle" placeholder="멋진 후기 제목을 정해주세요." autocomplete="off" required="required" >
                            <span class="content_text">내용</span>
                            <textarea class="item" name="content" id="_content" placeholder="내용을 입력하세요." required="required"></textarea>
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
                                <input type="hidden" name="gseq" id="_gseq" value="${getUrentalList.seq}" readOnly>
                            </div>
                        </div>
                </div>
                <div class="modal-footer">
                    <div class="btn_box">
                        <button type="reset" class="btn_reviewWrite">초기화</button>
                        <button type="button" class="btn_reviewWrite" id="btn_reviewSubmit">작성</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<!-- Modal ---------------------은택 리뷰 모달창 end----------------------------------------------->
 
<script type="text/javascript">
<!-- Modal ---------------------은택 리뷰 모달 스크립트 start----------------------------------------------->
// 리뷰 모달 작성 버튼
$("#btn_reviewSubmit").click(function() {	
	$("#reviewForm").attr({ "target":"_self", "action":"reviewWriteAf.do" }).submit();	
});
<!-- Modal ---------------------은택 리뷰 스크립트 end----------------------------------------------->

function extension() {
	alert("extension버튼 클릭");
}

/* 
function writeReview() {
	alert('후기 작성');
	location.href="reviewWrite.do?gseq=${getUrentalList.seq}&id=${getUrentalList.id}";
} */

function gomypage() {
	location.href="mypage.do";
}

</script>
</body>
</html>