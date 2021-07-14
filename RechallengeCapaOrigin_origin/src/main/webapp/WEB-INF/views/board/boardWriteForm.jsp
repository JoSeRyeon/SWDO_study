<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ Blog 글쓰기 ]</title>
</head>
<body>

<form action="/board/write" method="post">

	<h1>[ Blog 글쓰기 ]</h1>
	<br>
	
	<table>
		<tr>
			<td> 제목 </td>
			<td> 
				
				<input type="text" id="title" name="title"> 
			
			</td>
		</tr>
		
		<tr>
			<td> 내용 </td>
			<td> 
				
				<textarea rows="20" cols="40" name="content"></textarea>			
			</td>
		</tr>
		
		<tr>
			<td colspan="2"> <input type="submit" value="저장"> </td>
		</tr>
	</table>

</form>


</body>
</html>