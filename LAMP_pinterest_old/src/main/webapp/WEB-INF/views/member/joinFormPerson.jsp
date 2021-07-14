<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<link rel="stylesheet" href="/resources/css/basic.css">
	<link rel="stylesheet" href="/resources/css/joinFormPerson.css">
	<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="https://kit.fontawesome.com/681b98a464.js" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function(){
		   $("#cancel").on("click", function(){      
		      location.href = "/";             
		   })
		   
		   $("#submit").on("click", function(){
		      if($("#id").val()==""){
		         alert("아이디를 입력해주세요.");
		         $("#id").focus();
		         return false;
		      } else if($("#id").val().length < 5 || $("#id").val().length > 10){
		         alert("아이디는 5~10자 사이로 입력해주세요.");
		         return false;
		      }
		      var idChkVal = $("#idcheck").val();
		      if(idChkVal == "N"){
		         alert("아이디 중복확인을 해주세요.");
		         idChkVal = "N";
		         return false;
		      }else if(idChkVal == "Y"){
		         $("#regForm").submit();
		      }
		      
		      if($("#pw").val()==""){
		         alert("비밀번호를 입력해주세요.");
		         $("#pw").focus();
		         return false;
		      }else if($("#pw").val().length < 6 || $("#pw").val().length > 12){
		         alert("비밀번호는 6~12자 사이로 입력해주세요.");
		         return false;
		      }
		      if($("#pwCheck").val()==""){
		         alert("비밀번호 확인을 입력해주세요.");
		         $("#pwCheck").focus();
		         return false;
		      }else if($("#pw").val() != $("#pwCheck").val()){
		         alert("동일한 비밀번호를 입력해주세요");
		         return false;
		      }      
		      if($("#name").val()==""){
		         alert("성명을 입력해주세요.");
		         $("#name").focus();
		         return false;
		      }
		
		      if($("input[name=gender]:radio:checked").length < 1){
		         alert("성별을 선택하세요.");
		         return false;
		      }
		
		      return true;
		   });
		})
		
		function idCheck(){
		   $.ajax({
		      url : "/member/idcheck",
		      type : "post",
		      dataType : "json",
		      data : {"id" : $("#id").val()},
		      success : function(data){
		         if($("#id").val()==""){
		            alert("아이디를 입력하세요.")
		         }else if(data == 1){
		            alert("중복된 아이디입니다. 다른 아이디를 입력하세요.");
		            $("#id").val("");
		         }else if($("#id").val().length < 5 || $("#id").val().length > 10){
			            alert("아이디는 5~10자 사이로 입력하세요.");
			            $("#id").val("");
		         }else if(data == 0){
		            $("#idcheck").attr("value", "Y");
		            alert("사용가능한 아이디입니다.");
		            $("#pw").focus();
		         }
		      }
		   })
		}
	</script>
</head>

<body>	
	<form action="/member/joinPerson" method="post" id="regForm">
 		<table>
			<thead>
				<tr>
					<th colspan="3">
						<label class="header">
							<span><i class="fas fa-dog"></i> LAMP</span>
						</label>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<label>아이디</label>
               		</td>
               		<td>
                  		<input type="text" id="id" name="id" placeholder="아이디는 5~10자 사이로 입력해주세요.">
               		</td>
               		<td>
                  		<button type="button" id="idcheck" onclick="idCheck();" value="N" style="width: 150px; height: 50px;">중복확인</button>
               		</td>
            	</tr>
            	<tr>
               		<td>
                  		<label>비밀번호</label>
               		</td>
               		<td>
                  		<input type="password" id="pw" name="pw" placeholder="비밀번호는 6~12자 사이로 입력해주세요.">
               		</td>
            	</tr>
            	<tr>
               		<td>
                  		<label>비밀번호 확인</label>
               		</td>
               		<td>
                  		<input type="password" id="pwCheck" placeholder="비밀번호 확인을 입력해주세요.">
               		</td>
            	</tr>
            	<tr>
               		<td>
                  		<label>이름</label>
               		</td>
               		<td>
                  		<input type="text" id="name" name="name" placeholder="성명을 입력해주세요.">
               		</td>
            	</tr>
            	<tr>
	               	<td>
	                  	<label>성별</label>
	               	</td>
	               	<td>
	                  	<label>남성 </label><input type="radio" name="gender" value="M" style="margin-right: 100px;">
	                  	<label>여성 </label><input type="radio" name="gender" value="F">
	               	</td>
            	</tr>
			</tbody>
         	<tfoot>
         		<tr>
            		<td>
                		<label></label>
                	</td>
                	<td>
						<input type="submit" id ="submit" value="다음">
                  		<input type="reset" id="cancel" value="회원가입 취소">
       
    <div id="naver_id_login"></div>
  	<!-- //네이버아이디로로그인 버튼 노출 영역 -->
  	<script type="text/javascript">
  	var naver_id_login = new naver_id_login("nvd9kXeH8d_p3Afg0uxi", "http://localhost:8887/member/callback");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 10,40);
  	naver_id_login.setDomain("http://localhost:8887/");
  	naver_id_login.setState(state);
  	// naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  	</script>
               </td>
            </tr>
         </tfoot>
      </table>
   </form>
 
</body>