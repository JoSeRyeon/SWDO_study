<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[게시판 메인 페이지]</title>

<script type="text/javascript">

function boardWriteForm(){

	location.href = "/board/writeForm"
}

</script>
</head>
<body>

	<input type="button" value="글 등록" onclick="boardWriteForm()">
	
	
	<table>
		<tr>
			<td>글 번호</td>
			<td>글 제목</td>
			<td>작성자</td>
			<td>등록일</td>
			<td>조회수</td>
		</tr>
		
	
	</table>

</body>
</html>