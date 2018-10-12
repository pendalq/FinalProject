<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<form name="frmForm" id="_frmForm" action="goodswriteAf.do" method="post" 
enctype="multipart/form-data">
<table class="list_table">
<colgroup>
<col style="width:100px;" />
<col style="width:auto;" />
</colgroup>

<tr>
<th>아이디</th>
<td style="text-align: left"><input type="text" name='id' readonly="readonly"
value="id" size="50"/></td>
</tr>
<tr>
<th>제목</th>
<td style="text-align: left"><input type="text" name='title' size="50"/></td>
</tr>
<tr>
<th>파일업로드</th>
<td style="text-align: left">
<input type="file" name="image" id="image" style=" width : 400px;">
<div>
<img id="image_section" src="">
</div>
</td>
</tr>
<tr>
<th>카테고리</th>
<td>
<select id="category">
<option value="Refrigerator" selected="selected">냉장고</option>
<option value="purifier">정수기</option>
<option value="TV">TV</option>
</select>
</td>
</tr>
<tr>
<th>옵션</th>
<td id="option">

</td>
</tr>
<tr>
<th>내용</th>
<td style="text-align: left"><textarea id="ir1" name="content" style="height: 600px; width: 800px"></textarea></td>
</tr>
<tr>
<td colspan="2" style="height:50px; text-align:center;">
	<span><a href="#none" id="_btnLogin" title="글쓰기" onclick="submitContents(this)"><img src="image/bwrite.png" alt="로그인" /></a>
</span>
</td>
</tr>
</table>
</form>

<script type="text/javascript">
$('#category').change(function(){
	if(this.value == "Refrigerator"){
		$('#option').append("<table><tr><th>제조사</th><td><span><input type='radio' id='lg' name='brand' value='lg' checked='checked'>LG <input type='radio' id='samsung' name='brand' value='samsung'>samsung <input type='radio' id='daewoo' name='brand' value='daewoo'>daewoo </td></tr></span>"
		 + "<tr><th>용량</th><td><span><input type='radio' id='100L' name='liter' value='100L' checked='checked'>100L <input type='radio' id='200L' name='liter' value='200L'>200L <input type='radio' id='300L' name='liter' value='300L'>300L </td></tr></table>");
	}else if(this.value == "purifier"){
		
	}else if(this.value == "TV"){
		
	}
});
</script>

<script type="text/javascript">
function readURL(input) {
	
    if (input.files && input.files[0]) {
        var reader = new FileReader();
 
        reader.onload = function (e) {
            $('#image_section').attr('src', e.target.result);
        }
 
        reader.readAsDataURL(input.files[0]);
    }
}
 
$("#image").change(function(){
    readURL(this);
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
      function submitContents(elClickedObj) {
         oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.
         // 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
         try {
            elClickedObj.form.submit();
         } catch (e) {
         }
      }
      function setDefaultFont() {
         var sDefaultFont = '궁서';
         var nFontSize = 24;
         oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
      }
</script>

<script type="text/javascript">
$("#_btnLogin").click(function() {	
	alert('글쓰기');	
	$("#_frmForm").submit();	
});
</script>


