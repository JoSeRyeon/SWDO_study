<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 글 상세정보 ]</title>
<script type="text/javascript">
function boardDelete(boardnum){
	if(confirm("삭제하시겠습니까?") == true){
		location.href = "/board/delete?boardnum="+boardnum;	
	}else{
		return;
	}
}
function boardUpdateForm(boardnum){
	location.href = "/board/updateForm?boardnum="+boardnum;
}
</script>
</head>
<body>
<h1>[ ${detail.id }님의 블로그 ]</h1>
	
	<table border = "1">
		<tr>
			<td>제목</td>
			<td>${detail.title}</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${detail.inputdate}</td>
		</tr>	
		<tr>
			<td>내용</td>
			<td>${detail.content}</td>
		</tr>
        </table>
               추천수 ${detail.likecnt} <input type="button" value="추천하기"><br>
        <c:if test = "${sessionScope.loginVO.id == detail.id }"> 
            <input type="button" value="수정" onclick="boardUpdateForm(${detail.boardnum})">
            <input type="button" value="삭제" onclick="boardDelete(${detail.boardnum})">
        </c:if>
               

</body> 
</html>