<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>메인 페이지</title>
</head>
<body>

	
	<ul>
		
		<!-- 로그인 하지 않은 사람에게 보여줘야하는 태그 -->
		<li>
			<a href="/member/joinForm">회원 가입</a>
		</li>
		
		
	
		<li>
			<a href="/member/info">회원 정보</a>
		</li>
		
		<li>
			로그아웃
		</li>
		
		
	</ul>
	
	<c:set var = "str" value="1234" ></c:set>
	str 값 : ${str }

	<br>
	
	<c:choose>
	
		<c:when test="">
		
		</c:when>
	
		<c:otherwise>
		
		</c:otherwise>
	</c:choose>
	
	
	
</body>
</html>
