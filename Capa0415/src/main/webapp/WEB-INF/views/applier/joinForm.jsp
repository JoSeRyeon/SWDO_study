<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[회원가입 폼]</title>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<script type="text/javascript">

function formCheck(){

	var applier_id = $("#applier_id").val();
	var applier_pw = $("#applier_pw").val();
	var applier_pw_check = $("#applier_pw_check").val();
	var applier_nm = $("#applier_nm").val();

	if(applier_id == "" || applier_id.length == 0){

		alert("아이디를 입력해주세요");
		return false;
		
	} else if(applier_id.length < 3 || applier_id.length > 10){
				
		alert("아이디는 3~10글자 사이로 입력해주세요");
		return false;
	}

	if(applier_pw == "" || applier_pw.length == 0){

		alert("비밀번호를 입력해주세요");
		return false;
		
	} else if(applier_pw.length < 3 || applier_pw.length > 10){
				
		alert("비밀번호는 3~10글자 사이로 입력해주세요");
		return false;
	}

	if(applier_pw_check == "" || applier_pw_check.length == 0){

		alert("비밀번호 확인을 입력해주세요");
		return false;
		
	} else if(applier_pw != applier_pw_check){
				
		alert("동일한 비밀번호를 입력해주세요");
		return false;
	}

	if(applier_nm == "" || applier_nm.length == 0){

		alert("이름을 입력해주세요");
		return false;
		
	} else if(applier_nm.length < 2 || applier_nm.length > 5){
				
		alert("이름은 2~5글자 사이로 입력해주세요");
		return false;
	}


	return true;
}
</script>
</head>
<body>

	<h1>[ 회원가입 폼 ]</h1>
	
	<form action="/applier/join" method="post" onsubmit="return formCheck();">
	
		<table>
			<tr>
				<td> 아이디 </td>
				<td> 
					<input type="text" id="applier_id" name="applier_id">
				</td>
			</tr>
			
			<tr>
				<td> 비밀번호 </td>
				<td>
					<input type="password" id="applier_pw" name="applier_pw">
				</td>
			</tr>
			
			<tr>
				<td> 비밀번호 재입력 </td>
				<td>
					<input type="password" id="applier_pw_check">
				</td>
			</tr>
			
			<tr>
				<td> 이름 </td>
				<td>
					<input type="text" id="applier_nm" name="applier_nm">
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