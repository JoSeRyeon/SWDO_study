<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>첫 화면</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>


</head>
<body>
	<form action = "/member/login" method="post">
		아이디 : <input type="text" name="id"> <br>
		비밀번호 : <input type="password" name="pw"> <br>
		<input type="submit" value="로그인">
	</form>
	
	<!-- 네이버아이디로로그인 버튼 노출 영역 -->
  	<div id="naver_id_login"></div>
  	<!-- //네이버아이디로로그인 버튼 노출 영역 -->
  	<script type="text/javascript">
  	var naver_id_login = new naver_id_login("nvd9kXeH8d_p3Afg0uxi", "http://localhost:8887/member/login_callback");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 10,40);
  	naver_id_login.setDomain("http://localhost:8887/");
  	naver_id_login.setState(state);
  	// naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  	</script>
	
	<a href="/member/joinForm">회원가입</a>
</body>
</html>