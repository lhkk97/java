<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calculate</title>
</head>
<body align=center>
<h5>calc.jsp 입니다.</h5>
<c:if test="${num!=null}">
<h1 align=center>result = ${num}</h1>
</c:if>
</body>
</html>