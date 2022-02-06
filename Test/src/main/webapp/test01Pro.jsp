<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test01 처리</title>
</head>
<body>
<h1>원의 면적/원의 둘레를 계산합니다.</h1><hr>
<% 
 	String radius=request.getParameter("radius");
	double radius_d=Double.parseDouble(radius);
 	double area=Math.PI*Math.pow(radius_d,2);
 	double cir=2*Math.PI*radius_d;
%>
반지름: <%=radius %><br>
원의 면적: <%=area %><br>
원의 둘레: <%=cir %>
</body>
</html>