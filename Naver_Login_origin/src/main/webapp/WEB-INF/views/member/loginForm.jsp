
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>[ 로그인 폼 ]</title>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script type="text/javascript">
function loginCheck(){

	var customer_id = $("#customer_id").val();
	var customer_pw = $("#customer_pw").val();

	if(customer_id == "" || customer_id.length == 0){
		alert("아이디를 입력해주세요");
		return false;
	} else if(customer_id.length < 3 || customer_id.length > 10){
		alert("아이디를 3~10글자로 입력해주세요");
		return false;
	}

	if(customer_pw == "" || customer_pw.length == 0){
		alert("비밀번호를 입력해주세요");
		return false;
	} else if(customer_pw.length < 3 || customer_pw.length > 10){
		alert("비밀번호를 3~10글자로 입력해주세요");
		return false;
	}

	return true;
}

</script>
</head>
<body>

	<h1>[ 로그인 ]</h1>
	
	<form action="/member/login" method="post" onsubmit="return loginCheck();">
		<table>
			<tr>
				<td> ID </td>
				<td> <input type="text" id="customer_id" name="id"> </td>
			</tr>
			
			<tr>
				<td> Password </td>
				<td><input type="password" id="customer_pw" name="password"> </td>
			</tr>
			
			<tr>
				<td colspan="2">
				<input type="submit" value="Login"> 
				</td>
			</tr>
		
		</table>
	
	</form>
	
<%
    String clientId = "4XBeSaYNtp8zLIHcXTPG";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8881/member/collback", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>
  <a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
	
</body>
</html>