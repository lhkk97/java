<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INPUT</title>
</head>
<body>
<form method=post action="/exercise/calc">
<table>
<tr><td>x1: <input type=text id=x1 name=x1></td></tr>
<tr><td>x2: <input type=text id=x2 name=x2></td></tr>
<tr><td>op: <input type=text id=op name=op></td></tr>
<tr><td><input type=submit id=send value="send"></td></tr>
</table>
</form>

<%-- <c:if test="${num!=null}"> --%>
<%-- <h1 align=center>result = ${num}</h1> --%>
<%-- </c:if> --%>
<%-- <c:if test="${num==null}"> --%>
<%-- <h1 align=center>result = ${num}</h1> --%>
<%-- </c:if> --%>
</body>
</html>