<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js">
</script>
<script type="text/javascript">
$(document).ready(function () {
	$("#back").on("click", function () {
		location.href="practiceB1"
	});
	
	$("#addBtn").on("click", function () {
		if($.trim($("#bTitle").val()) ==""){
			alert("제목을 입력해주세요.");
			$("#bTitle").focus();
		} else if ($.trim($("#bWriter").val()) == "") {
			alert("작성자를 입력해주세요.");
			$("#bWriter").focus();
		} else if ($.trim($("#bCon").val()) == "") {
			alert("내용을 입력해 주세요.");
			$("#bCon").focus();
		}else{
			$("#addForm").submit();
		}
	});
});
</script>
</head>
<body>
<form action="practiceB3s" id="addForm" method="post">
제목 : <input type="text" id="bTitle" name="bTitle"><br>
작성자 : <input type="text" id="bWriter" name="bWriter"><br>
내용<br>
<textarea rows="20" cols="50" id="bCon" name="bCon"></textarea>
</form>
<input type="button" id="addBtn" value="add">
<input type="button" id="back" value="backToList">
</body>
</html>