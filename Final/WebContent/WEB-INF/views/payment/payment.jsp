<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
table td{
vertical-align: middle !important;
}
</style>


<table class="table table-bordered" style="width: 80%;margin-left: auto;margin-right: auto; margin-top: 20px">
	<tr>	
		<th>상품 이미지</th>
		<th>상품명</th>
		<th>상품분류</th>
		<th>가격</th>
		<th>구매자 이름</th>
		<th>구매자 주소</th>
		<th>구매자 전화번호</th>
		<th>대여기간</th>
	</tr>
	<tr>
		<td><div style="width: 100px;">${goods.imageName }</div></td>
		<td>${goods.title }</td>
		<td>${goods.category }</td>
		<td>월 ${goods.price }원</td>
		<td>${buyer.name }</td>
		<td>${buyer.address }</td>
		<td>${buyer.phone }</td>
		<td>
			<select id="term">
				<%
				for(int i = 1; i < 13 ; i++)
				{ 
				%>
				<option><%=i %></option>
				<%} %>
			</select>
			개월
		</td>
	</tr>
	<tr>
		<td colspan="8" style="text-align: right;">총 금액 : <span id="allprice">${goods.price }</span>원</td>
	</tr>
	<tr>
		<td colspan="8" style="text-align: right;"><button id="getpay" title="결제">결제</button></td>
	</tr>
</table>


<script type="text/javascript">

$(document).ready(function(){
	IMP.init("imp27698374");
});

$("#getpay").click(function(){
	
/* 	var IMP = window.IMP;
	//IMP.request_pay(param, callback) 호출
	IMP.request_pay({
	    pg : 'kakao', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : 100,
	    buyer_email : '',
	    buyer_name : '${buyer.name}',
	    buyer_tel : '${buyer.phone}',
	    buyer_addr : '${buyer.address}',
	    buyer_postcode : '123-456',
	    //m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	}, function(rsp) {
	    if ( rsp.success ) {
	      var msg = '결제가 완료되었습니다.'; */
	      location.href="./paysuccess.do?id=${loginID}&gseq=${goods.seq}&term="+$('#term option:selected').val();
/* 	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	}); */
}); 

$("#term").on("change",function(){
	$("#allprice").text($("#term option:selected").val()*${goods.price});
});
</script>