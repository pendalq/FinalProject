<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>


<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>interGoods</title>
<style type="text/css">
	body{
	margin: 0;
	padding: 0;
	}
	
	.sidenav{
		height: 100%;
		width: 0;
		position: fixed;
		z-index: 1;
		top: 0;
		right: 0;
		background-color: #2d2d2d;
		overflow-x: hidden;
		padding-top: 53px;
	}
	
	.sidenav a{
		padding: 8px 8px 8px 32px;
		text-decoration: none;
		color: #818181;
		display: block;
		transition: 0.3s;
	}
	
	.slideBtn {
		transition: .5s;
		position: fixed;
		right: 0;
		font-size: 30px;
		cursor: pointer;
		margin-right: 10px;
	}
	
	
</style>

</head>
<body>
<input type="hidden" id="idname" value="${loginID }">



<div id="sidenav" class="sidenav" style="color: white;">
	<div id="slidebtn" class="slideBtn" style="color: white;"><a href="#" id="interBtn">&#9776;</a></div>
	<a href="#" style="color: white;">관심상품</a><br>
	<div>
		<table id="boardlist" style="color: white;">
			
		</table>
	</div>
</div>










<script type="text/javascript">
$(document).ready(function () {
	$(".slideBtn").click(function () {
		if($("#sidenav").width()==0){
			document.getElementById("sidenav").style.width="250px";
			document.getElementById("slidebtn").style.paddingRight="250px";
			$('td').css('cursor','pointer');
		}else{
			document.getElementById("sidenav").style.width="0";
			document.getElementById("slidebtn").style.paddingRight="0";
			
		}
	});
	
	
	
	$("#interBtn").click(function () {
		$.ajax({
			url:"youAreInterestedIn.do",
			type:"POST",
			data:{
				"command":"youAreInterestedIn",
				"id":$("#id").val()
			},
			success:function(data){
	//			alert("관심상품목록");
	//			var results = data.boardlist;
				
				var str='<tr>';
				$.each(data,function(i, item){
					/* str+='<td>'+results[i].imageName+'</td>'; */
			//		alert(item.imageName);
			//		alert(item.gseq);
					var n=i+1;
			//		alert(n);
					str+='<td id="list'+n+'">'+item.imageName+'</td>';
					str+='</tr>';
					
					
					
					$(document).on("click","#list"+n,function(){
					//	alert("click");
						location.href="goodsdetail.do?seq="+item.gseq;
					});
				});
				$("#boardlist").empty();
				$("#boardlist").append(str);


			},
			error:function(){
				alert("에러");
			}
		});
	});
	
	

	
	
	

});
</script>
</body>
</html>
