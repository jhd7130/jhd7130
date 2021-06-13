<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로긴확인 페이지</title>
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js">
</script>
<script type="text/javascript">
if("${res}" == "success"){
	location.href ="practiceO";
}else{
	alert("아이디 또는 비밀번호가 일치하지 않습니다.")
	history.back();
}
</script>
</head>
<body>

</body>
</html>