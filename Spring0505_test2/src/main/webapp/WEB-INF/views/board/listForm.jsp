<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 특정 회원의 블로그 화면 ]</title>
<script type="text/javascript">
function boardWriteForm(){
	location.href = "/board/writeForm";
}
</script>
</head>
<body>
<h1>[ ${board_id.id }님의 블로그 ]</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>등록일</th>
		</tr>
		<c:forEach var="board" items="${boardList}">
			<tr>
				<td>${board.boardnum }</td>
				<td>
					<a href="/board/detail?boardnum=${board.boardnum}">${board.title }</a>
				</td>
				<td>${board.inputdate }</td>
			</tr>
		</c:forEach>
	</table>
	<input type="button" value="글쓰기" onclick="boardWriteForm()">
</body>
</html>