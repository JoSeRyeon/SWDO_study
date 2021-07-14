<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>[ 메인 화면 ]</title>
</head>
<body>
	<h1>[ SES BLOG ]</h1>
	<ul>
		<c:choose>
			<c:when test="${empty sessionScope.loginVO }">
				<li>
					<a href="/member/joinForm">회원가입</a>
				</li>
				<li>
					<a href="/member/loginForm">로그인</a>
				</li>
				<li>
					<a href="/member/memberlist">블로그를 개설한 회원 목록 보기</a>
				</li>
			</c:when>
			<c:otherwise>
				<h1>${sessionScope.loginVO.name }(${sessionScope.loginVO.id })님 환영합니다!!!</h1>
				<li>
					<a href="/member/logout">로그아웃</a>
				</li>
				<li>
					<a href="/member/memberlist">블로그를 개설한 회원 목록 보기</a>
				</li>
			</c:otherwise>
		</c:choose>
	</ul>	
</body>
</html>
