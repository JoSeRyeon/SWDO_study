
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>[ 로그인 폼 ]</title>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script type="text/javascript">
function loginCheck(){

	var customer_id = $("#customer_id").val();
	var customer_pw = $("#customer_pw").val();

	if(customer_id == "" || customer_id.length == 0){
		alert("아이디를 입력해주세요");
		return false;
	} else if(customer_id.length < 3 || customer_id.length > 10){
		alert("아이디를 3~10글자로 입력해주세요");
		return false;
	}

	if(customer_pw == "" || customer_pw.length == 0){
		alert("비밀번호를 입력해주세요");
		return false;
	} else if(customer_pw.length < 3 || customer_pw.length > 10){
		alert("비밀번호를 3~10글자로 입력해주세요");
		return false;
	}

	return true;
}

</script>
</head>
<body>

	<h1>[ 로그인 ]</h1>
	
	<form action="/member/login" method="post" onsubmit="return loginCheck();">
		<table>
			<tr>
				<td> ID </td>
				<td> <input type="text" id="customer_id" name="id"> </td>
			</tr>
			
			<tr>
				<td> Password </td>
				<td><input type="password" id="customer_pw" name="password"> </td>
			</tr>
			
			<tr>
				<td colspan="2">
				<input type="submit" value="Login"> 
				</td>
			</tr>
		
		</table>
	
	</form>
 <!-- 네이버아이디로로그인 버튼 노출 영역 -->
  <div id="naver_id_login"></div>
  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
  <script type="text/javascript">
  	var naver_id_login = new naver_id_login("4XBeSaYNtp8zLIHcXTPG", "http://localhost:8881/member/collback");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	//naver_id_login.setDomain("http://localhost:8881/member/loginForm");
  	naver_id_login.setState(state);
  	//naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  </script>
	
</body>
</html>