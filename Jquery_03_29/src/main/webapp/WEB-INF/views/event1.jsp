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
	//이벤트 등록을 하려면 먼저 태그가 다 로드 된 후에여야 하기 때문에
	//ready()펑션 사용하고 그 안에
	//이벤트 등록 메소드 실행 

	$("#btn1").click(function(){
		alert("버튼이 클릭 되었습니다.");
		});

	$("#header1").click(function(){

			//원래 있었던 것에다가 + 를 덧붙인 내용을
			//해당 요소의 하위에 있는 내용들에 이 덧붙인 내용을
			//새로 올리는 것 (기존 꺼는 삭제하고 그 위에 덧 붙여 쓰는거)
			
			$(this).html($(this).html() + "+");
		});

	$("#header1").on("click", function(){
			$(this).css("background-color", "#f00");

		});

	$("#header2").on("click", function(){

			$("#header1").off("click");
		});

	$("#header3").on("click", function(){

			$("#header1").trigger("click");
		});

	$("#rel_site").on("change", function(){

			$(".text").text($(this).val());
		});
});
</script>
</head>
<body>

	<input type="button" id="btn1" value="버튼">

	<h1 id="header1">클릭 테스트</h1>
	
	<h1 id="header2">클릭  없애기</h1>
	
	<h1 id="header3">트리거</h1>
	
	<select id="rel_site">
		<option value="">사이트 선택</option>
		<option value="www.google.com">구글</option>
		<option value="www.naver.com">네이버</option>
		<option value="www.daum.net">다음</option>
	
	</select>
	
	<p class="text"></p>


</body>
</html>