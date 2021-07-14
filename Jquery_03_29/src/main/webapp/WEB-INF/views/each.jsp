<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 반복문 each ]</title>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<script type="text/javascript">
$(function(){
	var obj = [
		{
			"area":"서울"
		},
		{
			"area":"부산"
		},
		{
			"area":"전부"
		}
	];

	$(obj).each(function(i,o){
			console.log(i+":",o.area);
			console.log(i+":",this.area);
		});
	console.log("=====The End1=====");

	$.each($("#menu2 li"), function(i,o){
			console.log(i+":",o);
			console.log(i+":",$(o));
		});
	console.log("=====The End2=====");

	$.each($("#menu2 li"), function(i){
			console.log(i + ":", $(this));
			console.log(i + ":", this);
		});


	$("h2").each(function(index,item){
			$(this).addClass("high-light-"+index);

		});

	

	
});
</script>

<style type="text/css">
.high-light-0{
	background : yellow;
}
.high-light-1{
	background : orange;
}
.high-light-2{
	background : green;
}
.high-light-3{
	background : blue;
}
.high-light-4{
	background : red;
}




</style>

</head>
<body>

	<h1>[반복문 each]</h1>
	
	<h1>탐색 선택자</h1>
	<ul id="menu1">
		<li>내용1-1</li>
		<li>내용1-2</li>
		<li>내용1-3</li>
	</ul>
	
	<ul id="menu2">
		<li>내용2-1</li>
		<li>내용2-2</li>
		<li>내용2-3</li>
	</ul>
	
	<h2>item - 0</h2>
	<h2>item - 1</h2>
	<h2>item - 2</h2>
	<h2>item - 3</h2>
	<h2>item - 4</h2>
	
</body>
</html>