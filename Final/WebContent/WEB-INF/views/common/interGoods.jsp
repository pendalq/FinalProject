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
<div id="sidenav" class="sidenav">
   <div id="slidebtn" class="slideBtn" style="color: white;">&#9776;</div>
   <a href="#" style="color: white;">관심상품</a>
</div>









<script type="text/javascript">
$(document).ready(function () {
   $(".slideBtn").click(function () {
      if($("#sidenav").width()==0){
         document.getElementById("sidenav").style.width="250px";
         document.getElementById("slidebtn").style.paddingRight="250px";
      }else{
         document.getElementById("sidenav").style.width="0";
         document.getElementById("slidebtn").style.paddingRight="0";
      }
   });
});
</script>
</body>
</html>