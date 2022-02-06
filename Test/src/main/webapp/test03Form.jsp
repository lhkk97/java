<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test03 폼</title>
</head>
<body>
<h1>로그인 폼</h1><hr>
<form method="post" action="test03Pro.jsp">
<table>
<tr>
	<td>아이디 : <input type=text name=id></td>
</tr>
<tr>
	<td>비밀번호 : <input type=password name=passcode></td>
</tr>
<tr>
	<td>
	<input type=submit id=login value="로그인">
	<input type=reset value="취소">
	</td>
</tr>
</table>
</form>
</body>
</html>