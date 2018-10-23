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

<div style="width: 100%; height: 53px; border-bottom: 1px solid #5e5e5e; background-color: #2d2d2d;">
	<div style="width: 100%; height: 100%; clear: both; display: inline-block;">
		<div id="logo_image" style="width: 30%; float: left; display: inline;">
			<a href="mainbbslist.do"><img alt="" src="image/logo_s.png" style="height: 53px;"></a>
		</div>
		
		<div id="title_today" style="width: 70%; float: left; text-align: right; color: white;">
			<div style="position: relative; top: 27px;">
				
			 
		 <%if( request.getSession().getAttribute("loginID")   == null ){ %>
				 
					<a href="#none" onclick="gologin()" title="LOGIN" style="color: white;">LOGIN</a>
					
				<%} %>
		 
<%-- 		 
		 <%if(request.getSession().getAttribute("loginID") != null 
					 ){ %>
					<a href="#none" onclick="gosellerpage()" title="PROFILE" style="color: white;">PROFILE</a>
					<a href="#none" onclick="memberlogout()" title="LOGOUT" style="color: white;">LOGOUT</a>
				<%} %>
		 
\ --%>
 	
 			<%-- 	<%if( request.getSession().getAttribute("loginID")   == null ){ %>
				<c:if test="${empty loginID}">
					<a href="#none" onclick="gologin()" title="LOGIN" style="color: white;">LOGIN</a>
					
				<%} %> --%>
				
				<%if(request.getSession().getAttribute("loginID") != null && 
					((int)request.getSession().getAttribute("loginAuth")) == 1){ %>
					<a href="#none" onclick="gotomypage()" title="MYPAGE" style="color: white;">MYPAGE</a>
					<a href="#none" onclick="memberlogout()" title="LOGOUT" style="color: white;">LOGOUT</a>
				<%} %>
				
				
				<%if(request.getSession().getAttribute("loginID") != null && 
						((int)request.getSession().getAttribute("loginAuth")) == 2){ %>
					<a href="#none" onclick="gosellerpage()" title="PROFILE" style="color: white;">PROFILE</a>
					<a href="#none" onclick="memberlogout()" title="LOGOUT" style="color: white;">LOGOUT</a>
				<%} %>
 
				
				
				
				<c:if test="<%-- 이름 --%>">
					login.name
				</c:if>
				
				<fmt:formatDate var="presenttime" value="${presenttime }" pattern="yyyy/MM/dd"/>${presenttime }
			</div>
		</div>
	</div>
</div>

<script>
function memberlogout() {
	alert("로그아웃");
	location.href = "logout.do";
}

function gotomypage() {
	alert("마이페이지");
	location.href="mypage.do";
}

function gosellerpage() {
	alert("셀러페이지");
	location.href="sellerpage.do";
}

function gologin() {
	alert("로그인");
	location.href="login.do";
}
</script> 