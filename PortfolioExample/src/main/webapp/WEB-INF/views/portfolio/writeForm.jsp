<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포트폴리오 작성</title>
<script type="text/javascript">
function formCheck(){

	var portfolio_title = document.getElementById("portfolio_title").value;
	var portfolio_type = document.getElementById("portfolio_type").value;
	var portfolio_st = document.getElementById("portfolio_st").value;
	var portfolio_et = document.getElementById("portfolio_et").value;
	var portfolio_content = document.getElementById("portfolio_content").value;
	
	if(portfolio_title == null || portfolio_title.length == 0){
		alert("제목을 입력해 주세요");
		return false;
	}

	if(portfolio_type == 0){
		alert("종류을 선택해 주세요");
		return false;
	}

	if(portfolio_st == null || portfolio_st.length == 0){
		alert("시작일을 입력해 주세요");
		return false;
	}

	if(portfolio_et == null || portfolio_et.length == 0){
		alert("종료일을 입력해 주세요");
		return false;
	}

	if(portfolio_content == null || portfolio_content.length == 0){
		alert("내용을 입력해 주세요");
		return false;
	}
	
	return true;
}
function portfolioList(){
	location.href = "/portfolio/list"
}
</script>
</head>
<body>
	<h1>[ 포트폴리오 작성 ]</h1>
	
	<form action="/portfolio/write" method="post" onsubmit="return formCheck();">
		<table>
			<tr>
				<td>
					제목
				</td>
				<td>
					<input type="text" name="portfolio_title" id="portfolio_title">
				</td>
			</tr>
			<tr>
				<td>
					종류
				</td>
				<td>
					<select name="portfolio_type" id="portfolio_type">
						<option value="0">--선택하세요--</option>
						<option value="1">학력정보</option>
						<option value="2">경력정보</option>
						<option value="3">프로젝트</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					시작일
				</td>
				<td>
					<input type="text" name="portfolio_st" id="portfolio_st">
				</td>
			</tr>
			<tr>
				<td>
					종료일
				</td>
				<td>
					<input type="text" name="portfolio_et" id="portfolio_et">
				</td>
			</tr>
			<tr>
				<td>
					내용
				</td>
				<td>
					<textarea rows="20" cols="40" name="portfolio_content" id="portfolio_content"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					공개
				</td>
				<td>
					안한다<input type="radio" name="portfolio_gb" id="portfolio_gb" value="0" checked="checked">
					한다<input type="radio" name="portfolio_gb" id="portfolio_gb" value="1">
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="작성">
				</td>
				<td>
					<input type="button" value="리스트로" onclick="portfolioList()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>