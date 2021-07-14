<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 글 쓰기 ]</title>

</head>
<body>
<h1>[ Blog 글쓰기 ]</h1>
	<form action="/board/write" method="post">
		<table border="1">
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="title">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="30" cols="40" name="content"></textarea>				
				</td>
			<tr>
				<td colspan="2">
					<input type="submit" value="저장">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>