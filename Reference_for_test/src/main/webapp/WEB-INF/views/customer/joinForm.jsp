<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[회원 가입 폼]</title>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<script type="text/javascript">

function changeSelect(){

	var email_add = $("#email_add").val();

	$("#customer_email_add").val(email_add);
}

function formCheck(){

	var customer_id = $("#customer_id").val();
	var customer_pw = $("#customer_pw").val();
	var customer_pw_check = $("#customer_pw_check").val();
	var customer_nm = $("#customer_nm").val();
	var customer_email = $("#customer_email").val();
	var customer_email_add = $("#customer_email_add").val();
	var customer_hobby_cnt = $("input[name=customer_hobby]:checkbox:checked").length;
	var customer_sex = $("input:radio[name=customer_sex]").is(':checked');
	var customer_agree = $("input:checkbox[name=customer_agree]:checked").val();

	console.log(customer_sex);
	console.log(customer_agree);

		if(customer_id == "" || customer_id.length == 0){

			alert("아이디를 입력해주세요");
			return false;
			
		} else if(customer_id < 3 || customer_id > 8){
					
			alert("아이디를 3~8 글자 사이로 입력해주세요");
			return false;
		}

		if(customer_pw == "" || customer_pw.length == 0){

			alert("비밀번호를 입력해주세요");
			return false;
			
		} else if(customer_pw.length < 3 || customer_pw.length > 8){
					
			alert("비밀번호를 3~8 글자 사이로 입력해주세요");
			return false;
		}

		if(customer_pw_check == "" || customer_pw_check.length == 0){

			alert("비밀번호 확인을 입력해주세요");
			return false;
			
		} else if(customer_pw != customer_pw_check){
					
			alert("동일한 비밀번호를 입력하세요");
			return false;
		}

		if(customer_nm == "" || customer_nm.length == 0){

			alert("이름을 입력해주세요");
			return false;
			
		} 

		if(customer_email == "" || customer_email.length == 0){

			alert("이메일을 입력해주세요");
			return false;
			
		} 

		if(customer_email_add == "" || customer_email_add.length == 0){

			alert("이메일 주소를 입력해주세요");
			return false;
			
		}

		if(customer_hobby_cnt == 0 || customer_hobby_cnt.length == 0){

			alert("취미를 선택해주세요");
			return false;
			
		}

		if(customer_sex == false){

			alert("성별을 선택해주세요");
			return false;
			
		}

		
		customer_email += "@";
		customer_email += customer_email_add;

		console.log(customer_email);
		
		

	return true;
}


	

</script>
</head>
<body>

	<form action="/customer/join" method="post" onsubmit="return formCheck();">
	
		<table>
			<tr>
				<td> 아이디 </td>
				<td> 
					<input type="text" id="customer_id" name="customer_id">
					<input type="button" id="id_check" value="아이디 중복 확인">
				</td>
			</tr>
			
			<tr>
				<td> 비밀번호 </td>
				<td>
					<input type="password" id="customer_pw" name="customer_pw">
				</td>
			</tr>
			
			<tr>
				<td> 비밀번호 재입력 </td>
				<td>
					<input type="password" id="customer_pw_check">
				</td>
			</tr>
			
			<tr>
				<td> 이름 </td>
				<td>
					<input type="text" id="customer_nm" name="customer_nm">
				</td>
			</tr>
			
			<tr>
				<td> 이메일 </td>
				<td>
					<input type="text" id="customer_email" name="customer_email"> 
					@
					<input type="text" id="customer_email_add" name="customer_email">
					<select id="email_add" onchange="changeSelect()">
						<option value="" disabled="disabled" selected="selected">선택하세요</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="daum.net">daum.net</option>
						<option value="">직접 입력</option>
					</select>
				</td>
			</tr>
			
			
			<tr>
				<td> 취미 </td>
				<td> 
					<input type="checkbox" name="customer_hobby" value="음악감상"> 음악감상
					<input type="checkbox" name="customer_hobby" value="댄스"> 댄스
					<input type="checkbox" name="customer_hobby" value="독서"> 독서
					<input type="checkbox" name="customer_hobby" value="게임"> 게임
				</td>
			</tr>
			
			<tr>
				<td> 성별 </td>
				<td> 
					<input type="radio" name="customer_sex" value="여성">여성
					<input type="radio" name="customer_sex" value="남성">남성
				</td>
			</tr>
			
			<tr>
				<td> 광고 동의 </td>
				<td> 
					<input type="checkbox" checked="checked" id="customer_agree" name="customer_agree" value="메일수신"> 광고성 메일을 받겠습니까?
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="submit" value="제출하기">
				</td>
			</tr>
		
		</table>
	
	</form>
		
</body>
</html>