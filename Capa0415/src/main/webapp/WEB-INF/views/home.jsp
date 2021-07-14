<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>[메인 화면]</title>
</head>
<body>

	<h1>[ 메인 화면 ]</h1>
	
	<table border="1">
		<tr>
			<td>번호</td>
			<td>종류</td>
			<td>제목</td>
			<td>이름</td>
			<td>공개일</td>
			
		</tr>
		
		<c:forEach var="portfolio" items="${portfolioList }">
					<tr>
					<td>${portfolio.PORTFOLIO_NO }</td>
					<td>
					
					<c:if test="${portfolio.PORTFOLIO_TYPE eq '1'}">
						학력정보
					</c:if>
					
					<c:if test="${portfolio.PORTFOLIO_TYPE eq '2'}">
						경력정보
					</c:if>
					
					<c:if test="${portfolio.PORTFOLIO_TYPE eq '3'}">
						프로젝트
					</c:if>
					

					
					</td>
					<td>
						<a href = "/portfolio/detail?portfolio_no=${portfolio.PORTFOLIO_NO }">${portfolio.PORTFOLIO_TITLE }</a>
					</td>
					<td>${portfolio.APPLIER_NM }</td>
					<td>${portfolio.PORTFOLIO_GB_DATE }</td>
					
				</tr>
				</c:forEach>
		
	
	
	</table>
	
		<c:choose>
	
		<c:when test="${empty sessionScope.loginVO }">	
		
			<a href="/applier/joinForm">회원가입</a> <br>
			<a href="/applier/loginForm">로그인</a> <br>	
		</c:when>

		
		<c:otherwise>
		
			<a href="/applier/logout">로그아웃</a> <br>
			<a href="/portfolio/listForm">포트폴리오</a> <br>

		</c:otherwise>
		
	</c:choose>
	
	
	

</body>
</html>
