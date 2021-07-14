<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[게시글 등록 폼]</title>
</head>
<body>

	<form action="/board/write" method="post" >
	
	
		<table>
		
			<tr>
				<td>글 제목</td>
				<td>
					<input type="text" name="board_title">
				</td>
			</tr>
			
			<tr>
				<td>글 내용</td>
				<td>
					<textarea rows="15" cols="20" name = "board_content"></textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="submit" value="등록">
				</td>
			</tr>
			
		</table>
		
	</form>
</body>
</html>