<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Second Page</title>
</head>
<body>
<%
	out.println("secondPage.jsp<br>");
	out.println("하나의 PAGE속성:"+pageContext.getAttribute("name")+"<br>");
	out.println("하나의 REQUEST속성:"+request.getAttribute("name")+"<br>");
	out.println("하나의 SESSION속성:"+session.getAttribute("name")+"<br>");
	out.println("하나의 APPLICATION속성:"+application.getAttribute("name")+"<br>");
	String hyper="07_thirdpage.jsp?name="+request.getAttribute("name");
%>
<!-- <a href="07_thirdpage.jsp">또다른 페이지(third page)</a> -->
<a href="<%=hyper%>">또다른 페이지(third page)</a>
</body>
</html>