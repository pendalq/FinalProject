<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<table>
	<tr>
		<th>상품명</th>
		<td>${goods.title }</td>
	</tr>
	<tr>
		<th>상품분류</th>
		<td>${goods.category }</td>
	</tr>
	<tr>
		<th>가격</th>
		
		<td>${goods.price }</td>
	</tr>
	<tr>
		<th>구매자 이름</th>
		<td>${buyer.name }</td>
	</tr>
	<tr>
		<th>구매자 주소</th>
		<td>${buyer.address }</td>
	</tr>
	<tr>
		<th>구매자 전화번호</th>
		<td>${buyer.phone }</td>
	</tr>
	<tr>
		<td><a href="#none" id="_btnLogin" title="결제"><img src="image/bwrite.png" alt="결제" /></a></td>
	</tr>
</table>


<script type="text/javascript">
IMP.init("imp27698374");

$("_btnLogin").click(function(){
	//IMP.request_pay(param, callback) 호출
	IMP.request_pay({ // param
	    pg: "html5_inicis",
	    pay_method: "card",
	    merchant_uid: ${goods.seq },
	    name: ${goods.title },
	    amount: 0,
	    buyer_email: "gildong@gmail.com",
	    buyer_name: ${buyer.name },
	    buyer_tel: ${buyer.phone },
	    buyer_addr: ${buyer.address},
	    buyer_postcode: "00000"
	}, function (rsp) { // callback
	    if (rsp.success) {
	        
	    } else {
	        
	    }
	});	
});
</script>