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
<link rel="stylesheet" href="/resources/css/board_style.css">
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
	
	<!-- nav -->
	<nav>
		<ul>
			<li><b><a href="/home">갤러리존</a></b><li>
			<li><b><a href="/board">커뮤니티</a></b><li>
			<li><b><a href="/member/myPage">마이페이지</a></b><li>
		</ul>
	</nav>	
	
	<!-- 커뮤니티 -->
<!-- 	<div class="add">
        <div class="pint_mock_icon_container add_pin">
            <img src="/resources/images/add.png" alt="add_pin" class="pint_mock_icon">
        </div>
    </div>
    
    <div class="pin_container"></div>
    
	<input type="button" value="글 등록" onclick="boardWriteForm()"> -->
	
	<button type="button" id="" class="btn btnEvent" onclick="boardWriteForm()">
		<img src="/resources/images/add.png" alt="add_pin" class="pint_mock_icon" width="50px;">
	</button>
	<div class="board_list_wrap">
		<table class="board_list">
			<caption>커뮤니티 목록</caption>
			<thead>
				<tr>
					<th style="size: 50px;">번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${boardList }">
					<tr>
						<td>${board.board_no }</td>
						<td>${board.board_title }</td>
						<td>${board.id }</td>
						<td>${board.board_indate }</td>
					</tr>
				</c:forEach>
			</tbody>
	
		</table>
	</div>
</body>
</html>