<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[고객 프로필 확인 화면]</title>
</head>
<body>
	<h1>[고객 프로필]</h1>

	<img alt="" src="/resources/images/profile${profile.profile_image }.png">
	<br>
	<p> ${profile.profile_pr }</p>

	
</body>
</html>