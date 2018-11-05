<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  


<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.UserRegiForm{
	margin-left : auto;
	margin-right : auto;  
	padding: 30px 40px;
	width: 60%
	 
}
.UserRegitb{
	width : 100%;
	padding-top: 20px;
    padding-bottom: 40px; 
  
      
}
.UserRegitb th{
 	padding: 11px 0 10px 18px;
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
.UserRegitb td{
	padding: 11px 10px 10px;
    border-top: 1px solid #ddd;
    color: #353535;
    vertical-align: middle;
    
}
.UserRegitb a{
	text-decoration:none;
	text-align: center;
    font-size: 11px;
    padding: 5px 10px 3px 10px;
    background: #f7f7f7;
    color: #a2a2a2;
    border: 1px solid #e7e7e7;
    border-radius: 3px;
    line-height: 100%;
    overflow: hidden;
    transition: all 0.5s;
	/*
	//다른 색
	text-decoration:none;
	display: inline-block;
    
    
    padding: 0 10px;
    background: #333;
    color: #fff;
    font-size: 13px;
    font-weight: 300;
     
    line-height: 29px;
    vertical-align: middle;
     border-radius: 2px; 
     
     font-family:'NanumBarunGothicWeb'; */
}
 input[type=button] { 
    /* background: #fff;
    color: #444!important;
    border-color: #ddd;   
	cursor: pointer; */
	
	    text-decoration: none;
    text-align: center;
    font-size: 11px;
    padding: 5px 10px 3px 10px;
    background: #f7f7f7;
    color: #a2a2a2;
    border: 1px solid #e7e7e7;
    border-radius: 3px;
    line-height: 100%;
    overflow: hidden;
    transition: all 0.5s	
} 
 input[type=button]:hover { 
    background: #eeeeee;
    color: #444!important;
    border-color: #ddd;   
	cursor: pointer;	
} 

 .movelinkbutton a{
	text-decoration:none;
    font-size: 11px;
    curcor: pointer;
    height: 30px;
    line-height: 30px;
    border-radius: 3px;
	overflow: hidden;
    transition: all 0.5s; 
    padding: 10px;
    letter-spacing: 2px;
    margin: 5px;
    font-size: 15px;	
   
  
} 

.movelinkbutton a:hover{
border: 1px solid #ff4136;
   color: #fff;
   background: #ff4136;
   font-family: 'Poppins', sans-serif;	
   
  
} 
#regiBTN{
	color: #353535;
    background: #ffffff;
    border: 1px solid #cbcbcb;
    
    
}
#regiBTN:hover{
   border: 1px solid #ff4136;
   color: #fff;
   background: #ff4136;
   font-family: 'Poppins', sans-serif;
	
	
}
#cancelBTN{
    color: #353535;
    background: #ffffff;
    border: 1px solid #cbcbcb;
}
#cancelBTN:hover{
    border: 1px solid #ff4136;
   color: #fff;
   background: #ff4136;
   font-family: 'Poppins', sans-serif;
	
}



h3{
	margin-left : auto;
	margin-right : auto;  
	margin-bottom : 20px;
	font-family: '나눔고딕','Nanum Gothic';
  	font-style: italic;
  	font-size: 24px;
  	
}
input[type="text"]{
	padding: 5px;
	width: 80%; 

}
input[type="password"]{
	padding: 5px;
	width: 80%; 

}
 


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="UserRegiForm">
	<h3>개인 회원 등록</h3>
	<form action="" method="post" id="_regiForm" name="regiForm">
		<div class="UserRegitb">				
			<table class="UserRegiTb" style="width: 100%; border: 1px solid #ddd;" >
				<colgroup>
					<col style="width:30%">
					<col style="width:70%">
				</colgroup>					
				<tr>
					<th style="height: 72px;">아이디</th>
						<td>
							<input type="text" id="c_id" size="30" placeholder="아이디 입력">
							<a href="#none" id="_btnGetId" title="중복확인">중복확인</a>		
							<div id="_rgetid"></div>
							<input type="hidden" name="id" id="_userid" size="30" data-msg="아이디를" readonly="readonly">
						</td>					
					</tr>
					<tr>
						<th>패스워드</th>
						<td>
							<input type="password" name="pw" id="_pw" size="30" data-msg="패스워드를"  maxlength="14" placeholder="15자 이하의 비밀번호 입력">
						</td>	
					</tr>
					<tr>
						<th height="60">패스워드 확인</th>
						<td height="60">
							<input type="password" name="pwck" id="_pwck" size="30" data-msg="패스워드를"  maxlength="14" placeholder="15자 이하의 비밀번호 입력">
							<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
                        	<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
						</td>
						
							
					</tr>
					
					<tr>
						<th>이름</th>
						<td>
							<input type="text" name="name" id="_name" size="30" data-msg="이름을 " required="required" autofocus="autofocus" maxlength="19" placeholder="이름">
						</td>	
					</tr>
					
					<tr>
						<th>연락처</th>
						<td>
							<input type="text" name="phone" id="_phone" size="10" data-msg="연락처를 " placeholder="연락처 입력" autofocus required maxlength="13">
						</td>	
					</tr>
					
					<tr>
						<th>주소</th>
						<td>
							<input type="text" name="address" id="_address" size="60" data-msg="주소를 ">
							<input type="button" onclick="execDaumPostcode()" value="주소 검색"><br>
							<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
						</td>	
					</tr>
			
					</table>
				</div>
				<div class="movelinkbutton" style="text-align: center">
						<input type="hidden" value="1" name="auth">
						<a href="#none" id="regiBTN" title="회원가입">회원가입</a>
						<a href="#none" id="cancelBTN" title="가입취소">가입 취소</a>
				</div>			
			</form>
		</div>					
<script type="text/javascript">
//아이디 문자 입력 제한
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
$("#_btnGetId").click(function() {
	var id = $("#c_id").val();
	if(id == ""){
		alert("아이디를 입력해 주십시오");
	}else{
		idCheckFunc(id);
	}	
});

$("#cancelBTN").click(function() {
	location.href="login.do"; 
});

function idCheckFunc(id) {
	//alert("idCheckFunc");
	
	$.ajax({
		
		type:"post",
		url:"checkID.do",
		async:true,
		data:"id=" + id,
		success:function(msg){
		
			idCheckMsg(msg);
		},
	 	error : function(){
            alert("ajax error");
        }


	});
}	
function idCheckMsg(msg) {
	
		if(msg.message == 'YES'){
			$("#_rgetid").html("사용할 수 없는 아이디");
			$("#_rgetid").css("background-color", "#ff0000");
			$("#_rgetid").val("");		
		}else{
			$("#_rgetid").html("사용가능 아이디");
			$("#_rgetid").css("background-color", "#0000ff");
			$("#_userid").val( $("#c_id").val() );		
		}		
	
	}
	
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



<script type="text/javascript">
//회원가입버튼 눌렀을때
$("#regiBTN").click(function() {
	if($("#_userid").val()==""){
		alert($("#_userid").attr("data-msg") +"확인해 주세요");
		$("#_userid").focus();
	} 
	else if($("#_pw").val() == ""){
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
	}
	
	
	
	else{	 
		$("#_regiForm").attr("action","regiAF.do").submit();
	} 
	
		
});
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