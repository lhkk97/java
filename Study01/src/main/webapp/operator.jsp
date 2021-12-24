<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="POST" action="opServlet">
<table>
<tr><td>value1:</td><td><input type=text name=value1 id=value1></td></tr>
<tr><td>value2:</td><td><input type=text name=value2 id=value2></td></tr>
<tr><td>operator:</td><td>
<select name="operator" size=4 style='width:120px'>
	<option value="+">+ (plus)</option>
	<option value="-">- (minus)</option>
	<option value="*">* (multiply)</option>
	<option value="/">/ (divide)</option>
</select></td></tr>
<tr><td colspan=2 align=center>
	<input type=submit value="전송">&nbsp;&nbsp;
	<input type=reset value="RESET">
</td></tr>
</table>
</form>
</body>
</html>