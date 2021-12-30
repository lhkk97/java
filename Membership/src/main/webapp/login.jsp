<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<link rel="stylesheet" href="member.css">
<body>
<jsp:include page="header.jsp"/>
<form method=post action="login_check.jsp">
<table align=center>
<tr><td>아이디</td><td><input type=text name=userid id=userid></td><tr>
<tr><td>비밀번호</td><td><input type=password name=passcode id=passcode></td></tr>
<tr><td colspan=2>
	<input type=submit id=login value="로그인">&nbsp;
	<input type=reset id=reset1 value="비우기">&nbsp;
	<input type=button id=cancel1 value="취소">
</td></tr>
<tr><td colspan=2><a href='signon.jsp'>회원가입</a></td></tr>
</table>
</form>
<jsp:include page="footer.jsp"/>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('click','#cancel1',function() {
	document.location='home.jsp';
	return false; 
})
.on('click','#login',function() {
	if($('#userid').val()=='') {
		alert('userid is empty.');
		return false;  // form tag 중단 -> 현재화면(login.jsp)에서 중지.
	} 
	if($('#passcode').val()=='') {
		alert('password is not given');
		return false;
	} 
	return true; //  form tag 진행->서버로 데이터전달 & login_check.jsp 실행
})
</script>
</html>