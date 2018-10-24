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
<td style="text-align: left"><input type="text" id='id' name='id' readonly="readonly"
value="${loginID }"  size="50"/></td>
</tr>
<tr>
<th>제목</th>
<td style="text-align: left"><input type="text" id="title" name='title' size="50"/></td>
</tr>

<tr>
<th>파일업로드</th>
<td style="text-align: left">
<input type="file" name="fileload" id="fileload" style=" width : 400px;">
<div>
<img id="image_section" src="">
</div>
</td>
</tr>


<tr>
<th>카테고리</th>
<td>
<select id="categorys">
<option value="Refrigerator" selected="selected">냉장고</option>
<option value="purifier">정수기</option>
<option value="TV">TV</option>
</select>
<input type="hidden" id="category" name="category" value="">
</td>
</tr> 



<tr>
<th>옵션</th>
<td id="option">
<table>
	<tr>
		<th>제조사</th>
		<td>
			<input type='radio' id='lg' name='brands' value='lg' checked='checked'>LG 
			<input type='radio' id='samsung' name='brands' value='samsung'>samsung 
			<input type='radio' id='daewoo' name='brands' value='daewoo'>daewoo 
		</td>
	</tr>
	<tr>
		<th>품목</th>
		<td>
			<input type="radio" id='four' name='subject' value="fourDoor" checked="checked">4문형
			<input type="radio" id='three' name='subject' value="threeDoor">3문형
			<input type="radio" id='double' name='subject' value="doublegateDoor">양문형
			<input type="radio" id='normal' name='subject' value="normal">일반형
		</td>
	</tr>
	<tr>
		<th>용량</th>
		<td>
			<input type='text' id='liter' style="width: 200px; text-align: right;" >L
		</td>
	</tr>
	<tr>
		<th>에너지효율</th>
		<td>
			<input type="radio" id="first" name="efficiency" value="first_effi" checked="checked">1등급
			<input type="radio" id="second" name="efficiency" value="second_effi">2등급
			<input type="radio" id="third" name="efficiency" value="third_effi">3등급
			<input type="radio" id="fourth" name="efficiency" value="fourth_effi">4등급
			<input type="radio" id="fifth" name="efficiency" value="fifth_effi">5등급
		</td>
	</tr>
</table>
<input type="hidden" id="brand" name="brand" value="">
<input type="hidden" id="options" name="options" value="">
</td>
</tr>



<tr>
<th>가격</th>
<td><input type="text" id='price' name="price" style="width: 100%"></td>
</tr>
<tr>
<th>내용</th>
<td style="text-align: left"><textarea id="ir1" name="content" style="height: 600px; width: 800px"></textarea></td>
</tr>

<tr>
<td colspan="2" style="height:50px; text-align:center;">
	<span><a href="#none" id="_btnLogin" title="글쓰기"><img src="image/bwrite.png" alt="로그인" /></a>
</span>
</td>
</tr>
 

</table>
</form>





<script type="text/javascript">
$('#categorys').change(function(){
	if(this.value == "Refrigerator"){
		$('#option').empty().append("<table><tr><th>제조사</th><td><input type='radio' id='lg' name='brands' value='lg' checked='checked'>LG "
				+"<input type='radio' id='samsung' name='brands' value='samsung'>samsung "
				+"<input type='radio' id='daewoo' name='brands' value='daewoo'>daewoo "
				+"</td></tr><tr><th>품목</th><td>"
				+"<input type='radio' id='four' name='subject' value='fourDoor' checked='checked'>4문형"
				+"<input type='radio' id='three' name='subject' value='threeDoor'>3문형"
				+"<input type='radio' id='double' name='subject' value='doublegateDoor'>양문형"
				+"<input type='radio' id='normal' name='subject' value='normal'>일반형"
				+"</td></tr><tr><th>용량</th><td>"
				+"<input type='text' id='liter' style='width: 200px; text-align: right;' >L "
				+"</td></tr><tr><th>에너지효율</th><td>"
				+"<input type='radio' id='first' name='efficiency' value='first_effi' checked='checked'>1등급"
				+"<input type='radio' id='second' name='efficiency' value='second_effi'>2등급"
				+"<input type='radio' id='third' name='efficiency' value='third_effi'>3등급"
				+"<input type='radio' id='fourth' name='efficiency' value='fourth_effi'>4등급"
				+"<input type='radio' id='fifth' name='efficiency' value='fifth_effi'>5등급"
				+"</td></tr>"
				+"<input type='hidden' id='brand' name='brand' value=''>"
				+"<input type='hidden' id='options' name='options' value=''></table>");
	}else if(this.value == "purifier"){
		$('#option').empty().append("<table><tr><th>제조사</th><td>"
				+"<input type='radio' id='lg' name='brands' value='lg' checked='checked'>LG "
				+"<input type='radio' id='skmagic' name='brands' value='skmagic'>skmagic "
				+"<input type='radio' id='picogram' name='brands' value='picogram'>picogram "
				+"</td></tr><tr><th>품목</th><td>"
				+"<input type='radio' id='hotcool' name='subject' value='hotcool' checked='checked'>냉온정수기"
				+"<input type='radio' id='cold' name='subject' value='cold'>냉정수기"
				+"<input type='radio' id='ice' name='subject' value='ice'>얼음정수기"
				+"</td></tr><tr><th>형태</th><td>"
				+"<input type='radio' id='middle' name='shape' value='middle' checked='checked'>미들형"
				+"<input type='radio' id='stand' name='shape' value='stand'>스탠드형"
				+"<input type='radio' id='undersink' name='shape' value='undersink'>언더씽크형"
				+"</td></tr>"
				+"<input type='hidden' id='brand' name='brand' value=''>"
				+"<input type='hidden' id='options' name='options' value=''></table>");
	}else if(this.value == "TV"){
		$('#option').empty().append("<table><tr><th>제조사</th><td>"
				+"<input type='radio' id='lg' name='brands' value='lg' checked='checked'>LG "
				+"<input type='radio' id='samsung' name='brands' value='samsung'>samsung "
				+"<input type='radio' id='sony' name='brands' value='sony'>sony "
				+"</td></tr><tr><th>해상도</th><td>"
				+"<input type='radio' id='ultrahd' name='resolution' value='ultrahd' checked='checked'>울트라HD "
				+"<input type='radio' id='fullhd' name='resolution' value='fullhd'>풀HD "
				+"<input type='radio' id='normalhd' name='resolution' value='normalhd'>HD "
				+"</td></tr><tr><th>종류</th><td>"
				+"<input type='radio' id='ledtv' name='kinds' value='ledtv' checked='checked'>LED TV "
				+"<input type='radio' id='oled' name='kinds' value='oled'>OLED TV "
				+"<input type='radio' id='pdp' name='kinds' value='pdp'>PDP TV "
				+"</td></tr><tr><th>화면크기</th><td>"
				+"<input type='text' id='size' style='width: 200px'> INCH "
				+"</td></tr>"
				+"<input type='hidden' id='brand' name='brand' value=''>"
				+"<input type='hidden' id='options' name='options' value=''></table>");
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
  
$("#fileload").change(function(){
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
      function setDefaultFont() {
         var sDefaultFont = '궁서';
         var nFontSize = 24;
         oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
      }
</script>

<script type="text/javascript">
$("#_btnLogin").click(function() {	
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.
     // 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
    $("#category").val($("#categorys option:selected").val());
	if($("#category").val()=="Refrigerator"){
		var subject = $('input:radio[name=subject]:checked').val();
		var efficiency = $('input:radio[name=efficiency]:checked').val();
		var brand = $('input:radio[name=brands]:checked').val();
		var liter = $('#liter').val();
		$("#options").val(subject + "/" + liter + "/" + efficiency);
		$("#brand").val(brand);
		//alert($("#options").val());
	}else if($("#category").val()=="purifier"){
		var subject = $('input:radio[name=subject]:checked').val();
		var shape = $('input:radio[name=shape]:checked').val();
		var brand = $('input:radio[name=brands]:checked').val();
		$("#brand").val(brand);
		$("#options").val(subject + "/" + shape);
		//alert($("#options").val());
	}else if($("#category").val()=="TV"){
		var resolution = $('input:radio[name=resolution]:checked').val();
		var kinds = $('input:radio[name=kinds]:checked').val();
		var size = $('#size').val();
		var brand = $('input:radio[name=brands]:checked').val();
		$("#brand").val(brand);
		$("#options").val(resolution + "/" + kinds + "/" + size);
		//alert($("#options").val());
	}
	alert("id="+$("#id").val()+", title="+$("#title").val()+", category="+$("#category").val()+", brand="+$("#brand").val()+", options="+$("#options").val()+", price="+$("#price").val()+", content="+$("#ir1").val());
	$("#_frmForm").submit();
});
</script>



