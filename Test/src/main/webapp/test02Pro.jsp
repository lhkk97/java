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
<title>test02 처리</title>
</head>
<style>
table,tr,td {border:1px solid black;}
#a,#b,#c,#d {
	width:80px;
	text-align:center;
	font-weight:bold;
}
#name,#age,#mobile,#address {width:300px;}
</style>
<body>
<h1>회원 정보 확인</h1><hr>
<table>
<tr>
	<td id=a>이름</td><td id=name><%=request.getParameter("name")%></td>
</tr>
<tr>
	<td id=b>나이</td><td id=age><%=request.getParameter("age")%></td>
</tr>
<tr>
	<td id=c>전화번호</td><td id=mobile><%=request.getParameter("mobile")%></td>
</tr>
<tr>
	<td id=d>주소</td><td id=address><%=request.getParameter("address")%></td>
</tr>
</table>
</body>
</html>