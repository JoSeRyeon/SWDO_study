<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티_글 목록 페이지</title>
<script src="https://kit.fontawesome.com/681b98a464.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/basic.css">
<script type="text/javascript">
	function boardWriteForm() {
		location.href = "/board/writeForm"
	}
</script>
</head>
<body>
	<!-- 로그인, 회원가입, 로그아웃 -->
	<div style="text-align:right; color:#D9418C;">
		<a style="color:#D9418C" href="/member/logout">Logout</a>	
	</div>
	
	<!-- 로고 -->
	<header>
		<div style="text-align:center; color:#FF9500;">
			<h1><i class="fas fa-dog"></i> LAMP</h1>
		</div>
	</header>
	
	<h1>글 등록 완료</h1>
	
	<a href="/board" style="text-decoration: none;">커뮤니티로 이동</a>
</body>
</html>