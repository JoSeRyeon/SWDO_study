<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티_글 등록 페이지</title>
<script src="https://kit.fontawesome.com/681b98a464.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/basic.css">
<link rel="stylesheet" href="/resources/css/writeForm_style.css">
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
	
	<!-- nav -->
	<nav>
		<ul>
			<li><b><a href="/home">갤러리존</a></b><li>
			<li><b><a href="/board">커뮤니티</a></b><li>
			<li><b><a href="/member/myPage">마이페이지</a></b><li>
		</ul>
	</nav>	
	
	<!-- 커뮤니티 -->
	<form action="/board/write" method="post">
		<table>
			<tr>
				<td>글 제목</td>
				<td>
					<input type="text" name="board_title">
				</td>
			</tr>
			<tr>
				<td>글 내용</td>
				<td>
					<textarea rows="10" cols="200" name="board_content"></textarea>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<input type="file">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>