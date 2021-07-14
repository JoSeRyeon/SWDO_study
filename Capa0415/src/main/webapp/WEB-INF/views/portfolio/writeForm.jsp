<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[포트폴리오 작성]</title>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<script type="text/javascript">

function backList(){

	location.href = "/portfolio/listForm";
}

function formCheck(){
	var portfolio_title = $("#portfolio_title").val();
	var portfolio_type =$("#portfolio_type option:selected").val();
	var portfolio_st = $("#portfolio_st").val();
	var portfolio_et = $("#portfolio_et").val();
	var portfolio_content = $("#portfolio_content").val();
	var portfolio_gb = $("input:radio[name=portfolio_gb]:checked").val();

	
	if(portfolio_title == "" || portfolio_title.length == 0){

		alert("제목을 입력해주세요");
		return false;
		
	} 

	if(portfolio_type == "" || portfolio_type.length == 0){

		alert("종류를 선택해주세요");
		return false;
		
	} 

	if(portfolio_st == "" || portfolio_st.length == 0){

		alert("시작일을 입력해주세요");
		return false;
		
	} 

	if(portfolio_et == "" || portfolio_et.length == 0){

		alert("종료일을 입력해주세요");
		return false;
		
	} 

	if(portfolio_content == "" || portfolio_content.length == 0){

		alert("내용을 입력해주세요");
		return false;
		
	} 
	
	return true;
}

</script>
</head>
<body>

	<h1>[ 포트폴리오 작성 ]</h1>
	
	<form action="/portfolio/write" method="post" onsubmit="return formCheck();">
	
		<table>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" id="portfolio_title" name="portfolio_title">
				</td>
			</tr>
			
			<tr>
				<td>종류</td>
				<td>
					<select id="portfolio_type" name="portfolio_type">
						<option value="" selected="selected">--선택하세요-- </option>
						<option value="1">학력정보</option>
						<option value="2">경력정보</option>
						<option value="3">프로젝트</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td>시작일</td>
				<td>
					<input type="text" id="portfolio_st" name="portfolio_st">
				</td>
			</tr>
			
			<tr>
				<td>종료일</td>
					
				<td>
					<input type="text" id="portfolio_et" name="portfolio_et">
				</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="15" cols="15" id="portfolio_content" name="portfolio_content"></textarea>
				</td>
			</tr>
			
			<tr>
				<td>공개</td>
				<td>
					안한다<input type="radio" name="portfolio_gb" value="0" checked="checked">
					한다<input type="radio" name="portfolio_gb" value="1">
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="submit" value="작성">
					<input type="button" onclick="backList()" value="리스트로">
					
				</td>
				
			</tr>
		
		
		</table>
	
	</form>
	
		

</body>
</html>