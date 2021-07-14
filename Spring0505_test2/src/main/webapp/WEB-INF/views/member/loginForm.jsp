<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 로그인 폼 ]</title>
<script type="text/javascript">
function formCheck(){
	var id = document.getElementById("id").value;
	var password = document.getElementById("password").value;
	
	if(id == "" || id.length == 0){
		alert("아이디를 입력하세요");
		return false;
	}

	if(password == "" || password.length == 0){
		alert("비밀번호를 입력해 주세요");
		return false;
	}
	return true;
}
</script>
</head>
<body>
	<h1>[ 로그인 ]</h1>
	<form action = "/member/login" method="post" onsubmit="return formCheck();">
		ID : <input type="text" name="id" id="id"> <br>
		Password : <input type="password" name="password" id="password"> <br>
		<input type="submit" value="Login">
	</form>
</body>
</html>