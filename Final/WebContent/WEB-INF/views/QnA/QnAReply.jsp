<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>


<script type="text/javascript" src="./smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>



<table class="list_table" style="width:85%;">
<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>

<tbody>	

<tr class="id">
	<th>아이디</th>
	<td style="text-align: left">${qna.id}</td>
</tr>
<tr>
	<th>제목</th>
	<td style="text-align: left">
		<input size="60" type="text" name="title" value='${qna.title}' >
	</td>
</tr>
<tr>
	<th>작성일</th>
	<td style="text-align: left">${qna.wdate}</td>
</tr>
<tr>
	<th>내용</th>
	<td style="text-align: left; width: 300px; height: 300px">${qna.content}</td>
</tr>
</tbody>

</table>

<hr/>
<h3>답글</h3>

<form name="frmForm" id="_frmForm" method="post" action="bbsreplyAf.do">
<input type="hidden" name="seq"   value="${qna.seq}"/>
<input type="hidden" name="category" value="${qna.category }">
<table class="list_table" style="width:85%;">
<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>

<tbody>	

<tr class="id">
	<th>아이디</th>
	<td style="text-align: left"><input type="text" name="id" readonly="readonly" 
	value='${loginId}' size="60"/></td>
</tr>
<tr>
	<th>제목</th>
	<td style="text-align: left"><input type="text" name="title" size="60"/></td>
</tr>
<tr>
	<th>내용</th>
	<td style="text-align: left">
		<textarea rows="10" cols="50" name='content' id="ir1"></textarea>
	</td>
</tr>
<tr>
<td colspan="2" style="height:50px; text-align:center;">
	<span>
	<a href="#none" id="_btnReply" title="답글달기"><img src="image/breply.png" alt="답글달기" /></a>
	</span>
</td>
</tr>

</tbody>

</table>
</form>

<script type="text/javascript">
$("#_btnReply").click(function() {	
	/* alert('답글달기');	 */
	$("#_frmForm").attr({ "target":"_self", "action":"QnAreplyAf.do" }).submit();
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