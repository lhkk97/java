<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<form method=post action="/membership/login_check" id=frmLogin>
<table align=center>
<tr><td>아이디</td>
	<td><input type=text name=userid id=userid value="${userid}">
	<input type=hidden name=user id=user value="${user}">
	</td><tr>
<tr><td>비밀번호</td>
	<td><input type=password name=passcode id=passcode></td></tr>
<tr><td colspan=2>
	<input type=submit id=login value="로그인">&nbsp;
	<input type=reset id=reset1 value="비우기">&nbsp;
	<input type=button id=cancel1 value="취소">
</td></tr>
<tr><td colspan=2><a href='/membership/signon'>회원가입</a></td></tr>
</table>
</form>
<c:if test="${user=='fail'}">
	<script type="text/javascript">
		alert("로그인에 실패했습니다. 아이디와 비밀번호를 다시 입력해주세요.");
	</script>
</c:if>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
// 로그인 -> 취소버튼
.on('click','#cancel1',function() {
	if(confirm("취소하면 홈화면으로 돌아갑니다. 취소하시겠습니까?")) {
		document.location="/membership/";
		return false;
	}
})
// 로그인 -> 로그인버튼
.on('submit','#frmLogin',function() {
	if($('#userid').val()=='') {
		alert('아이디를 입력하세요.');
		return false;
	}
	if($('#passcode').val()=='') {
		alert('비밀번호를 입력하세요.');
		return false;
	}
})
</script>
</html>