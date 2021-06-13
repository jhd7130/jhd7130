<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 후 페이지</title>
<style type="text/css">
#sendTxt #updateBtn,#sendTxt #cancelBtn{
display: none;
}
</style>
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js">
</script>
<script type="text/javascript">
$(document).ready(function () {
	$("#logoutBtn").on("click", function () {
		if(confirm("로그아웃하시겠습니까?")){
			location.href="practiceLogout";
		}
	});
	
	$(".loginBtn").on("click", function () {
		location.href ="practiceLogin";
	});
	
	$("#writeBtn").on("click", function () {
		if($.trim($("#obCon").val()) == ""){
			alert('내용을 입력하세요');
			$("#obcon").focus();
		} else{
			$("#sendTxt").submit();
		}
	});
	
	$("table").on("click","#updateBtn", function () {
		$("#sendTxt #writeBtn").hide();
		$("#sendTxt #updateBtn, #sendTxt #cancelBtn").show();
	});
	
	$("#sendTxt #cancelBtn").on("click", function () {
		$("#sendTxt #writeBtn").show();
		$("#sendTxt #updateBtn, #sendTxt #cancelBtn").hide();
	})
});
</script>
</head>
<body>
<c:choose>
	<c:when test="${empty sMNo}">
		<input type="button" value ="로그인" class="loginBtn">
	</c:when>
	<c:otherwise>
		${sMNm}님 어서오세요.
		<input type="button" value ="로그아웃	" id="logoutBtn">
	</c:otherwise>
</c:choose>
<div>
	 <div class="write_area"></div>
		<form action="practiceOwrite" id="sendTxt" method="post">
			<c:choose>
				<c:when test="${empty sMNo}">
					<input type="button" value ="로그인" class="loginBtn">
				</c:when>
				<c:otherwise>
					${sMNm} <textarea rows="3" cols="50" id="obCon" name="obCon"></textarea>
					<input type="button" id="writeBtn" value="작성"> 
					<input type="button" id="updateBtn" value="수정"> 
					<input type="button" id="cancelBtn" value="취소"> 
					</c:otherwise>
			</c:choose>
		</form>
	 <div class="list_area">
	 	<table>
	 		<thead>
	 			<tr>
	 				<th>작성자</th>
	 				<th>내용</th>
	 			</tr>
	 		</thead>
	 		<tbody>
	 		<c:forEach var="data" items="${list}">
	 			<tr>
	 				<td>${data.M_NM}</td>
	 				<td>${data.OB_CON}</td>
	 				<td>
	 				<c:if test="${sMNo eq data.M_NO}">
	 					<input type="button" value="수정" id="updateBtn">
	 					<input type="button" value="삭제" id="deleteBtn">
	 				</c:if>
	 				</td>
	 			</tr>
	 		</c:forEach>
	 		</tbody>
	 	</table>
	 </div>
	 
	 <div class="paging_area"></div>
</div>
</body>
</html>