<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list 가져오기</title>
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js">
</script>
<script type="text/javascript">
	$(document).ready(function () {
		$("#addBtn").on("click",function () {
			location.href="practiceB3";			
		});
		
		$("tbody").on("click","tr", function () {
			$("#bNo").val($(this).attr("name")); /* this 는 tr을 지칭한다 */
			$("#addForm").submit();
			//table에서 tr 즉 행을 클릭하면  tr이 가지고있는 속성중 name의 값을 bNo(키)의 값으로 지정하겠다.
			// 테이블을 클릭하면 해당 행번호가 값으로 넘어간다는 말이다.
		});
	});
</script>

<style type="text/css">
table{
width : 600px;
height : 10px;
border-collapse: collapse;
border : 2px solid black;
}
thead, tbody,td,th{
border-collapse: collapse;
border : 2px solid black;
text-align: center;
}
th{
background-color: orange;
}
</style>
</head>
<body>
<form action="practiceB2" method="post" id="addForm">
<input type="hidden" id="bNo" name="bNo"/> <!-- 값을 숨기는 이유 질문하기  -->
</form>
<input type="button" value="작성" id="addBtn">
<table>
<thead> 
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
	</tr>
</thead>
<tbody>
	<c:forEach var="data" items="${list}">
		<tr name="${data.B_NO}"><!-- name은 권장 사항이 아니다. 컨트롤러로 넘어가게되는 값  -->
			<td>${data.B_NO}</td>
			<td>${data.B_TITLE}</td>
			<td>${data.B_WRITER}</td>
			<td>${data.B_DT}</td>
		</tr>
	</c:forEach>
</tbody>
</table>
</body>
</html>