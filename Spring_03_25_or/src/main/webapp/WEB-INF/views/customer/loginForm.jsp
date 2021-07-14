<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[로그인 폼]</title>

<script type="text/javascript">
function formCheck(){
   var customer_id = document.getElementById("customer_id");
   var customer_pw = document.getElementById("customer_pw");

   if(customer_id.value == "" || customer_id.value.length == 0){
      alert("ID를 입력해 주세요");
      return false;
   }

   if(customer_pw.value == "" || customer_pw.value.length == 0){
      alert("PW를 입력해 주세요");
      return false;
   }

   return true;
}
</script>
</head>
<body>

<h1>[로그인]</h1>

	<form action="/customer/login"  method="post" onsubmit="return formCheck();">
		      <table border="1">
         <tr>
            <td>ID</td>
            <td>
               <input type="text" id="customer_id" name="customer_id">
            </td>
         </tr>
         <tr>
            <td>PW</td>
            <td>
               <input type="password" id="customer_pw" name="customer_pw">
            </td>
         </tr>
         
         <tr>
            <td colspan="2">
               <input type="submit" value="로그인">
            </td>
         </tr>
      </table> 
	
	</form>
</body>
</html>