<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ ses blog 목록 ]</title>
</head>
<body>

	<h1>[ SES Blog 목록 ]</h1>
	
	<table>
		<c:choose>
			<c:when test="${not empty list}">
			<c:forEach items="${list }" var="vo" varStatus="status">
				<tr>
					<td>
					
						<img alt="" src="/resources/images/photo${vo.PHOTO }.png">
					
					</td>
					
					<td>
					<a href="/board/boardList?id=${vo.ID }">
						${vo.NAME } (${vo.ID })님의 블로그 보러 가기
					
					</a>
					
					</td>
				</tr>
			</c:forEach>
		
			</c:when>
	
			<c:otherwise>
			<tr>
				<th colspan="2">
					회원 정보가 없습니다.
				</th>
			</tr>
			</c:otherwise>
	</c:choose>
		
	
	</table>
	
	
</body>
</html>