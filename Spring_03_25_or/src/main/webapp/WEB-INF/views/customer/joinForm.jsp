<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 회원 가입 폼 ]</title>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

var idCheckFlag = false;

$(function(){

	//중복 확인 버튼을 클릭했을 때 
	$("#idCheck").on("click", function(){
		//입력된 id의 값을 가져온다.
		var id = $("#customer_id").val();

		//id 값을 서버로 전송한다 : 비동기 방식
		$.ajax({
			url : "/customer/idCheck",
			type : "post",
			data : {
				customer_id : id
			},
			success : function(data){
				console.log(data);

				if(data){
					alert("사용 가능한 ID 입니다");
					idCheckFlag = true;
				}else{
					//값을 지우기 위해서 빈 값을 넣어주는 것
					$("#customer_id").val("");
					alert("중복된 ID 입니다. 다시 입력해주세요");
					idCheckFlag = false;
				}
			},
			error : function(e) {
				console.log(e);
			}
			

		});
	});



	$("#customer_id").on("change", function(){
		idCheckFlag = false;	
	});
	
});


 function formCheck(){

	var customer_id = $("#customer_id").val();
	var customer_pw = $("#customer_pw").val();
	var customer_pwCheck = $("#customer_pwCheck").val();
	var customer_nm = $("#customer_nm").val();

	if(customer_id == "" || customer_id.length == 0){
		alert("id를 입력해주세요");
		return false;
	}

	if(!idCheckFlag){
		alert("아이디 중복 확인을 해주세요");
		return false;
	}
	
	if(customer_pw == "" || customer_pw.length == 0){
		      alert("PW를 입력해 주세요");
		      return false;
	}

	if(customer_pw == "" || customer_pwCheck == 0){
		      alert("같은 비밀번호를 입력해 주세요");
		      return false;
	}

	if(customer_nm == "" || customer_nm.length == 0){
		      alert("이름을 입력해 주세요");
		      return false;
	}
	return true;

	
	
	 
/*    var customer_id = document.getElementById("customer_id");
   var customer_pw = document.getElementById("customer_pw");
   var customer_pwCheck = document.getElementById("customer_pwCheck");
   var customer_nm = document.getElementById("customer_nm");

   if(customer_id.value == "" || customer_id.value.length == 0){
      alert("ID를 입력해 주세요");
      return false;
   }

   if(customer_pw.value == "" || customer_pw.value.length == 0){
      alert("PW를 입력해 주세요");
      return false;
   }

   if(customer_pw.value == "" || customer_pwCheck.value == 0){
      alert("같은 비밀번호를 입력해 주세요");
      return false;
   }

   if(customer_nm.value == "" || customer_nm.value.length == 0){
      alert("이름을 입력해 주세요");
      return false;
   }
   return true;  */
}
</script>
</head>
<body>
   <h1>[ 회원 가입 ]</h1>
   
   <form action="/customer/join" method="post" onsubmit="return formCheck();">
      <table border="1">
         <tr>
            <td>ID</td>
            <td>
               <input type="text" id="customer_id" name="customer_id"> 
               <input type="button" id="idCheck" value="중복 확인"> 
            </td>
         </tr>
         <tr>
            <td>PW</td>
            <td>
               <input type="password" id="customer_pw" name="customer_pw">
            </td>
         </tr>
         <tr>
            <td>PWCheck</td>
            <td>
               <input type="password" id="customer_pwCheck">
            </td>
         </tr>
         <tr>
            <td>Name</td>
            <td>
               <input type="text" id="customer_nm" name="customer_nm">
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