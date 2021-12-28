<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	//request.removeAttribute("userid"); 
	session.invalidate(); // 모든 session attribute를 삭제,제거
	response.sendRedirect("home.jsp");
%>
</body>
</html>