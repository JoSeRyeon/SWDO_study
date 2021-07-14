<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>메인 화면</title>
	<style type="text/css">
	table {
		width:  800px;
		margin: 20px 0px;
	}
	table , tr , th , td {
		border:  1px solid;
		text-align: center;
	}
	</style>
</head>
<body>
<h1>
	[ 메인 화면 ]
</h1>

<table>
		<tr>
			<th>번호</th>
			<th>종류</th>
			<th>제목</th>
			<th>이름</th>
			<th>공개일</th>
		</tr>	
	<c:choose>
		<c:when test="${not empty list }">
			<c:forEach items="${list }" var="vo" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td>${vo.PORTFOLIO_TYPE }</td>
					<td>
						<a href="/portfolio/readForm?portfolio_no=${vo.PORTFOLIO_NO }">${vo.PORTFOLIO_TITLE }</a>
					</td>
					<td>${vo.APPLIER_NM }</td>
					<td>${vo.PORTFOLIO_GB_DATE }</td>
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<th colspan="5">
					공개된 포트폴리오가 없습니다.
				</th>
			</tr>
		</c:otherwise>
	</c:choose>
</table>

<c:choose>
	<c:when test="${empty sessionScope.loginId }">
		<a href="/applier/joinForm">회원가입</a> <br>
		<a href="/applier/loginForm">로그인</a> <br>
	</c:when>
	<c:otherwise>
		<a href="/applier/logout">로그아웃</a> <br>
		<a href="/portfolio/list">포트폴리오</a> <br>
	</c:otherwise>
</c:choose>
</body>
</html>
