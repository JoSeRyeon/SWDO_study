<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 글 수정 ]</title>
</head>
<body>
	<form action="/board/update" method="post">
	<h1>[ Blog 글수정 ]</h1>
		
		제목 : <input tpe="text" name = "title" value="${detail.boardnum }"><br>
		내용 : <textarea rows="30" cols="40">${detail.content }</textarea><br>
		
		<input type="hidden" name="boardnum" value="${detail.boardnum }">
		<input type="submit" value="수정">
	</form>
</body> 
</html>