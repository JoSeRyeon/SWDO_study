<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<script type="text/javascript">

function updateForm(boardnum){
	var list_id = $("#hidden_id").val();
	location.href = "/board/updateForm?id=" + list_id + "&boardnum="+ boardnum;
}

function likeCnt(){
	var list_id = $("#hidden_id").val();
	var cnt =  $("#hidden_cnt").val();
	var no =  $("#hidden_num").val();
	location.href = "/board/updateCnt?likecnt=" + cnt + "&boardnum=" + no + "&id=" + list_id;
}

function deleteForm(boardnum){

	var list_id = $("#hidden_id").val();
	if(confirm("삭제하시겠습니까?") == true){
		location.href = "/board/delete?boardnum=" + boardnum + "&id=" + list_id;
	}else{
		return false;
	}
	
	
}
</script>
</head>
<body>

<h1>[ ${list.id }님의 블로그 ]</h1>

	<table border="1">
		<tr>
			<td>제목</td>
			<td>${list.title }</td>
		</tr>
		
		<tr>
			<td>작성일</td>
			<td>${list.inputdate }</td>
		</tr>
		
		<tr>
			<td>내용</td>
			<td>${list.content }</td>
		</tr>
		
		<tr>
			<td colspan="2">
			추천수 
			${list.likecnt }
				<input type="button" value="추천하기" onclick="likeCnt()">
			</td>
			
		</tr>
		
		
		<c:choose>
			<c:when test="${sessionScope.loginVO.id eq list.id }">
				<tr>
					<td colspan="2">
					<input type="button" value="수정" onclick="updateForm('${list.boardnum}')">
					<input type="button" value="삭제" onclick="deleteForm('${list.boardnum}')">
					<input type="hidden" id="hidden_id" value="${list.id }">
					<input type="hidden" id="hidden_cnt" value="${list.likecnt }">
					<input type="hidden" id="hidden_num" value="${list.boardnum }">
					</td>
			
				</tr>
			</c:when>
			
		</c:choose>
		
	</table>

</body>
</html>