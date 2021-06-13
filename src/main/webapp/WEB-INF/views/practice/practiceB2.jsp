<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js">
</script>
</head>
<body>
<b>번호</b> : ${data.B_NO}<br>
<b>제목</b> : ${data.B_TITLE}<br>
<b>작성자</b> : ${data.B_WRITER}<br>
<b>작성일</b> : ${data.B_DT}<br><br>
<b>내용</b><br>
${data.B_CON}<br>
</body>
</html>