<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
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
		}
		if($("#pwCheck").val()==""){
			alert("비밀번호 확인을 입력해주세요.");
			$("#pwCheck").focus();
			return false;
		}else if($("#pw").val() != $("#pwCheck").val()){
			alert("동일한 비밀번호를 입력해 주세요");
			return false;
		}		
		if($("#name").val()==""){
			alert("성명을 입력해주세요.");
			$("#name").focus();
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
			if(data == 1){
				alert("중복된 아이디입니다. 다른 아이디를 입력하세요.");
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
   <form action="/member/joinPerson" method="get" id="regForm">
      <table>
         <thead>
            <tr>
               <th colspan="2">
                  <label class="header">
                     <span>집사 정보 입력</span>
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
                  <input type="text" id="id" name="id">
                  <button type="button" id="idcheck" onclick="idCheck();" value="N">중복확인</button>
               </td>
            </tr>
            <tr>
               <td>
                  <label>비밀번호</label>
               </td>
               <td>
                  <input type="password" id="pw" name="pw">
               </td>
            </tr>
            <tr>
               <td>
                  <label>비밀번호 확인</label>
               </td>
               <td>
                  <input type="password" id="pwCheck">
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
               <td>
                  <label>성별</label>
               </td>
               <td>
                  <label>남성</label><input type="radio" name="gender" value="M" checked="checked">
                  <label>여성</label><input type="radio" name="gender" value="F">
               </td>
            </tr>
         </tbody>
         <tfoot>
            <tr>
               <td colspan="2">
                  <input type="submit" id = "submit" value="가입">
                  <button id="cancel" type="button">취소</button>
               </td>
            </tr>
         </tfoot>
      </table>
   </form>
   
   <!-- 네이버아이디로로그인 버튼 노출 영역 -->
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
</body>
</html>