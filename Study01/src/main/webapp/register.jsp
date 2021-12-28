<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
</head>
<style>
	table {border-collapse:collapse;}
	td {border:1px solid skyblue;}
</style>
<body>
<form method="POST" action="register_check.jsp">
<table>
<tr>
	<td align=center>실명</td><td><input type=text name=name id=name></td>
	<td align=center>성별</td><td><input type="radio" name="gender" value="남성">남성
					<input type="radio" name="gender" value="여성">여성</td>
</tr>
<tr><td align=center>아이디</td><td colspan=3><input type=text name=userid id=userid></td></tr>
<tr><td align=center>비밀번호</td><td><input type=password name=passcode id=passcode></td>
	<td>비밀번호 확인</td><td><input type=password name=pw_check id=pw_check></td>
</tr>
<tr><td>모바일번호</td><td colspan=3><input type=text name=mobile id=mobile></td></tr>
<tr><td align=center>관심분야</td>
	<td colspan=3>
		<input type=checkbox name=interest value='정치'>정치
		<input type=checkbox name=interest value='경제'>경제
		<input type=checkbox name=interest value='사회'>사회
		<input type=checkbox name=interest value='문화'>문화<br>
		<input type=checkbox name=interest value='역사'>역사
		<input type=checkbox name=interest value='연예'>연예
		<input type=checkbox name=interest value='스포츠'>스포츠
		<input type=checkbox name=interest value='예술'>예술
	</td>
</tr>
<tr><td colspan=5 align=center>
	<input type=submit id=done value="가입완료">&nbsp;&nbsp;
	<input type=reset onclick="location.href='home.jsp'" id=cancel value="취소">
</td></tr>
</table>
</form>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('click','#done', function() {
	if($('#name').val()=='') {
		alert('이름을 입력하세요.');
		return false;
	}
	if($('#userid').val()=='') {
		alert('아이디를 입력하세요.');
		return false;
	}
	if($('#passcode').val()=='') {
		alert('비밀번호를 입력하세요.');
		return false;
	}
	if($('#pw_check').val()=='') {
		alert('비밀번호확인을 입력하세요.');
		return false;
	}
	if($('#passcode').val()!=$('#pw_check').val()) {
		alert('비밀번호와 비밀번호확인이 다릅니다.');
		return false;
	}
	if($('#mobile').val()=='') {
		alert('모바일을 입력하세요.');
		return false;
	}
	
	if($('input[name=gender]:checked').length==0) {
		alert('성별을 입력하세요.');	
		return false;
	}
	if($('input[name=interest]:checked').length==0) {
		alert('관심분야를 체크하세요.');
		return false;
	}

})
</script>
</html>