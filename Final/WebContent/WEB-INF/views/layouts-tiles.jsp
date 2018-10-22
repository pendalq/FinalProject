<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- <% request.setCharacterEncoding("utf-8"); %> --%>
<fmt:requestEncoding value="utf-8"/>    

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>

<!-- header -->
	<div>
		<tiles:insertAttribute name="header"/>
	</div>
	<div>
		<tiles:insertAttribute name="header_second"/>
	</div>
	
	<!-- leftMain -->
	<div>
		<tiles:insertAttribute name="interGoods"/>	
	</div>

	<!-- menu, content -->
	<div>
		<tiles:insertAttribute name="content"/>
	</div>


 	<!-- footer -->
	<div>
		<tiles:insertAttribute name="footer"/>
	</div>


</div>

</body>
</html>
























