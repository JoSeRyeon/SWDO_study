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
	var result_1 = $("#sec_1").html();
	console.log(result_1);
	$("#sec_1 p").html("<a href=\"#\">Text1</a>");

	var result_2 = $("#sec_2").text();
	console.log(result_2);
	$("#sec_2 h2").text("text()");
});
</script>
</head>
<body>

	<h1>
		<strong> 객체 조작 및 생성</strong>
	</h1>
	
	<section id="sec_1">
		<h2>
			<em>html()</em>
		</h2>
		<p>내용1</p>
	</section>
	<section id="sec_2">
		<h2>
			<em>텍스트()</em>
		</h2>
		<p>내용2</p>
	</section>

</body>
</html>