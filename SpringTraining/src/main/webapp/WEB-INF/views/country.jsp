<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Country</title>
</head>
<style>
table {border-collapse:collapse;}
tr,td,th{
	border:1px solid black;
}
</style>
<body>
<table>
<thead>
<tr><th>ID</th><th>ISO_CODE</th><th>NAME</th><th>REGION</th></tr>
</thead>
<c:forEach items="${cty}" var="cty">
	<tr><td>${cty.country_id}</td>
		<td>${cty.country_iso_code}</td>
		<td>${cty.country_name}</td>
		<td>${cty.country_region}</td>
	</tr>	
</c:forEach>
</table>
</body>
</html>