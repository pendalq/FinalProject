<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>

<style type="text/css">
.content_table th{
	padding: 11px 1px 10px 18px;
    border: 1px solid #ddd;
    border-bottom-width: 0;
    color: #353535;
    text-align:   center;
   /*  background: #eeeeee;  */
   background-color: #fafafa;
    font-weight:bold !important;
    font-size: smaller;
    vertical-align: middle; 
	width: 30%;


}
.content_table td{
	padding: 11px 10px 10px;
    border-top: 1px solid #ddd;
    color: #353535;
    vertical-align: middle;


}

 input[type=button] { 
    background: #fff;
    color: #444!important;
    border-color: #ddd;   
	cursor: pointer;	
} 

.updateInfoForm{
	margin-left : auto;
	margin-right : auto;  
	padding: 30px 30px;
	width : 60%;
}

.movelinkbutton a{
text-decoration :none;
    border: 1px solid #d5d5d5;
    color: #4b4b4b;
    font-size: 20px;
    height: 45px;
    letter-spacing: 2px;
    line-height: 45px;
    padding: 0 70px;
    font-family: 'Poppins', sans-serif;
    margin-top: 40px;

}
.movelinkbutton a:hover{
	border: 1px solid #ff4136;
    color: #fff;
    background: #ff4136;
   font-family: 'Poppins', sans-serif;	
}



input[type="text"]{
	padding: 5px;
		border : none;
}
input[type="password"]{
	padding: 5px;
		border : none;
}
h3{
	margin-left : auto;
	margin-right : auto;  
	margin-bottom : 20px;
	font-family: '나눔고딕','Nanum Gothic';
  	font-style: italic;
  	font-size: 24px;
  	
  	
}
#_userid{
boder="none";
}
 
</style>
</head>
<body>

<div class="updateInfoForm">
<c:if test="${memdto.auth eq 1}">

		<form action="" method="post" id="_updateForm" name="updateForm">	
			<div class="updateInfotb">
				<h3>회원 정보 수정</h3>
				<table class="content_table" style="width: 75%">
					<colgroup>
						<col style="width:30%">
						<col style="width:70%">
					</colgroup>	
					
				
					<tr>
						<th>아이디</th>
						<td>
							<input type="hidden" value="${memdto.auth }">
							<input type="text" name="id" id="_userid" size="30"  readonly="readonly" value="${memdto.id }" boder="none">
						</td>	
					</tr>
					
					
					<tr>
						<th>패스워드</th>
						<td>
							<input type="password" name="pw" id="_pw" size="30" data-msg="패스워드를1"  maxlength="14" placeholder="15자 이하의 비밀번호 입력">
						</td>	
					</tr>
					<tr>
						<th height="60">패스워드 확인</th>
						<td style="height: 65">
							<input type="password" name="pwck" id="_pwck" size="30" data-msg="패스워드를2"  maxlength="14" placeholder="15자 이하의 비밀번호 입력">
							<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
                        	<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
						</td>
						
							
					</tr>
					<tr>
						<th>이름</th>
						<td>
							<input type="text" name="name" id="_name" size="30" value="${memdto.name }" required="required" autofocus="autofocus"  data-msg="이름을" >
						</td>	
					</tr>
					<tr>
						<th>연락처</th>
						<td>
							<input type="text" name="phone" id="_phone" size="30" value="${memdto.phone} " required="required" autofocus="autofocus"  data-msg="연락처를" >
						</td>	
					</tr>
					
					<tr>
						<th>주소</th>
						<td>
							<input type="text" name="address" id="_address" size="50" data-msg="주소를 " value="${memdto.address} ">
							<input type="button" onclick="execDaumPostcode()" value="주소 검색"><br>
							<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
						</td>	
					</tr>
					<tr>
						<td colspan="2" height="40px;" ,margin-top: 20px;">
							<div class="movelinkbutton" style="text-align: center">
							<a href="#none" id="updateInfo" title="정보수정">정보수정</a>
							<a href="mypage.do" id="gomypage">마이페이지로</a>
							</div>
						</td>	
					</tr>			
				</table>
			</div>	
		</form>
</c:if>
			
			
			
			
			<c:if test="${memdto.auth eq 2 || memdto.auth eq 3 }">

		<form action="" method="post" id="_updateForm" name="updateForm" >	
				<table class="content_table" style="width: 75%">
					<colgroup>
						<col style="width:30%">
						<col style="width:70%">
					</colgroup>	
					
				
					<tr>
						<th>아이디</th>
						<td>
							<input type="hidden" value="${memdto.auth }">
							<input type="text" name="id" id="_userid" size="30"  readonly="readonly" value="${memdto.id }">
						</td>	
					</tr>
					<tr>
						<th>패스워드</th>
						<td>
							<input type="password" name="pw" id="_pw" size="30" data-msg="패스워드를3"  maxlength="14" placeholder="15자 이하의 비밀번호 입력" value="">
						</td>	
					</tr>
					<tr>
						<th>패스워드 확인</th>
						<td>
							<input type="password" name="pwck" id="_pwck" size="30" data-msg="패스워드를4"  maxlength="14" placeholder="15자 이하의 비밀번호 입력">
							<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
                        	<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
						</td>
						
							
					</tr>
					
					<tr>
						<th>사업장 주소</th>
						<td>
							<input type="text" name="address" id="_address" size="30" required="required" value="${memdto.address }" autofocus="autofocus" value="${memdto.address} ">
						</td>	
					</tr>
					
					<tr>
						<th>사업장 연락처</th>
						<td>
							<input type="text" name="phone" id="_phone" size="30" value="${memdto.phone} " required="required" autofocus="autofocus">
						</td>	
					</tr>
					
					<tr>
						<th>기업 이름</th>
						<td>
							<input type="text" name="name" id="_name" size="30" value="${memdto.name }" required="required" autofocus="autofocus">
						</td>	
					</tr>
					<tr>
						<div class="movelinkbutton" style="text-align: center">
						<td colspan="2">
							
							<a href="#none" id="updateInfo" title="정보수정">정보수정</a>
							<a href="mypage.do" id="gomypage" title="미이페이지로">마이페이지로</a>
							
						</td>
						</div>	
					</tr>			
				</table>
			</form>
		
			</c:if>
			
</div>		 
<script type="text/javascript">
//회원가입버튼 눌렀을때
$("#updateInfo").click(function() {
	
	
	if($("#_pw").val() == ""){
		alert($("#_pw").attr("data-msg") + " 확인해 주십시오");
		$("#_pw").focus();
	}else if($("#_pwck").val() == ""){
		alert($("#_pwck").attr("data-msg") + " 확인해 주십시오");
		$("#_pwck").focus();
	}else if($("#_pw").val()  != $("#_pwck").val() ){
		alert($("#_pw").attr("data-msg") + " 확인해 주십시오");
	
		
		
		
	}else if($("#_name").val() == ""){
		alert($("#_name").attr("data-msg") + " 확인해 주십시오");
		$("#_name").focus();
	} 
	else if($("#_phone").val() == ""){
		alert($("#_phone").attr("data-msg") + " 확인해 주십시오");
		$("#_phone").focus();
	
	}else if($("#_address").val() == ""){
		alert($("#_address").attr("data-msg") + " 확인해 주십시오");
		$("#_address").focus();
	}else{	 
		$("#_updateForm").attr("action","updateInfoAf.do").submit();
	} 
	
		
});
 </script>		 
		 
<script type="text/javascript">
//비밀번호 입력제한
$(function(){
   
    $("#alert-success").hide();
    $("#alert-danger").hide();
    $("input").keyup(function(){
        var pwd=$("#_pw").val();
        var pwdCheck=$("#_pwck").val();
        if(pwd != "" || pwdCheck != ""){
            if(pwd == pwdCheck){
                $("#alert-success").show();
                $("#alert-danger").hide();
                $("#submit").removeAttr("disabled");
            }else{
                $("#alert-success").hide();
                $("#alert-danger").show();
                $("#submit").attr("disabled", "disabled");
            }    
        }
    });
});
</script>

<script type="text/javascript">
//이름 특수문자 입력 제한
$(document).ready(function() {

    $("input[name=name]").keyup(function(event){

     regexp = /[0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
     v = $(this).val();
     if( regexp.test(v) ) {
      alert("한글 및 영문만 기입해주세요");
      $(this).val(v.replace(regexp,''));
     }
    });

   });
</script>
<script type="text/javascript">
//연락처 입력제한
var phone =document.getElementById('_phone');
phone.onkeyup = function(event){
event = event || window.event;
var _val = this.value.trim();
this.value = autoHypenPhone(_val) ;
};


function autoHypenPhone(str) {
str = str.replace(/[^0-9]/g, '');
var tmp = '';
if (str.length < 4) {
   return str;
} else if (str.length < 7) {
   tmp += str.substr(0, 3);
   tmp += '-';
   tmp += str.substr(3);
   return tmp;
} else if (str.length < 11) {
   tmp += str.substr(0, 3);
   tmp += '-';
   tmp += str.substr(3, 3);
   tmp += '-';
   tmp += str.substr(6);
   return tmp;
} else {
   tmp += str.substr(0, 3);
   tmp += '-';
   tmp += str.substr(3, 4);
   tmp += '-';
   tmp += str.substr(7);
   return tmp;
}
return str;
}
</script>
<!-- 주소검색 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=발급받은 API KEY를 사용하세요&libraries=services"></script>
 
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("_address").value = fullAddr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script> 
 



</body>
</html>