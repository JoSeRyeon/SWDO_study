<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입 폼</title>
<script type="text/javascript">
function formCheck(){
	var id = document.getElementById("id").value;
	var pw = document.getElementById("password").value;
	var name = document.getElementById("name").value;
	var photo = document.getElementById("photo").value;
	
	if(id == "" || id.length == 0){
		alert("아이디를 입력해 주세요");
		return false;
		}else if(id.length < 3 || id.length > 8){
			alert("아이디는 3~8글자 사이로 입력해 주세요");
			return false;
		}


	if(password == "" || password.length == 0){
		alert("비밀번호를 입력해 주세요");
		return false;
	}else if(pw.length < 3 || pw.length > 10){
		alert("비밀번호는 3~10글자 사이로 입력해 주세요");
		return false;
			}


	if(name == "" || name.length == 0){
		alert("이름을 입력해 주세요");
		return false;
	}
	
	return true;
}
</script>
</head>
<body>
<h1>[ SES Blog 회원 가입]</h1>
   <form action="/member/join" method="post" onsubmit="return formCheck();">
      <table>
			<tr>
               <td>
                  <label>ID</label>
               </td>
               <td>
                  <input type="text" id="id" name="id">
               </td>
            </tr>
            <tr>
               <td>
                  <label>비밀번호</label>
               </td>
               <td>
                  <input type="password" id="password" name="password">
               </td>
            </tr>
            <tr>
               <td>
                  <label>이름</label>
               </td>
               <td>
                  <input type="text" id="name" name="name">
               </td>
            </tr>
            <tr>
				<td>사진 선택</td>
				<td>
					<img alt="프로필1" src="/resources/images/photo1.png">
					<input type ="radio" name="photo" value="1" checked="checked">
					
					<img alt="프로필2" src="/resources/images/photo2.png">
					<input type ="radio" name="photo" value="2">
					
					<img alt="프로필3" src="/resources/images/photo3.png">
					<input type ="radio" name="photo" value="3">
					
					<img alt="프로필4" src="/resources/images/photo4.png">
					<input type ="radio" name="photo" value="4">
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