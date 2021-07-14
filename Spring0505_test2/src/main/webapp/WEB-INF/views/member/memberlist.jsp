<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">

</script>
<title>[ 모든 회원들의 블로그 목록 ]</title>
</head>
<body>
	<h1>[ SES Blog 목록 ]</h1>
	<table>
	<c:forEach var="member" items="${memberlist }">
	<tr>
		<td><img alt="" src="/resources/images/photo${member.photo }.png"></td>
		<td>
		<a href="/board/listForm?id=${member.id }">${member.name }(${member.id })님의 블로그 보러 가기</a></td>
	</tr>
	</c:forEach>
	</table>
</body>
</html>