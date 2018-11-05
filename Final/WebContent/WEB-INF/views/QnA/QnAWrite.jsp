<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<html>
<style type="text/css">
#_frmForm{
 margin: 30px;
  
}
 .list_table,h1{
	margin-top :50px;
	 margin-left: auto;
 	margin-right: auto;
 	width: 80%;
}
 .list_table{
margin-bottom : 70px;
}
 #_frmForm th{
	float: right;
    padding-right: 13px;
    padding-top: 13px;
     
}
#_btnLogin{
	padding-top: 50px;
}
 #_btnLogin a{
text-decoration :none;
    border: 1px solid #d5d5d5;
    color: #4b4b4b;
    font-size: 25px;
    height: 40px;
    letter-spacing: 2px;
    line-height: 25px;
    padding: 0 70px;
    font-family: 'Poppins', sans-serif;
    background: #fff;
}
#_btnLogin a:hover {
	 border: 1px solid #ff4136;
	 color: #fff;
	 background: #ff4136;
	 font-family: 'Poppins', sans-serif;
	
} 
 input[type="text"]{
	height: 45px;
}
 </style>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="./smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<meta charset="UTF-8">
<title>공지 글쓰기</title>
</head>
<body>

<h1> Q & A </h1>
<form name="frmForm" id="_frmForm" method="post" action="bbswriteAf.do">

<table width="89%" class="list_table" style="width:85%;">
<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>


<%! String loginId; %>
<%

loginId =String.valueOf(request.getSession().getAttribute("loginID"));

%>


<tbody>	
	<tr class="id">
		<th>아이디</th>
		<td style="text-align: left">
			<input type="text" name="id" readonly="readonly" value=<%=loginId %> size="60" style="border: none;"/>
		</td>
	</tr>
	<tr>
		<th>카테고리</th>
		<td>
			<select name="category" style="height: 45px;">
				<option value="냉장고" selected="selected">냉장고</option>
				<option value="TV">TV</option>
				<option value="정수기">정수기</option>
				<option value="기타">기타</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>제목</th>
			<td style="text-align: left">
				<input type="text" name="title" size="60"/>
			</td>
	</tr>
	<tr>
		<th>내용</th>
		<td style="text-align: left">
		<textarea rows="25" cols="20" name='content' id="ir1"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" style="height:50px; text-align:center;">
			<p id="_btnLogin" title="글쓰기" href="#none">
			<span id="_btnLogin" title="글쓰기" href="#none">
			<a href="#none" id="_btnLogin" title="글쓰기">		
			  문의하기
		    </a>
		    </span>
	    </p></td>
	</tr>
</tbody>

</table>

</form>


<script type="text/javascript">
$("#_btnLogin").click(function() {	
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.
	/* alert('글작성');	 */
	$("#_frmForm").attr({ "target":"_self", "action":"QnAWriteAf.do" }).submit();	
});
</script>

<!-- Smart Editor -->
<script type="text/javascript">
      var oEditors = [];
      // 추가 글꼴 목록
      //var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
      nhn.husky.EZCreator.createInIFrame({
         oAppRef : oEditors,
         elPlaceHolder : "ir1",
         sSkinURI : "smarteditor/SmartEditor2Skin.html",
         htParams : {
            bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            //bSkipXssFilter : true,      // client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
            //aAdditionalFontList : aAdditionalFontSet,      // 추가 글꼴 목록
            fOnBeforeUnload : function() {
               //alert("완료!");
            }
         }, //boolean
         fOnAppLoad : function() {
            //예제 코드
            //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
         },
         fCreator : "createSEditor2"
      });
      function pasteHTML() {
         var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
         oEditors.getById["ir1"].exec("PASTE_HTML", [ sHTML ]);
      }
      function showHTML() {
         var sHTML = oEditors.getById["ir1"].getIR();
         alert(sHTML);
      } 
      function setDefaultFont() {
         var sDefaultFont = '궁서';
         var nFontSize = 24;
         oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
      }
</script>

</body>
</html>