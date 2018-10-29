<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/initial.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/table.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/button.css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   

   <script type="text/javascript" src="Design/js/popper.min.js"></script>
   <script type="text/javascript" src="Design/js/bootstrap.min.js"></script>
   <script type="text/javascript" src="Design/js/mdb.min.js"></script>

<style>

	
	#header_list{
		height: 30px;
		width: 100%;
	}
	
	#headerlist ul{
		list-style-type: none;
		margin: 0px;
		padding: 0px;
	}
	
	#headerlist ul li{
		color: white;
		background: #2d2d2d;
		float: left;
		line-height: 30px;
		vertical-align: middle;
		text-align: center;
		position: relative;
	}
	
	.menulink, .submenulink{
		text-decoration: none;
		display: block;
		width: 150px;
	}
	
	.menulink{
		color: white;
	}
 	
	.top_menu:hover .menulink{
	color: red;
	background-color: #4d4d4d;
}
 
	.submenulink{
		color: #2d2d2d;
		background-color: white;
		margin-top: -1px;
	}
	
	.hide{
		position: absolute;
		height: 0px;
		overflow: hidden;
		
	}

	.top_menu:hover .hide{
	height: 93px;
}

	.submenulink:hover {
	color: red;
	background-color: #dddddd;
}


	
	 
	
</style>




<fmt:requestEncoding value="utf-8"/>
<nav id="headerlist">
<div id="header_list" style="background-color: #2d2d2d;">
	<div id="menubar_top">
		<ul class="menubar_sub">
			<li class="top_menu"><a href="./mainbbslist.do" title="메인" class="menulink">메인</a></li>
			<li class="top_menu"><a href="./goodslist.do" title="상품정보" class="menulink">상품정보</a>
			<li class="top_menu"><a href="./Noticelist.do" title="상품정보" class="menulink">공지사항</a>
			<li class="top_menu"><a href="./QnAlist.do" title="QnA" class="menulink">QnA</a></li>
		</ul>
	</div>
</div>
</nav>

<script type="text/javascript">
/* $(function () {
	$("#top_menu").mouseover(function () {
		$(this).children("ul").show();
		$(this).find("a").addClass("on");
	});
	$("#top_menu li").mouseout(function () {
		$(this).children("ul").hide();
		$(this).find("a").removeClass("on");
	});
}); 

 */
/* if(typeof jQuery=='undefined'){
	alert("없음");
}else{
	alert("있음");
} */
</script>