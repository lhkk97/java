<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실관리</title>
</head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Yeon+Sung&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
body {
	background: linear-gradient(to right, #F8FFFF, #F6F6F6);
}
table {
	border-collapse:collapse;
	font-family: 'Yeon Sung', cursive;
}
h1,h2{
	text-align:center;
	font-family: 'Yeon Sung', cursive;
	font-weight:100;
}
h5 {
	font-family: 'Gowun Dodum', sans-serif;
	text-align:center;
}
h4{
	font-family: 'Gowun Dodum', sans-serif;
	text-align:center;
	opacity:0;
}
h4:hover {
	opacity:1;
}
#tblRoom {
	background:white;
	text-align:center;
	width:300px; height:200px;
	font-size:20px;
}
#tblRoom tr,td {border:1px solid gray;}
#roomcode,#name,#type,#howmany,#howmuch {
	background: rgba(199, 211, 237, 0.5);
	text-align:center;
}
.btnGo,#cancel {
	width:80px;
	border:1px solid gray;
	border-radius:5px;
	background:#C7D3ED;
	font-family: 'Yeon Sung', cursive;
	font-weight:100; font-size:18px;
}
.btnGo:hover,#cancel:hover {
	background:#6D7993;
	color:white; 
	font-family: 'Yeon Sung', cursive;
}

#tblRoom2 {
	background:#D9E5FF;
	text-align:center;
	width:550px;
}
#tblRoom2 thead {
	background:white;
	font-size:25px;
}
#tblRoom2 td,tr,th {
	border:1px solid gray;
	font-weight:100;
}
</style>
<body>
<div style='width:50%; float:left'>
<h1>객실목록</h1>
<table id=tblRoom2 align=center>
<thead>
	<tr><th>객실번호</th><th>객실명</th><th>객실종류
	</th><th>숙박가능인원</th><th>숙박비</th></tr>
</thead>
<tbody></tbody>
</table>
</div>

<div style='width:50%; float:right'>
<h1>객실관리</h1>
<table id=tblRoom align=center>
<tr><td>객실번호</td><td><input type=number id=roomcode></td></tr>
<tr><td>객실명</td><td><input type=text id=name></td></tr>
<tr><td>객실종류</td><td><input type=number id=type></td></tr>
<tr><td>숙박가능인원</td><td><input type=number id=howmany></td></tr>
<tr><td>숙박비</td><td><input type=number id=howmuch></td></tr>
<tr><td colspan=2>
	<input type=button id=btnGO class=btnGo value='전송'>
	<input type=reset id=cancel value='비우기'>
</td></tr>
</table><br><br>
<h2>information</h2>
<h5>정보를 보고싶다면, 아래에 마우스를 올려놓으세요.</h5>
<h4>게재<br>
객실번호 외에 모두 값을 입력하세요.<br><br>
수정<br>
수정할 객실번호를 입력하고 객실명,객실종류,숙박가능인원,숙박비에 수정할 값을 입력하세요.<br><br>
삭제<br>
삭제할 객실번호만 입력하세요.</h3>
</div>
</body>
<script src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.ready(function() {
 	loadRoom();
 	return false;
})
.on('click','#btnGO',function() {
	let operation='';
	if($('#roomcode').val()=='') {
		if($('#name').val()!='' && $('#type').val()!='' &&
		$('#howmany').val()!='' && $('#howmuch').val()!='' ) {
			operation="insert";
		} else {
			alert('입력값이 모두 채워지지 않았습니다.');
			return false;
		}
	} else {
		if($('#name').val()!='' && $('#type').val()!='' &&
		$('#howmany').val()!='' && $('#howmuch').val()!='' ) {
			operation="update";
		} else {
			operation="delete";
		}
	}
	$.get(operation,{roomcode:$('#roomcode').val(),
		name:$('#name').val(),type:$('#type').val(),
		howmany:$('#howmany').val(),howmuch:$('#howmuch').val()},
		function(){
			$('#name,#type,#howmany,#howmuch,#roomcode').val('');
			loadRoom();
		},'text');
	return false;
});

function loadRoom() {
	$('#tblRoom2 tbody').empty();
	$.get('select',{},function(txt){
 		if(txt=='') return false;
		let rec=txt.split(';');
		for(i=0;i<rec.length;i++) {
			let field=rec[i].split(',');
			let html='<tr><td>'+field[0]+'</td><td>'+field[1]+'</td><td>'+
				field[2]+'</td><td>'+field[3]+'</td><td>'+field[4]+'</td></tr>';
			$('#tblRoom2 tbody').append(html);
		}
 	},'text');
}
</script>
</html>