<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
	<title>[메인 페이지]</title>
</head>
<body>
	
	<c:choose>
	
		<c:when test="${empty sessionScope.loginVO }">		
			<a href="/customer/loginForm">로그인 폼으로 이동</a> <br>
			<a href="/customer/joinForm">회원가입</a> <br>
		</c:when>

		
		<c:otherwise>
		
			${sessionScope.loginVO.customer_nm }님 안녕하세요?! <br>
			<a href="/board/listForm">게시판 목록</a> <br>
			<a href="/customer/logout">로그아웃</a> <br>

		</c:otherwise>
		
	</c:choose>
	
	
</body>
</html>
