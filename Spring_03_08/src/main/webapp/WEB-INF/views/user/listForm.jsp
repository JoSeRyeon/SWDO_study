<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
/* function userDelete(user_no){
   //컨트롤러로 삭제 요청을 전달하는데 onclick으로 부터 전달받은 데이터도 같이보낸다.
   location.href = "/user/delete?user_no="+user_no;
}  */

$(function(){

   function userDeleteFnc(){
      $(".delBtn").on("click", function(){
         //지금 누른 삭제버튼의 회원의 회원번호를 가져와야 한다.
//             alert("삭제"); 
         //방법 3개
             var user_no = $(this).closest("tr").find("td").html(); //첫번째방법
          
         // var user_no = $(this).next(".hidUserNo").val();

         //var user_no  = $(this).attr("user_no");
            
         //alert(user_no); 
            
              $.ajax({
               url : "/user/delete",
               type : "post",
               data : {
               user_no : user_no   
                  },
               dataType : "json",
               success: function(data){
                   
                  console.log(data);

                  var context = '';
                  $.each(data,function(index,item){ //item은 data의 하나의 객체
                  context += '<tr>';
                  context += '<td>'+item.user_no+'</td>';
                  context += '<td><a href="/user/detail?user_no=' + item.user_no + '">' +item.user_id+'</a></td>';
                  context += '<td>'+item.user_pw+'</td>';
                  context += '<td>'+item.user_nm+'</td>';
                  context += '<td>'+item.user_indate+'</td>';
                  context += '<td><input type="button" class="delBtn" value="삭제"></td>';
                  context += '</tr>';
                  
                     });
                     
                  
                  $(".tbody").html(context);

                  //새로운 삭제버튼에 이벤트 연결
                  userDeleteFnc();
                  },
               error : function(e){
                  console.log(e);
                  }

               }); 
            }); 

      }
   userDeleteFnc(); //ready함수가 실행되면 이벤트 연결 함수를 실행. 위의 함수는 만들어졌을뿐실행은 안됨 호출시켜야함
});

/* function userDelete(user_no){
   alert(user_no);
   //  컨트롤러에 삭제 요청을 전달할 때 onclick으로부터 전달받은 데이터도 같이 보낸다. 
   // 이 방식은 동기 방식으로 진행되기 때문에, jsp가 컨트롤러에 갔다가 다시 jsp 파일을
   // 로딩해야 하기 때문에, 사용자가 보던 영상이 처음으로 돌아가 있거나, 사진 등등
   // 심지어는 시간도 오래 걸리기 때문에 동기 방식은 효율적이지 않다.
   // 이 경우에는 비동기 방식을 취하는 것이 훨씬 효율적이고 좋다
   location.href = "/user/delete?user_no=" + user_no;

} 
 */

</script>
</head>
<body>

   <h1> [ 회원 정보 ]</h1>

   <table border="1">
   	<thead>
   	
	   	<tr>
	         <th> 번호 </th>
	         <th> 아이디 </th>
	         <th> 비밀번호 </th>
	         <th> 이름 </th>
	         <th> 가입일 </th>
	         <th> 삭제 </th>
	      </tr>
   	</thead>
     
   	<tbody class="tbody">
   		<c:forEach var = "user" items="${userList }">
	      <tr>
	         <td >${user.user_no }</td>
	         <td>
	            <a href="/user/detail?user_no=${user.user_no }">${user.user_id }</a> 
	         </td>
	         <td>${user.user_pw } </td>
	         <td>${user.user_nm } </td>
	         <td>${user.user_indate } </td>
	         <td> 
	            <input type="button" class="delBtn" value="삭제" user_no = "${user.user_no }"> 
	            <input type="hidden" class="hidUserNo" value="${user.user_no }">
	         </td>
	      </tr>
  		 </c:forEach>
   	</tbody>
   
   
   </table>


</body>
</html>