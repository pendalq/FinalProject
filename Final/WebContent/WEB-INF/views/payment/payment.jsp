<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<table style="border: 2px solid black">
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
		<td>${goods.imageName }</td>
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
		<td>총 금액 : <span id="allprice" style="align: right;">${goods.price }</span>원</td>
	</tr>
	<tr>
		<td><a href="#none" id="getpay" title="결제" style="text-align: right">결제</a></td>
	</tr>
</table>


<script type="text/javascript">

$(document).ready(function(){
	IMP.init("imp27698374");
});

$("#getpay").click(function(){
	var IMP = window.IMP;
	//IMP.request_pay(param, callback) 호출
	 IMP.request_pay({
	pg : 'kakao', // 결제방식
    pay_method : 'card',	// 결제 수단
    merchant_uid : '${loginID}' + new Date().getTime(),
   	name : '${goods.title}:결제테스트',	// order 테이블에 들어갈 주문명 혹은 주문 번호
    amount : '0',	// 결제 금액
    buyer_email : '',	// 구매자 email
   	buyer_name :  '${buyer.name}',	// 구매자 이름
    buyer_tel :  '${buyer.phone}',	// 구매자 전화번호
    buyer_addr :  '${buyer.address}',	// 구매자 주소
    buyer_postcode :  '',	// 구매자 우편번호
   // m_redirect_url : './rental.do?seq=${goods.seq}'	// 결제 완료 후 보낼 컨트롤러의 메소드명
	}, function(rsp) {
		if ( rsp.success ) { // 성공시
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;
		} else { // 실패시
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
		}
	}
);
});

$("#term").on("change",function(){
	$("#allprice").text($("#term option:selected").val()*${goods.price});
});
</script>