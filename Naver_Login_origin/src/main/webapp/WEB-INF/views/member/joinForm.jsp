<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 회원 가입 폼 ]</title>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<script type="text/javascript">

function formCheck(){

	var id = $("#member_id").val();
	var pw = $("#member_pw").val();
	var nm = $("#member_nm").val();
	var pw_check = $("#member_pw_check").val()
	

	if(id == "" || id.length == 0){
		alert("아이디를 입력해주세요");
		return false;
	}else if(id.length < 3 || id.length > 10){
		alert("아이디를 3~10글자 사이로 입력해주세요")
		return false;
	}

	if(pw == "" || pw.length == 0){
		alert("비밀번호를 입력해주세요");
		return false;
	}else if(pw.length < 3 || pw.length > 10){
		alert("비밀번호를 3~10글자 사이로 입력해주세요")
		return false;
	}

	if(pw_check == "" || pw_check.length == 0){
		alert("비밀번호 확인란을 입력해주세요");
		return false;
	}else if(pw != pw_check){
		alert("동일한 비밀번호를 입력하세요")
		return false;
	}
	

	if(nm == "" || nm.length == 0){
		alert("이름을 입력해주세요");
		return false;
	}

	

	return true;
}

</script>

</head>
<body>

<form action="/member/join" method="post" onsubmit="return formCheck();">

	<h2>[ SES Blog 회원 가입 ]</h2>
	
	<table>
		<tr>
			<td>
				ID 
			</td>
			<td>
				<input type="text" id="member_id" name="id">
			</td>
		</tr>
		
		<tr>
			<td>
				비밀번호 
			</td>
			<td>
				<input type="password" id="member_pw" name="password">
			</td>
		</tr>
		
		<tr>
			<td>
				비밀번호 확인
			</td>
			<td>
				<input type="password" id="member_pw_check">
			</td>
		</tr>
		
		<tr>
			<td>
				이름 
			</td>
			<td>
				<input type="text" id="member_nm" name="name">
			</td>
		</tr>
		
		<tr>
			<td>사진 선택</td>
				<td>
					<img alt="프로필1" src="/resources/images/photo1.png">
					<input type="radio" name = "photo" value="1" checked="checked">
					
					<img alt="프로필2" src="/resources/images/photo2.png">
					<input type="radio" name = "photo" value="2">
					
					<img alt="프로필3" src="/resources/images/photo3.png">
					<input type="radio" name = "photo" value="3">
					
					<img alt="프로필4" src="/resources/images/photo4.png">
					<input type="radio" name = "photo" value="4">
				</td>
			</tr>
		
		<tr>
			<td colspan="2">
				<input type="submit" value="가입">
			</td>
		</tr>
	
	
	</table>



</form>



</body>
</html>