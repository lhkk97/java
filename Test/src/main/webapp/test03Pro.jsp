<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<% 
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test03 처리</title>
</head>
<body>
<%
	session.setAttribute("id",request.getParameter("id"));
	session.setAttribute("passcode",request.getParameter("passcode"));
%>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.ready(function() {
 	alert("<%=session.getAttribute("id")%>님 환영합니다.");
 	document.location='test03Pro02.jsp';
})
</script>
</html>
