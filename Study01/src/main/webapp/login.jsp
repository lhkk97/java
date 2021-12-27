<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<form method=post action="login_check.jsp">
<table>
<tr><td>아이디</td><td><input type=text name=userid>
<tr><td>비밀번호</td><td><input type=text name=passcode></td></tr>
<tr><td colspan=2><input type=submit id=login value="로그인">&nbsp;
				<input type=reset onclick="location.href='home.jsp'" id=cancel value="취소">
</td></tr>
<tr><td colspan=2 align=right><a href='register.jsp'>회원가입</a>
</table>
</form>
</body>
</html>