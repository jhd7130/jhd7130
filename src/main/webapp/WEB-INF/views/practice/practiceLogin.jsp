<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
		src = "resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	$("#sendBtn").on("click", function () {
		if($.trim($("#mId").val()) ==""){
			alert("아이디를 입력하세요");
			$("#mId").focus();
		} else if($.trim($("#mPw").val()) ==""){
			alert("비밀번호를 입력하세요");
			$("#mPw").focus();
		} else{
			$("#practiceLogins").submit();
		}
	});
});
</script>
</head>
<body>
<form action="practiceLogins" id = "sendId" method="post">
<div>
	아이디   <input type="text" id="mId" name="mId"><br>
</div>
	비밀번호<input type="password" id="mPw" name="mPw">
	<input type="button" value="로그인" id="sendBtn">
</form>
</body>
</html>