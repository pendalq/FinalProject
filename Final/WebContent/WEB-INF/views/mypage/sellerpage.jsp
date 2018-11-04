<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>sellerpage</title>
    <link rel="stylesheet" href="css/sellerPage.css">
</head>

<body>
    <div id="seller_container">

   		<section id="seller_my">
            <div class="seller_myUp">
                ${sessionScope.loginID }님 환영합니다
                 <button type="button" class="memInfoUpdate">회원정보수정</button>
            </div>
            <div class="seller_btn">
                <button type="button" id="sellerRegiGoods" class="btn_renter">상품 등록하기</button>
                <button type="button" class="btn_renter" id="lentManage">대여 관리</button>
            </div>
        </section>
        <hr>

        <section id="seller_rental">
            <h2>등록하신 상품</h2>
            <ul class="item-ul">
                <li class="item">
                <c:forEach begin="0" end="2" step="1" items="${srental3 }" var="sellerRental3" varStatus="vs">
                
                    <c:if test="${empty srental3 }">
                     	<!-- 여기부분 꾸며줘야함 -->	
		 				<div>
							렌탈 중인 상품이 없습니다
						</div>
						 <!-- 여기부분 꾸며줘야함 -->
					</c:if>
					
					<c:if test="${ !empty srental3}">		         
	                    <div class="item-image">
	                       ${sellerRental3.imageName }
	                    </div>
	                    <div class="item-imageHover">
	                        <a href='sellerRental.do?seq=${sellerRental3.seq }' class="btn-rental"><span>상세보기</span></a>
	                    </div>
	                    <div class="item-detail">
	                        <em class="item-brand">${sellerRental3.brand } </em>
	                        <em class="item-goods">${sellerRental3.title }</em>
	                        <em class="item-price">${sellerRental3.price }</em>
	                    </div>
                    </c:if>
     			</c:forEach>
     			</li>
            </ul>
        </section>

        <hr>
        
        <section id="seller_qna">
            <h2>등록하신 문의 내역</h2>
            
            <jsp:useBean id="ubbs" class="kh.com.a.arrow.BbsArrow" />
            
            <ul id="qna_box">
            
                    <li class="qna_header">
                        <span class="qna_item">No</span>
                        <span class="qna_item">제목</span>
                       <div class="qna_item">
                            <span>작성자</span>
                            <span>작성일</span>
                            <span>조회수</span>
                       </div>
                    </li>
                    	<c:if test="${empty myqnalist}">
                    	<!-- 여기 꾸며줘야 함 -->
							<li>
								<div>작성된 글이 없습니다.</div>	
							</li>
						<!-- 여기 꾸며줘야 함 -->	
						</c:if>
				<c:forEach items="${myqnalist}" var="myqnalist" varStatus="vs">
				<jsp:setProperty property="dept" name="ubbs" value="${myqnalist.dept}" />
						
		                    <li class="review_itemOff">
		                        <a href="#" class="qna_click">
		                            <div class="qna_item_a">
		                                <span class="qna_no item_qna">${vs.count}</span>
		                                <jsp:getProperty property="arrow" name="ubbs" /> 
											<c:if test="${myqnalist.del == 0 }">
				                                	<a href='QnADetail.do?seq=${myqnalist.seq}'> ${myqnalist.title} </a>       
				                            </c:if> 
											<c:if test="${myqnalist.del == 1 }">
													이 글은 작성자에 의해서 삭제 되었습니다
														
											</c:if>   
		                                <div class="item_qna">
		                                    <span class="qna_id ">${myqnalist.id}</span>
		                                    <time class="qna_wdate">${myqnalist.wdate }</time>
		                                    <span class="qna_readCount">${myqnalist.readcount }</span>
		                                </div>
		                            </div>
		                        </a>
		                    </li>
                   
                    </c:forEach>
                </ul>
        </section>
		<!-- 페이징 처리 -->
		<div id="paging_wrap">
			<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
				<jsp:param value="${pageNumber }" name="pageNumber" />
				<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen" />
				<jsp:param value="${recordCountPerPage }" name="recordCountPerPage" />
				<jsp:param value="${totalRecordCount }" name="totalRecordCount" />
			</jsp:include>
		</div>
	</div>
<script type="text/javascript">
	function goPage(pageNumber) {
	$("#_pageNumber").val(pageNumber);
	$("#_frmFormSearch").attr("target", "_self").attr("action",
			"QnAlist.do").submit();
}


$(".memInfoUpdate").click(function() {
	//alert("userInfoUpdate 함수 실행");
	location.href = "updateInfo.do";
});

$("#lentManage").click(function() {
	alert("lentManage 함수 실행");
	location.href = "lentManage.do";
});



$("#sellerRegiGoods").click(function() {
	alert("sellerRegiGoods 함수 실행");
	location.href = "goodswrite.do";
});

$("#goQnADetail").click(function () {
	
	alert("QnADetail로 이동합니다");
	location.href = "QnADetail.do?seq="+$("#deseq").val();
	
});

</script>
	
	
  
</body>
</html>
