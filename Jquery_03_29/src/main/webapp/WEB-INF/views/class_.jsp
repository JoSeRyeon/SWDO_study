<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

$(function(){
	$("#p1").addClass("aqua");
	$("#p2").removeClass("red");
	$("#p3").toggleClass("green");
	$("#p4").toggleClass("green");
	$("#p6").text($("#p5").hasClass("yellow"));
});
</script>

<style type="text/css">
.aqua{background-color:#0ff;}
.red{background-color:#f00;}
.green{background-color:#0f0;}
.yellow{background-color:#ff0;}
</style>
</head>
<body>

	<p id="p1">내용</p>
	<p id="p2" class="red">내용2</p>
	<p id="p3">내용3</p>
	<p id="p4" class="green">내용4</p>
	<p id="p5" class="yellow">내용5</p>
	<p id="p6"></p>
	

</body>
</html>