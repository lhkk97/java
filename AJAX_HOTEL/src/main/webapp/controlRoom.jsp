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
table {
	border-collapse:collapse;
	font-family: 'Yeon Sung', cursive;
}

#tblRoom {
	margin: 150px auto 0px; 
	text-align:center;
	width:270px; height:180px;
	font-size:18px;
}
#tblRoom tr {border:1px solid gray;}
#roomcode,#name,#type,#howmany,#howmuch {
	background:#C7D3ED;
	text-align:center;
}
.btnGo {
	width:80px;
	border:2px solid gray;
	border-radius:5px;
	background:#C7D3ED;
}
.btnGo:hover {
	background:#6D7993;
	color:white;
}
#tblRoom2 {
	background:#D9E5FF;
	text-align:center;
	width:500px;
}
#tblRoom2 thead {
	background:white;
	font-size:25px;
}
#tblRoom2 td,tr,th {border:1px solid gray;}
</style>
<body>
<table id=tblRoom align=center>
<tr><td>객실번호</td><td><input type=number id=roomcode></td></tr>
<tr><td>객실명</td><td><input type=text id=name></td></tr>
<tr><td>객실종류</td><td><input type=number id=type></td></tr>
<tr><td>숙박가능인원</td><td><input type=number id=howmany></td></tr>
<tr><td>숙박비</td><td><input type=number id=howmuch></td></tr>
<tr><td colspan=2><input type=button id=btnGO class=btnGo value='전송'></td></tr>
</table><br><br><br>
<table id=tblRoom2 align=center>
<thead>
	<tr><th>객실번호</th><th>객실명</th><th>객실종류
	</th><th>숙박가능인원</th><th>숙박비</th></tr>
</thead>
<tbody></tbody>
</table>
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