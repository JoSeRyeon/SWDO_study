<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 로그인 폼 ]</title>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

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
	
</body>
</html>