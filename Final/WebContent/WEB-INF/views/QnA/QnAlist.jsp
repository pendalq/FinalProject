<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">	
<title> Q&A</title>


<style type="text/css">


body{
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 15px;
	}
	
#_frmFormSearch{
   margin-left : auto;
   margin-right : auto;
}

.searchArea{
   margin : 30px;
   margin-left : auto;
   margin-right : auto;


selectitems, #btnSearch, .searchtext{
   height: 40px;  
}

.list_table{
	text-align:center;
	margin-left: auto;
	margin-right: auto;
	padding : 10%;
}
.list_table th{
 	padding :15px;
	background-color: #f7f7f7;
}


.list_table td{
	padding: 10px;
} 

.list_table tr:hover{
	border: 1px solid #e6e6e6;
} 


#paging_wrap{
	padding-top: 15px;
	font: 400 0.875rem/1.5 "Open Sans", sans-serif;
	 font-size: 15px
}

#_btnAdd {
   text-decoration :none;
   /* background: transparent none repeat scroll 0 0; */
    border: 1px solid #d5d5d5;
    color: #4b4b4b;
    font-size: 20px;
    height: 45px;
    letter-spacing: 2px;
    line-height: 45px;
    padding: 0 70px;
    font-family: 'Poppins', sans-serif;
    margin-top: 0px;
    background: #fff;
     
}
#_btnAdd:hover{
    border: 1px solid #ff4136;
    color: #fff;
    background: #ff4136;
   font-family: 'Poppins', sans-serif;
}

#btnSearch {
    text-decoration :none;
    border: 1px solid #d5d5d5;
    color: #4b4b4b;
    font-size: 20px;
     height: 40px;
    letter-spacing: 2px;
     line-height: 20px;
    padding: 0 70px;
    font-family: 'Poppins', sans-serif;
    margin-top: 0px;
    background: #fff;
     
}
#btnSearch:hover{
    border: 1px solid #ff4136;
    color: #fff;
    background: #ff4136;
   font-family: 'Poppins', sans-serif;
}


</style>


</head>
<body>

<!-- 검색 카테고리를 유지 start -->
<%
String category = (String)request.getAttribute("s_category");
if(category == null) category = "";
%>

<script type="text/javascript">
var str='<%=category %>';
$(document).ready(function(){	
	document.frmForm1.s_category.value = str;
	
	// text에 문자를 입력하지 않았을 경우, 초기화 해준다.
	if($("#_s_keyword").val().trim() == ""){
		document.frmForm1.s_category.value = "";
	}
	if(str != ''){
		$("#_s_category option[value="+str+"]").attr('selected','selected');
	}
}); 
</script> 

<!-- 검색 카테고리를 유지 end -->

	<div class="qnaListAll">
<!-- 	<div class="searchArea" > -->	
		<form name="frmForm1" id="_frmFormSearch" method="get" action="QnAlist.do">
			<table class="searchArea">
				<tr style="align-items: center; ">
					<td style="padding-right: 10px">
						<select class="selectitems" id="_s_category" name="s_category">
								<option value="" selected="selected">선택</option>
								<option value="title">제목</option>
								<option value="category">카테고리</option>
								<option value="contents">내용</option>
						</select>
					</td>
						<td style="width: 60%" >
							<input type="text" class="searchtext" id="_s_keyword" name="s_keyword"
													value="${s_keyword }" placeholder="카테고리를 선택 후 검색해주세요"/>
						</td>
					<td>
						<span>
								<button type="button" id="btnSearch">검색</button>
						</span>
					</td>
				</tr>
			</table>
	
			<input type="hidden" name="pageNumber" id="_pageNumber"
				value="${(empty pageNumber)?0:pageNumber}" /> 
			<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage"
				value="${(empty recordCountPerPage)?10:recordCountPerPage}" />
	
		</form>
	</div>
	<!-- 검색 view 끝 -->

	<!-- 리스트 -->
<div class="qnalisttb" style="margin-top: 50px; margin-bottom: 50px;">
		<jsp:useBean id="ubbs" class="kh.com.a.arrow.BbsArrow" />
 		<table class="list_table" style="width:70%; height: auto; ">
			<colgroup>
				<col style="width: 70px;" />
				<col style="width: 100px;" />
				<col style="width: auto;" />
				<col style="width: 100px;" />
				<col style="width: 150px;" />
				<col style="width: 100px;" />
			</colgroup>
		<thead>
				<tr>
						<th>번호</th>
						<th>카테고리</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성날짜</th>
						<th>조회수</th>
				</tr>
			
		</thead>
		<tbody>
			<c:if test="${empty QnAlist}">
				<tr>
					<td colspan="3">작성된 글이 없습니다.</td>
				</tr>
			</c:if>

				<c:forEach items="${QnAlist}" var="qna" varStatus="vs">
						<jsp:setProperty property="dept" name="ubbs" value="${qna.dept}" />
										
						<tr class="_hover_tr">
							<td>${vs.count}</td>
							
							<td>${qna.category }</td>
							
							<td style="text-align: left">
								<jsp:getProperty property="arrow" name="ubbs" /> 
									<c:if test="${qna.del == 0 }">
										<a href='QnADetail.do?seq=${qna.seq}'> ${qna.title} </a>
									</c:if> 
									 <c:if test="${qna.del == 1 }">
											이 글은 작성자에 의해서 삭제 되었습니다
												
								</c:if> 
							</td>
		
							<td>${qna.id}</td>
							<td>${qna.wdate }</td>
							<td>${qna.readcount }</td>
						</tr>
				</c:forEach>
			</tbody>
	
		</table>

			<!-- 페이징 처리 -->
			<div id="paging_wrap">
				<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
					<jsp:param value="${pageNumber }" name="pageNumber" />
					<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen" />
					<jsp:param value="${recordCountPerPage }" name="recordCountPerPage" />
					<jsp:param value="${totalRecordCount }" name="totalRecordCount" />
				</jsp:include>
			</div>


		  	<c:if test="${loginAuth == 1 or loginAuth == 2 or loginAuth == 3 or loginAuth == 4 }">
				<div class="selectbtn" id="buttons_wrap">
					<span class="button blue" style="position: relative; left: 1032px;">
						<button type="button" id="_btnAdd">글쓰기</button>
					</span>
				</div>
			</c:if> 

	</div>
	
	
	
	
	<script type="text/javascript">
		
		$(document).ready(function() {
			$("._hover_tr").mouseover(function() {
				$(this).children().css("background-color", "#f7f7f7");
				$(this).children().css("border-color", "1px #e6e6e6");
			}).mouseout(function() {
				$(this).children().css("background-color", "#FFFFFF");
			});
		});
		$("#_btnAdd").click(function() {
			alert('글쓰기');
			//$("#_frmForm").attr({ "target":"_self", "action":"bbswrite.do" }).submit();
			location.href = "QnAWrite.do";
		});
		$("#_btnSearch").click(function() {
	    	if ($("#_s_keyword").val() == null) {
					alert("검색어를 입력해주세요");
			}else if($("#_s_keyword").val() != null){						
				$("#_frmFormSearch").attr({
					"target" : "_self",
					"action" : "QnAlist.do"
				}).submit();
			}
		});
		
		function goPage(pageNumber) {
			$("#_pageNumber").val(pageNumber);
			$("#_frmFormSearch").attr("target", "_self").attr("action",
					"QnAlist.do").submit();
		}
	</script>





</body>
</html>