<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴추가</title>
</head>
<body>
<table>
<tr>
<td>
	<select id=selMenu style="width:250px" size=10>
	<c:forEach items="${alMenu}" var="m" varStatus="status">
		<option value='${m.code}'>${status.count} ${m.name} ${m.price}</option>
	</c:forEach>	
	</select>
</td>
<td>
<form action="/exercise/addMenu" id="frmAddMenu">
	<input type=text id=code name=code>
	<table>
		<tr><td>메뉴명:</td>
			<td><input type=text name=menu_name></td>
		</tr>
		<tr><td>가격:</td>
			<td><input type=number name=price></td>
		</tr>
		<tr><td colspan=2 align=center>
			<input type=submit value="추가">
			<input type=button value="삭제" id=btnDelete>
			<input type=reset value="비우기"></td>
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
.on('sumit','#frmAddMenu',function() {
	if($('input[name=menu_name]').val()=='' ||
			$('input[name=price]').val()=='') {
		alert('두 값이 입력되어야 합니다.');
		return false;
	}
	return true;
})	
.on('click','#selMenu option',function() {
	console.log($(this).val()+','+$(this).text());
	$('#code').val($(this).val());
	
	let str=$(this).text();
	let ar=str.split(' ');
	$('input[name=menu_name]').val($.trim(ar[1]));
	$('input[name=price]').val($.trim(ar[2]));
	return false;
	
})
.on('click','#btnDelete',function() {
	let url="/exercise/deleteMenu?code="+$('#code').val();
	console.log(url);
	document.location=url;
})
</script>
</html>