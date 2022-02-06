<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test02 폼</title>
</head>
<body>
<h1>회원 입력 폼</h1><hr>
<form method="post" action="test02Pro.jsp">
<table>
<tr>
	<td>이름 : <input type=text name=name style='width:250px'></td>
</tr>
<tr>
	<td>나이 : <input type=text name=age style='width:250px'></td>
</tr>
<tr>
	<td>전화번호 : <input type=text name=mobile style='width:250px'></td>
</tr>
<tr>
	<td>주소 : <input type=text name=address style='width:250px'></td>
</tr>
<tr>
	<td colspan=2><input type=submit value="입력완료"></td>
</tr>
</table>
</form>
</body>
</html>