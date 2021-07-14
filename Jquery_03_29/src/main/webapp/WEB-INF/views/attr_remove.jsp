<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 객체조착 - attr() / removeAttr()]</title>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

$(function(){
	var srcVal = $("#sec_1 img").attr("src");
	console.log(srcVal);

	$("#sec_1 img")
		.attr({
			"width":200
			,"src":srcVal.replace("1.png","2.png")
			,"alt":"가위"
			})
			.removeAttr("border");
});

</script>
</head>
<body>

	<h1>
		<strong>객체 조작 및 생성</strong>
	</h1>
	<section id="sec_1">
		<h2>이미지 속성</h2>
		<p>
			<img alt="바위" src="/resources/images/attrImg1.png" border="2">
		</p>
	</section>

</body>
</html>