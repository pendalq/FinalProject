<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">





<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="<c:out value="design/js/main.js"/>"></script>

<link rel="shortcut icon" type="image/x-icon"
	href="design/images/favicon.ico">
<link rel="apple-touch-icon" href="design/apple-touch-icon.png">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<%-- 
<!-- Bootstrap Fremwork Main Css -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/design/css/bootstrap.min.css"> --%>
<!-- All Plugins css -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/design/css/plugins.css">
<!-- Theme shortcodes/elements style -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/design/css/shortcode/shortcodes.css">
<!-- Theme main style -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/design/style.css">
<!-- Responsive css -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/design/css/responsive.css">
<!-- User style -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/design/css/custom.css">
	
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	

 
     <script src="<c:out value="design/js/vendor/jquery-1.12.4.min.js"/>"></script>
    <script src="<c:out value="design/js/popper.min.js"/>"></script>
    <script src="<c:out value="design/js/bootstrap.min.js"/>"></script>
    <script src="<c:out value="design/js/plugins.js"/>"></script>


<style>
.interList{
	cursor: pointer;
}

</style>


<div class="wrapper fixed__footer">
	<!-- Start Header Style -->
	<header id="header" class="htc-header">
		<!-- Start Mainmenu Area -->
		<div id="sticky-header-with-topbar"
			class="mainmenu__area sticky__header">
			<div class="container">
				<div class="row">
					<div class="col-md-2 col-lg-2 col-6">
						<div class="logo">
							<a href="mainbbslist.do"> <img src="image/logos.png"
								alt="logo">
							</a>
						</div>
					</div>
					<!-- Start MAinmenu Ares -->
					<div class="col-md-8 col-lg-8 d-none d-md-block">
						<nav class="mainmenu__nav  d-none d-lg-block">
							<ul class="main__menu">
								<li class="drop"><a href="mainbbslist.do">Home</a></li>
								<li><a href="./goodslist.do">상품정보</a></li>
								<li class="drop"><a href="./Noticelist.do">고객센터</a>
									<ul class="dropdown">
										<li><a href="./Noticelist.do">공지사항</a></li>
										<li><a href="./QnAlist.do">QNA</a></li>
									</ul></li>
							</ul>
						</nav>
					</div>
					<!-- End MAinmenu Ares -->
					<div class="col-md-2 col-lg-2 col-6">
						<ul class="menu-extra">


							<%if( request.getSession().getAttribute("loginID")   == null ){ %>

							<li><a href="#none" onclick="gologin()" title="LOGIN">Login</a></li>
							<li><a href="#none" onclick="regimem()" title="regimem">Register</a></li>

							<%} %>


							<%if(request.getSession().getAttribute("loginID") != null && 
               ((int)request.getSession().getAttribute("loginAuth")) == 1){ %>
               				<li><a href="#none" onclick="goMessage()" title="MESSAGE">Message</a></li>
							<li><a href="#none" onclick="gotomypage()" title="MYPAGE">Mypage</a></li>
							<li><a href="#none" onclick="memberlogout()" title="LOGOUT">Logout</a></li>
							<%} %>


							<%if(request.getSession().getAttribute("loginID") != null && 
                  ((int)request.getSession().getAttribute("loginAuth")) == 2){ %>
                  			<li><a href="#none" onclick="goMessage()" title="MESSAGE">Message</a></li>
							<li><a href="#none" onclick="gosellerpage()" title="PROFILE">Profile</a></li>
							<li><a href="#none" onclick="memberlogout()" title="LOGOUT">Logout</a></li>
							<%} %>
							
							<% if(request.getSession().getAttribute("loginID") != null &&
							((int)request.getSession().getAttribute("loginAuth")) == 3){%>
							<li><a href="#none" onclick="goMessage()" title="MESSAGE">Message</a></li>
							<li><a href="#none" onclick="memberlogout()" title="LOGOUT">Logout</a></li>
							<%} %>
							
							<%if(request.getSession().getAttribute("loginID") != null &&
							((int)request.getSession().getAttribute("loginAuth"))==4){ %>
								<li><a href="#none" onclick="goadmin()" title="admin">Admin</a></li>
							<%} %>		

							 <li class="toggle__menu d-none d-md-block"><span class="ti-menu"></span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- End Mainmenu Area -->
	</header>
	<!-- End Header Style -->

	<div class="body__overlay"></div>
	<!-- Start Offset Wrapper -->
	<input type="hidden" id="idname" value="${loginID }">
	<div class="offset__wrapper">

		<!-- Start Offset MEnu -->
		<div class="offsetmenu" id="interBtn">
			<div class="offsetmenu__inner">
				<div class="offsetmenu__close__btn">
					<a href="#"><i class="zmdi zmdi-close"></i></a>
				</div>
				<div class="off__contact">
					<div class="logo">
						<a href="mainbbslist.do"> <img src="images/logo/uniqlo.png"
							alt="logo">
						</a>
					</div>
					<p>관심상품</p>
					<div id="boardlist"></div>
				</div>

			</div>
		</div>
		<!-- End Offset MEnu -->
	</div>
	<!-- End Offset Wrapper -->
	
		<!-- Start Slider Area -->
	<div class="slider__container slider--one">
		<div class="slider__activation__wrap owl-carousel owl-theme">
			<!-- Start Single Slide -->
			<div class="slide slider__full--screen"
				style="background: rgba(0, 0, 0, 0) url(image/bgsmp.jpg) no-repeat scroll center center/cover;">
				<div class="container">
					<div class="row">
						<div
							class="col-md-8 col-lg-8 col-md-offset-2 col-lg-offset-4 col-sm-12 col-xs-12">
							<div class="slider__inner">
								<h1>
									New Product <span class="text--theme">Collection</span>
								</h1>
								<div class="slider__btn">
									<a class="htc__btn" href="./goodslist.do">shop now</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End Single Slide -->
		
		</div>
	</div>
	<!-- Start Slider Area -->






</div>

<script type="text/javascript">

function memberlogout() {
//	   alert("로그아웃");
	   location.href = "logout.do";
	}

	function gotomypage() {
//	   alert("마이페이지");
	   location.href="mypage.do";
	}

	function gosellerpage() {
//	   alert("셀러페이지");
	   location.href="sellerpage.do";
	}

	function gologin() {
//	   alert("로그인");
	   location.href="login.do";
	}
	function regimem() {
//	   alert("회원가입");
	   location.href="choiceRegi.do";
	}
	
	function goadmin() {
		//alert("관리자페이지");
		location.href="admin.do";
	}
	function goMessage() {
		window.open("message.do", '메세지', 'top=100px, left=100px, height=400px, width=420px');
	}

	





$(document).ready(function () {

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
				
				var str='<ul class="sidebar__thumd">';
				$.each(data,function(i, item){
					/* str+='<td>'+results[i].imageName+'</td>'; */
			//		alert(item.imageName);
			//		alert(item.gseq);
					var n=i+1;
			//		alert(n);
					str+='<li class="interList" id="list'+n+'">'+item.imageName+'</li>';
					/* str+='</ul>'; */
			/* 		str+='<li class="interList" id="list'+n+'"> */
					
					
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
