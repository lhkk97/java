<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h1>로그인 확인</h1><hr>
<table>
<tr>
<td>아이디: <%=session.getAttribute("id")%></td></tr>
<tr>
<td>비밀번호: <%=session.getAttribute("passcode")%></td></tr>
</table>
</body>
</html>