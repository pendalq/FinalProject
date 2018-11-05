<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="./smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>



<form name="frmForm" id="_frmForm" method="post">

<table class="table table-bordered" style="width:65%;margin: 30px auto">

<input type="hidden" name="seq" value="${bbs.seq}"/>

<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>

<tbody>	
<tr class="id">
	<th>아이디</th>
	<td style="text-align: left">${bbs.id}</td>
</tr>
<tr>	
	<th>카테고리</th>
	<td>
		<select name="category">
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
		<input size="60" type="text" name="title" value='${bbs.title}' >
	</td>
</tr>
<tr>
	<th>작성일</th>
	<td style="text-align: left">${bbs.wdate}</td>
</tr>
<tr>
	<th>내용</th>
	<td style="text-align: left"><textarea id="ir1" name="content">${bbs.content}</textarea></td>
</tr>
<tr>
	<td colspan="2" style="height:50px; text-align:center;">
		<span>
			<a href="#none" id="_btnUpdate" class="btn btn-default" title="글수정하기">수정하기</a>
		</span>
	</td>
</tr>

</tbody>
</table>

</form>

<script type="text/javascript">
$("#_btnUpdate").click(function() {	
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.
	/* alert('글수정하기'); */	
//	submitContents($("#_frmForm"));
	$("#_frmForm").attr({ "target":"_self", "action":"QnAUpdateAf.do" }).submit();
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

