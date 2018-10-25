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

<style type="text/css">
/* .content {
padding-bottom: 10%;
}

 
.footer {

bottom: 0;
width: 100%;
height: 10%;
background-color: silver;

}
 */
</style>

</head>
<body>

<table width="100%" height="100%" border="0">

<tr> <!-- header -->
   <td style="position: static;">
      <tiles:insertAttribute name="header"/>
   </td>
</tr>
<tr>
	<td>
		<tiles:insertAttribute name="interGoods"/>
	</td>
</tr>
    

<tr>    <!-- menu, content -->
   <td>
      <tiles:insertAttribute name="main"/>
   </td>
</tr>

<tr>    <!-- footer -->
  <td class="footer">
      <tiles:insertAttribute name="footer"/>
   </td>
</tr>

</table>

</body>
</html>























