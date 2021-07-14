<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>[ Blog 글수정 ]</h1>

<form action="/board/update" method="post">
	<table>
		<tr>
			<td> 제목 </td>
			<td> 
				<input type="text" name="title" value="${list.title }">
			
			</td>
		</tr>
		
		<tr>
			<td> 내용 </td>
			<td> 
				<textarea rows="25" cols="40" name="content">${list.content }</textarea>			
				<input type="hidden" name = "boardnum" value="${list.boardnum }">
				<input type="hidden" name = "id" value="${list.id }">
				
			</td>
		</tr>
		
		<tr>
			<td colspan="2"> <input type="submit" value="수정"> </td>
		</tr>
	</table>

</form>
</body>
</html>