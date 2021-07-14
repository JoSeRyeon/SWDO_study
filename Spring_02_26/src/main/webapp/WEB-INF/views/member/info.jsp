<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
</head>
<body>

	<!-- EL 표현식  : controller의 값을 가져오기 위해서는 이 표현 방식 사용 -->
	${memberName}<br>
	${memberAge }<br>	
	${memberFlag }<br>
	${strList }<br>
	
	<table>
		<tr>
		
			<th> 번호</th>
			<th> 문자열</th>
			
		</tr>
		
		<c:forEach var="s" items="${strList }" varStatus="status">
		<tr>
			<td>${status.count }</td>
			<td>${s }</td>
		</tr>
		</c:forEach>
		
	</table>
	
	
	<c:forEach var="s" items="${strList }">
		${s } <br>
	</c:forEach>
	
</body>
</html>