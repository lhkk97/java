<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method=post action="/edu/doLogin">
<table align=center>
<tr><td>아이디</td>
	<td><input type=text name=userid id=userid value="${id}"></td><tr>
<tr><td>비밀번호</td>
	<td><input type=password name=passcode id=passcode value="${pw}"></td></tr>
<tr><td colspan=2>
	<input type=submit id=login value="로그인">&nbsp;
	<input type=reset id=reset1 value="비우기">&nbsp;
	<input type=button id=cancel1 value="취소">
</td></tr>
<tr><td colspan=2><a href='/edu/signon'>회원가입</a></td></tr>
</table>
</form>
<br><br>
<img src="animal/cat1.jfif" width='300px' height=300px>
</body>
</html>