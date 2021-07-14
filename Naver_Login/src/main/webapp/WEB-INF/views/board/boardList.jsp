<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 블로그 ]</title>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<script type="text/javascript">

function writeForm(){

	location.href = "/board/writeForm";
}

</script>
</head>
<body>

<h1> [ ${id.id }님의 블로그 ]</h1>
	
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>등록일</th>
			
		</tr>
		<c:choose>
			<c:when test="${not empty list}">
			<c:forEach items="${list }" var="vo" varStatus="status">
				<tr>
					<td>
					
						<a> ${vo.BOARDNUM }</a>
					
					
					</td>
					
					<td>
						<a href="/board/detail?boardnum=${vo.BOARDNUM }&id=${vo.ID}"> ${vo.TITLE } </a>
					
					</td>
					
					<td>
						<a> ${vo.INPUTDATE }</a>
					</td>
				</tr>
			</c:forEach>
		
			</c:when>
	
			<c:otherwise>
			<tr>
				<th colspan="3">
					게시물이 없습니다.
				</th>
			</tr>
			</c:otherwise>
	</c:choose>
		
	<c:if test="${not empty sessionScope.loginVO}">
		<c:if test="${sessionScope.loginVO.id eq id.id }">
		<tr>
			<td colspan="3"> 
				<input type="button" value="글쓰기" onclick="writeForm()">
			</td>
		</tr>
		</c:if>

	</c:if>
	
	</table>

</body>
</html>