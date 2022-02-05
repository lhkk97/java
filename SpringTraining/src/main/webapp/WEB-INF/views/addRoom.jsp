<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실관리</title>
</head>
<body>
<table>
<tr>
<td>
	<select id=selRoom style="width:250px" size=10>
	<c:forEach items="${alRoom}" var="r" varStatus="status">
		<option value='${r.roomcode}'>${status.count} ${r.name} ${r.type} ${r.howmany} ${r.howmuch}</option>
	</c:forEach>	
	</select>
</td>
<td>
	<form id=frmRoom action="/exercise/addRoom">
		<input type=hidden id=roomcode name=roomcode>
		<table>
		<tr><td>객실명: </td>
			<td><input type=text id=roomname name=roomname></td>
		</tr>
			<tr><td>타입: </td>
			<td><select id=roomtype name=roomtype>
				<option value=''>-</option>
			<c:forEach items="${alType}" var="t" varStatus="status">
				<option value='${t.typecode}'>${t.typename}</option>
			</c:forEach>	
			</select></td>
		</tr>
		<tr><td>숙박가능인원: </td>
			<td><input type=number id=howmany name=howmany></td>
		</tr>
		<tr><td>숙박비: </td>
			<td><input type=number id=howmuch name=howmuch></td>
		</tr>
		<tr><td colspan=2 align=center>
			<input type=submit value='추가'>
			<input type=button id=Delete value='삭제'></td>
		</tr>
		</table>
	</form>
</td>
</tr>
</table>
</body>
<script src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('click','#selRoom option',function() {
	console.log($(this).val()+','+$(this).text());
	$('#roomcode').val($(this).val());

	let str=$(this).text();
	let ar=str.split(' ');
	$('input[name=roomname]').val($.trim(ar[1]));
	$('input[name=howmany]').val($.trim(ar[3]));
	$('input[name=howmuch]').val($.trim(ar[4]));
	
	let roomtype=$.trim(ar[2]);
	$('#roomtype').val('');
	$('#roomtype option').each(function() {
		if($(this).text()==roomtype) {
			$(this).prop('selected','selected');
			return false;
		}
	})
	
	return false;
})

.on('click','#Delete',function() {
	let url="/exercise/deleteRoom?roomcode="+$('#roomcode').val();
	console.log(url);
	document.location=url;
})
</script>
</html>