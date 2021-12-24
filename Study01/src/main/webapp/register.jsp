<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
</head>
<body>
<form method="POST" action="memberServlet">
<table>
<tr>
<td>실명</td><td><input type=text name=name id=name></td>
<td>성별</td>
<td><input type="radio" name="gender" value="남성">남성
<input type="radio" name="gender" value="여성">여성</td></tr>
<tr><td>아이디</td><td><input type=text name=id id=id></td></tr>
<tr><td>비밀번호</td><td><input type=text name=password id=password></td>
<td>비밀번호확인</td><td><input type=text name=pw_check id=pw_check></td></tr>
<tr><td>모바일번호</td><td><input type=text name=mobile id=mobile></td></tr>
<tr><td>관심분야</td>
<td><input type=checkbox name=interest value='정치'>정치&nbsp;&nbsp;
<input type=checkbox name=interest value='경제'>경제&nbsp;&nbsp;
<input type=checkbox name=interest value='사회'>사회&nbsp;&nbsp;
<input type=checkbox name=interest value='문화'>문화&nbsp;&nbsp;</td>
<tr><td></td>
<td><input type=checkbox name=interest value='역사'>역사&nbsp;&nbsp;
<input type=checkbox name=interest value='연예'>연예&nbsp;&nbsp;
<input type=checkbox name=interest value='스포츠'>스포츠&nbsp;&nbsp;
<input type=checkbox name=interest value='예술'>예술</td>

<tr><td colspan=2 align=center>
	<input type=submit value="작성완료">&nbsp;&nbsp;
	<input type=reset value="Reset">
</td></tr>
</table>
</form>
</body>
</html>