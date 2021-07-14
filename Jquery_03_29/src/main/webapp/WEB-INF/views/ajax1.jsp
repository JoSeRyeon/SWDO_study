<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 비등기 통신 - ajax ]</title>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
   $(function(){

   $("#btn1").on("click", function(){
   console.log("ajax 실행 전");
      $.ajax({
       url : "/ajaxtest1",
       type : "get",
       data : {
         num : 10

      },
      dataType : "text",
      success : function(data){//여기도 변수명 상관 없음,  서버로부터 받아온 데이터
      console.log("서버로부터 전달 받은 데이터 : "+ data);

         },
         error : function(e){ //여기 변수명은 상관없음. 여기에 오는 것은 에러의 정보 객체
      // 에러가 나면 실행되는 부분
      console.log(e);
            }
         });
      console.log("ajax 실행 후");

      });
       

		 $("#formButton1").on("click", function(){
		   var name = $("#name").val(); 
		   var age = $("#age").val();
		   var phone = $("#phone").val();
		
		   $.ajax({
		      url : "/ajaxtest2",
		      type : "post",
		      data : {
		         name : name, //name은 콘트롤러 : name은 jsp받은 데이터 위에 적은 변수
		         age : age,
		         phone : phone
		         }, 
		      success : function(){ 
		         },
		      error : function(e){
		      	console.log(e);
		          } 
		      });
		   
		   });
    







    
      });
      

</script>
</head>
<body>
   <input type="button" id="btn1" value="버튼1">   
   <br>
   
   
   <form id="writeForm1">
   이름 <input type="text" id="name"><br>
   나이 <input type="text" id="age"><br> 
   전화 <input type="text" id="phone"><br>
      <input type="button" id="formButton1" value="저장">
   </form>
</body>
</html>