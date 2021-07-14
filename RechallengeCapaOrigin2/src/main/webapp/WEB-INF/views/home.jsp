<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>[메인 화면]</title>
</head>
<body>


<h1>[ SES BLOG ]</h1>

<c:choose>

	<c:when test="${empty sessionScope.loginVO }">
		<ul>
			<li>
			<a href="/member/joinForm"> 회원가입 </a> <br>
			</li>
			
			<li>
			<a href="/member/loginForm"> 로그인 </a> <br>
			</li>
			
			<li>
			<a href="/naver/login"> 네이버 로그인 </a> <br>
			</li>
			
			<li>
			<a href="/board/list"> 블로그를 개설한 회원 목록 보기 </a>
			</li>
		</ul>
	
	</c:when>

	<c:otherwise>
	
	<h2>
	${sessionScope.loginVO.name }(${sessionScope.loginVO.id })님 환영합니다!!!
	</h2>
	
	<ul>
	
		<li><a href="/member/logout"> 로그아웃 </a></li>
		
		<li><a href="/board/list"> 블로그를 개설한 회원 목록 보기 </a></li>
	</ul>
		
		
	
	</c:otherwise>
</c:choose>

</body>
</html>
