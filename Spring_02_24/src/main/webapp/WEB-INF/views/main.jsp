<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function formCheck() {
	// ID와 비밀번호가 입력이 되었는지 검사
	var inputId = document.getElementByID("inputId").value;
	var inputId = document.getElementByID("inputPW").value;

	if(inputId == "" || inputId.length == 0){
		alert("ID를 입력해주세요");
		return false;
	}
	if(inputPw == "" || inputPw.length == 0){
		alert("비밀번호를 입력해주세요");
		return false;
	}

	return true;
	
}

</script>
</head>
<body>
	<h1> 새로 바뀐 메인 페이지 </h1>
	
	<!-- /join : request(요청) -->
	<a href="/join">회원가입폼</a><br>
	
	<!-- 쿼리스트링 방식->  /요청주소?변수명=값 , /요청주소?변수명=값&변수명=값&변수명=값...-->
	<a href="/sendNumber?num=3">숫자 데이터 전달</a><br>
	
	
	<a href="/sendString?str=SpringText"> 문자열 데이터 전달</a>
	
	<br>
	
	<a href="/sendData?num=10&str=text&flag=false">데이터 여러개 전달</a>
	
	<form action="/sendFormData2" method="post" onsubmit="return formCheck();">
	
		ID : <input type="text" id="inputId" name="sendId"><br>
		PW : <input type="password" id="inputPw" name="sendPw"><br> 	
		
		<input type = "submit" value="전송">
	
	</form>
	
</body>
</html>