<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign on</title>
</head>
<body>
<style>
table, td, tr {
	border-collapse:collapse;
	border:1px solid black;
}
</style>
<body>
<table align=center  valign=middle>
<tr><td>실명</td><td><input type=text name=name id=name></td></tr>
<tr><td>성별</td><td><input type="radio" name="gender" value="남성">남성
					<input type="radio" name="gender" value="여성">여성</td></tr>
<tr><td>아이디</td><td><input type=text name=userid id=userid></td></tr>
<tr><td>비밀번호</td><td><input type=password name=passcode id=passcode></td>
<tr><td>비밀번호 확인</td><td><input type=password name=passcode1 id=passcode1></td></tr>
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
	<input type=submit id=done value="가입완료">&nbsp;
	<input type=reset id=reset value="비우기">&nbsp;
	<input type=button id=cancel value="취소">
</td></tr>
</table>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
// 회원가입(signon) -> 가입완료 버튼
.on('click','#done',function() {
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
	if($('#passcode1').val()=='') {
		alert('비밀번호확인을 입력하세요.');
		return false;
	}
	if($('#passcode').val()!=$('#passcode1').val()) {
		alert('비밀번호와 비밀번호확인이 다릅니다.');
		return false;
	}
	if($('input[name=gender]:checked').length==0) {
		alert('성별을 입력하세요.');	
		return false;
	}
	if($('input[name=interest]:checked').length==0) {
		alert('관심분야를 하나 이상 체크하세요.');
		return false;
	}

	let str='';
	$('input[name=interest]:checked').each(function() {
		str+=','+$(this).val();
	});
	let interest=str.replace(',','');
	console.log(interest);
	let oParam={name:$('#name').val(),gender:$('input[name=gender]:checked').val(),
				userid:$('#userid').val(),passcode:$('#passcode').val(),
				interest:interest};
	console.log(oParam);
	$.post('/membership/signon_check',oParam,function(txt){
		if(txt=="overlap") {
			alert("이미 등록된 아이디입니다.");
		} else if(txt=="ok") {
			alert("회원가입이 완료되었습니다.");
			document.location="/membership/login";
		} else {
			alert("회원가입에 실패했습니다. 다시 등록해주세요.");
		}
	},'text');
	return false;
})
//회원가입 -> 비우기 버튼
.on('click','#reset',function() {
	if(confirm("작성한 것을 전부 비우시겠습니까?")) {
		$('#name,#userid,#passcode,#passcode1').val('');
		$('input[name=gender]:checked').prop('checked',false);
		$('input[name=interest]:checked').prop('checked',false);
		return false;
	}
})
//회원가입 -> 취소 버튼
.on('click','#cancel',function() {
	if(confirm("취소하면 로그인화면으로 돌아갑니다. 취소하시겠습니까?")) {
		document.location="/membership/login";
		return false;
	}
})
</script>
</html>