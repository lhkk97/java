<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>room type</title>
</head>
<body>
<table>
<tr>
<td>
	<select id=selRoom style="width:250px" size=10>
	<c:forEach items="${alType}" var="t" varStatus="status">
		<option value='${t.typecode}'>${status.count} ${t.typename}</option>
	</c:forEach>	
	</select>
</td>
<td>
<form id=frmType action="/exercise/addType">
	<table>
	<tr><td>타입코드:</td>
		<td><input type=number name=typecode></td>
	</tr>
	<tr><td>객실타입명:</td>
		<td><input type=text name=typename></td>
	</tr>
	<tr><td colspan=2 align=center>
		<input type=submit value='추가'></td>
	</table> 
</form>
</td>
</tr>
</table>
</body>
</html>