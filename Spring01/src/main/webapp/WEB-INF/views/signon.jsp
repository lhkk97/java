<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table, td, tr {
	border-collapse:collapse;
	border:1px solid black;
}
</style>
<body>
<form method="POST" action="/edu/signon_check">
<table align=center  valign=middle>
<tr><td>실명</td><td><input type=text name=name id=name></td></tr>
<tr><td>성별</td><td><input type="radio" name="gender" value="남성">남성
					<input type="radio" name="gender" value="여성">여성</td></tr>
<tr><td>아이디</td><td><input type=text name=userid id=userid></td></tr>
<tr><td>비밀번호</td><td><input type=password name=passcode id=passcode></td>
<tr><td>비밀번호 확인</td><td><input type=password name=passcode1 id=passcode1></td></tr>
<tr><td>모바일번호</td><td colspan=3><input type=text name=mobile id=mobile></td></tr>
<tr><td>관심분야</td>
	<td>
		<input type=checkbox name=interest value='정치'>정치
		<input type=checkbox name=interest value='경제'>경제
		<input type=checkbox name=interest value='사회'>사회<br>
		<input type=checkbox name=interest value='문화'>문화
		<input type=checkbox name=interest value='역사'>역사
		<input type=checkbox name=interest value='연예'>연예<br>
		<input type=checkbox name=interest value='스포츠'>스포츠
		<input type=checkbox name=interest value='예술'>예술
	</td>
</tr>
<tr><td colspan=2>
	<input type=submit id=done value="가입완료">&nbsp;&nbsp;
	<input type=reset id=reset value="비우기">&nbsp;&nbsp;
	<input type=button id=cancel value="취소">
</td></tr>
</table>
</form>
</body>
</html>