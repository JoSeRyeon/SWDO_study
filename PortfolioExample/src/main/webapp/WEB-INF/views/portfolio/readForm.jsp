<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포트폴리오 상세</title>
<script type="text/javascript">
function portfolioDelete(portfolio_no){
	location.href = "/portfolio/delete?portfolio_no="+portfolio_no;
}
function portfolioMain(){
	location.href = "/"
}
</script>
</head>
<body>
	<h1>[ 상세 정보 ]</h1>
	
	<table>
		<tr>
			<td>
				제목
			</td>
			<td>
				${vo.portfolio_title }
			</td>
		</tr>
		<tr>
			<td>
				종류
			</td>
			<td>
				${vo.portfolio_type }
			</td>
		</tr>
		<tr>
			<td>
				시작일
			</td>
			<td>
				${vo.portfolio_st }
			</td>
		</tr>
		<tr>
			<td>
				종료일
			</td>
			<td>
				${vo.portfolio_et }
			</td>
		</tr>
		<tr>
			<td>
				내용
			</td>
			<td>
				<textarea rows="20" cols="40" readonly="readonly">${vo.portfolio_content }</textarea>
			</td>
		</tr>
		<tr>
			<td>
				공개여부
			</td>
			<td>
				${vo.portfolio_gb }
			</td>
		</tr>
		<tr>
			<c:choose>
				<c:when test="${sessionScope.loginId == vo.applier_id }">
					<td>
						<input type="button" value="삭제" onclick="portfolioDelete('${vo.portfolio_no}')">
					</td>
					<td>
						<input type="button" value="메인으로" onclick="portfolioMain()">
					</td>
				</c:when>
				<c:otherwise>
					<td colspan="2">
						<input type="button" value="메인으로" onclick="portfolioMain()">
					</td>
				</c:otherwise>
			</c:choose>
		</tr>
	</table>
</body>
</html>