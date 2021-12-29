<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 읽기</title>
</head>
<body>
<%
	Cookie[] cookies=request.getCookies();
	for(Cookie c: cookies) {
		out.println(c.getName()+":"+c.getValue()+"<br>");
	}
%>
</body>
</html>