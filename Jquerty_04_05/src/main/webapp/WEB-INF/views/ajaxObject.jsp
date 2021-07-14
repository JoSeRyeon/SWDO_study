<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ ajax 데이터 전송 ]</title>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<script type="text/javascript">
$(function(){

	$("#btn").on("click", function(){
		// 문자열에 입력된 값을 가져온다.
		// 숫자에 입력된 값을 가져온다.
		// 비동기 통신으로 문자열의 값과 숫자의 값을 서버로 전송
		var id = $("#id").val();
		var num = $("#num").val();
		
		$.ajax({
			url : "/ajaxtest1",
			type : "get",
			data : {
				id : id,
				num : num,
				bool : false
			},
			success : function(data){
				console.log(data);
			},
			error : function(e) {
				console.log(e);
			}

		});
			
	});




	$("#btn1").on("click", function(){
		// 입력된 값을 가져온다.
		// 비동기 통신으로 데이터 값을 서버로 전송
		
		$.ajax({
			url : "/ajaxtest2",
			type : "post",
			data : {
				custid : "id",
				password : "pw",
				age : 20
				
			},
			//서버로부터 전달받는 데이터의 타입
			dataType : "json", 
			success : function(data){
				console.log(data);
				console.log(data.flag);
				console.log(data.hobby);

				var context = '';
				$(data.hobby).each(function(index,item){
					context += '<input type = "checkbox" class="hobby" name="hobby">' + '<span>' + this + '</span>';
					
					
				});

				$("#hobbyDiv").html(context);

				$(".hobby").on("click", function(){
					var text = $(this).next().html();
					alert(text);
				});
					
			},
			error : function(e) {
				console.log(e);
			}

		});
			
	});

	$("#btn2").on("click", function(){
		$.ajax({
			url : "/ajaxtest4",
			type : "post",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify({
				custid : "id",
				password : "pw",
				age : 20,
				hobby : ["스포츠", "영화감상", "노래부르기"]
			}),
			dataType : "json",
			success : function(data){
				console.log(data);
			},
			error : function(e){
				console.log(e);
			}
			
		});
		
	});

	


	
	
});


</script>

<style type="text/css">

.hobby{
	display: inline-block;
	width : 20px;
	height: 20px;
}
</style>
</head>
<body>

	문자열 : <input type="text" id="id"> <br>
	숫자 : <input type="text" id="num"> <br>
	<input type="button" id="btn" value="전송"> 
	
	<br>
	<br>
	<input type="button" id="btn1" value="전송1">
	
	<br>
	
	<div id="hobbyDiv">
		
	</div>
	
	<br>
	
	<input type="button" id="btn2" value="전송2">
	
	
	
	

</body>
</html>