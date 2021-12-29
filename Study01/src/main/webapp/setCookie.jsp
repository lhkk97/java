<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Cookie</title>
</head>
<body>
<%
	Cookie c = new Cookie("id","Laneige");  // 쿠키 만들기
	c.setMaxAge(365*24*60*60); // 쿠키의 수명(유효기간) 지정
	response.addCookie(c);  // 클라이언트에 쿠키화일 생성(화일로 쓰기)
%>
<h1>쿠키 설정</h1>
</body>
</html>