<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setAttribute("num1",3);
	request.setAttribute("num2",4);
//	int num1=(Integer)request.getAttribute("num1");
//	int num2=(Integer)request.getAttribute("num2");
%>

${num1+num2}
</body>
</html>