<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[회원가입]</title>

<link rel="stylesheet" href="/resources/css/customerStyle.css">

<script type="text/javascript">

function id_check(){
	
}
</script>
</head>
<body>


	<form action="">
	
	<table class="center">
	
		<tr class="trExc" style="border-bottom: 1px solid black;" id="essential">
			<td colspan="2" class="trExc" > 
				<a class="star">(*)</a><a>부분은 필수 입력 사항입니다.</a>			
			</td>

		</tr>
		
		<tr>
			<td class="essential_td">
			
				<label for="customer_nm"> 고객님의 이름<a class = "star">(*)</a> </label> 
			
			</td>
			<td>
				<input type="text" id="customer_nm" name="customer_nm">
			</td>
		</tr>
		
		<tr>
			<td class="essential_td">
			
				<label for = "customer_id">희망 아이디(ID)<a class = "star">(*)</a></label> 
			</td>		
			<td>
				<input type="text" id = "customer_id" name= "customer_id">
				<button type="button" id = "id_check" value="N" onclick="id_check();">중복확인</button>
				<br>
				<span>- 3~12자리 영문, 숫자 조합(대소문자 구분 없으며, 특수기호 사용은 불가)</span>
			</td>
			
		</tr>
		
		<tr>
			<td class="essential_td">
				<label for = "customer_pw">비밀번호 입력<a class = "star">(*)</a></label>
			</td>
			<td>
				<input type="password" id = "customer_pw" name = "customer_pw">
				<span>-5~8자리 문잘와 숫자를 이용하여 만드실 수 있습니다.</span>
			</td>
		</tr>
		
		<tr>
			<td class="essential_td">
				<label for = "customer_pw_check">비밀번호 다시입력<a class = "star">(*)</a></label>
			</td>
			<td>
				<input type="password" id = "customer_pw_check">
				<span>- 영문은 대소문자를 구분합니다.</span>
			</td>
		</tr>
		
		<tr>
			<td class="essential_td"> 
				<label for = "customer_email">주로 사용하는 이메일<a class = "star">(*)</a></label>
			</td>
			<td>
				<input type="text" id="customer_email1">
				@
				<input type="text" id="customer_email2">
				<select id="email_addr">
					<option value="Notdefined" selected="selected">선택하세요</option>
					<option value="google.com">google.com</option>
					<option value="naver.com">naver.com</option>
					<option value="hanmail.net">hamail.net</option>
					<option value="">직접 입력</option>
					
				</select>
				<br>
				<input type="checkbox" id="check_email" name="check_email"> 천리안 메일을 주로 사용하는 메일로 설정하시겠습니까?
				
			</td>
		</tr>
		
		<tr>
			<td class="essential_td">
				<label for = "customer_address">주소<a class = "star">(*)</a></label>
			</td>
			<td>
				<input type="text" id="customer_adress1">
				-
				<input type="text" id="customer_address2"> 
				<input type="button" value="우변번호 검색">
				<br>
				<input type="text" id="customer_address3"><br>
				나머지 주소 <input type="text" id="customer_address">
			</td>
		</tr>
		
		<tr>
			<td class="essential_td">
			 	<label for = "customer_phone">휴대폰 번호<a class = "star">(*)</a></label>
			 </td>
			<td>
				<select>
					<option value="" disabled="disabled" selected="selected">선택</option>
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="017">017</option>
					<option value="019">019</option>
				</select>
				-
				<input type="text" id = "customer_phone1">
				-
				<input type="text" id = "customer_phone2">
				
				<input type="radio" name="telecom" value="SKT">SKT
				<input type="radio" name="telecom" value="KTF">KTF
				<input type="radio" name="telecom" value="LGT">LGT
			</td>
		</tr>
		
		<tr>
			<td>
				<label for="customer_home_phone">일반 전화번호</label>
			</td>
			<td>
				<input type="text">
				-
				<input type="text">
				-
				<input type="text">
				
				<input type="radio" name = "phone" value="집">집
				<input type="radio" name = "phone" value="직장">직장
			</td>
		</tr>
		
		<tr>
			<td>
				<label>천리안소식지 및 휴대폰 <br> 문자(SMS) 수신</label>
			</td>
			<td>
				<input type="checkbox" name="sms" checked="checked" value="천리안 소식메일을 수신합니다."> 천리안 소식메일을 수신합니다. <br>
				<input type="checkbox" name="sms" checked="checked" value="알림 및 소식등 정보 휴대폰 문자 수신"> 알림 및 소식등 정보 휴대폰 문자 수신
			</td>
		</tr>

	</table>
	
	<div class="button">
			<input type="submit" value="가입">
			<input type="submit" value="다시입력">
	</div> 


	</form>



</body>
</html>