<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<fmt:requestEncoding value="utf-8"/> 

<c:if test="${(empty login) or (login.id eq '') }">
<%
	session.invalidate();
%>
<script>
alert("로그인 해 주십시오");
self.location.href = "login.do";

</script>

</c:if>