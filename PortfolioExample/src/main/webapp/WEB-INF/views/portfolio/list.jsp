<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포트폴리오</title>
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
<h1>[ 개인 포트폴리오 ]</h1>
<table>
	<tr>
		<th>번호</th>
		<th>종류</th>
		<th>제목</th>
		<th>공개여부</th>
		<th>작성일/공개일</th>
	</tr>	
	<c:forEach items="${list }" var="vo" varStatus="status">
		<tr>
			<td>${status.count }</td>
			<td>${vo.portfolio_type }</td>
			<td>
				<a href="/portfolio/readForm?portfolio_no=${vo.portfolio_no }">${vo.portfolio_title }</a>
			</td>
			<td>
				<c:choose>
					<c:when test="${vo.portfolio_gb eq '0' }">
						<a href="/portfolio/updateGb?portfolio_gb=1&portfolio_no=${vo.portfolio_no }">미공개</a>
					</c:when>
					<c:otherwise>
						<a href="/portfolio/updateGb?portfolio_gb=0&portfolio_no=${vo.portfolio_no }">공개</a>
					</c:otherwise>
				</c:choose>
			</td>
			<td>${vo.portfolio_gb_date }</td>
		</tr>
	</c:forEach>
</table>

	<a href="/portfolio/writeForm">포트폴리오 작성하기</a> <br>
	<a href="/">메인으로</a>
</body>
</html>