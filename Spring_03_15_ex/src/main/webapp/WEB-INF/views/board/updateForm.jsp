<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[게시글 수정 폼]</title>
</head>
<body>
	
	<form action="/board/update" method="post" enctype="multipart/form-data">
		
		글 번호 : ${detail.board_no }<br>
		글 제목 : <input type="text" name="board_title" value="${detail.board_title }">
		작성자 : ${detail.customer_id } <br>
		조회수 : ${detail.board_hits }<br>
		글 내용 : <textarea rows="10" cols="10" name="board_content">${detail.board_content }</textarea>
		작성일 : ${detail.board_indate }<br>
		
		<c:if test="${detail.board_original != null }">
			
			저장된 파일명 : ${detail.board_original } <br>
		
		</c:if>
		
		첨부파일 : <input type="file" name="upload">
		
		<input type="hidden" name="board_no" value = "${detail.board_no }">
		<input type="submit" value="수정">
		
	</form>
	
</body>
</html>