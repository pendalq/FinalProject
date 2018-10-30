<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>reviewWrite</title>
</head>
<body>
	<h1>리뷰 작성</h1>
    <form action="" method="post" id="reviewForm">
        <input type="text" name="id" id="_id" value="${id }" readOnly>
        <input type="text" name="gseq" id="_gseq" value="${gseq}" readOnly>
        <input type="text" name="title" id="_reviewTitle">
        <input type="text" name="liked" id="_liked" value="1">
        <textarea name="content" id="_content" cols="100" rows="20" style="resize: none; text-decoration: none; outline: none"></textarea>
        <input type="reset">
        <input type="submit">
        <button id="btn_reviewSubmit" type="button">완료</button>
    </form> 
    <script type="text/javascript">
	$("#btn_reviewSubmit").click(function() {	
		alert('글작성');	
		$("#reviewForm").attr({ "target":"_self", "action":"reviewWriteAf.d" }).submit();	
	});
	</script>
</body>
</html>