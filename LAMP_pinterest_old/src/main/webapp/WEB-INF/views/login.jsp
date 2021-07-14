<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>로그인 및 회원가입</title>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="https://kit.fontawesome.com/681b98a464.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/resources/css/basic.css">
	<link rel="stylesheet" href="/resources/css/login.css">
</head>

<body>		
	<!-- 로그인 form -->
	<form action = "/member/login" method="post">
		<table>
			<thead>
				<tr>
					<th>
						<label class="header">
							<span><i class="fas fa-dog"></i> LAMP</span>
						</label>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<input type="text" name="id" placeholder="아이디">
					</td>
				</tr>
				<tr>
					<td>
						<input type="password" name="pw" placeholder="비밀번호">
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td>
						<input type="submit" value="로그인"">
					</td>					
				</tr>
				<tr>
					<td>
						<!-- 네이버 아이디로 로그인 버튼 노출 영역 -->
  						<div id="naver_id_login"></div>
  						<!-- //네이버 아이디로 로그인 버튼 노출 영역 -->
  						<script type="text/javascript">
  							var naver_id_login = new naver_id_login("nvd9kXeH8d_p3Afg0uxi", "http://localhost:8887/member/login_callback");
							var state = naver_id_login.getUniqState();
							naver_id_login.setButton("white", 10,40);
							naver_id_login.setDomain("http://localhost:8887/");
							naver_id_login.setState(state);
							// naver_id_login.setPopup();
							naver_id_login.init_naver_id_login();
						</script>
					</td>
				</tr>
				<tr>
					<td>
						<a href="/member/joinForm">회원가입</a>
					</td>
				</tr>
			</tfoot>
		</table>
	</form>	
</body>
</html>