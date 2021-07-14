<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 개인 포트폴리오 ]</title>
</head>
<body>

	<h1>[ 개인 포트폴리오 ]</h1>
	
		
	<table border="1">
		<tr>
			<td>번호</td>
			<td>종류</td>
			<td>제목</td>
			<td>공개여부</td>
			<td>작성일/공개일</td>
			
		</tr>
		
		<c:forEach var="portfolio" items="${prPortfolioList }">
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
	
	<a href="/portfolio/writeForm">포트폴리오 작성하기</a> <br>
	<a href="/">메인으로</a> <br>

</body>
</html>