<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
   <title>[메인 화면]</title>
   


</head>
<body>

	<p id="pTag">선택자 연습</p>
	
	<input type="text" id="inputId" value="사용자가 입력한 값">

   <ul>
      <c:choose>
         <c:when test="${empty sessionScope.loginId }">
	         <li>
	         	<a href="/customer/joinForm">회원 가입 폼 이동</a>
	         </li>
	         <li>
	         	<a href="/customer/loginForm">로그인 폼 이동</a>
	         </li>
         </c:when>
         <c:otherwise>
            <a href="/customer/profile">${sessionScope.loginName}</a>님 환영합니다
            <li>
            <a href="/customer/logout">로그아웃</a>
            </li>
         </c:otherwise>
      </c:choose>
  
       
   </ul>


   

</body>
</html>
