<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생</title>
</head>
<body>
<table>
<tr>
<td>
	<select id=selScore style="width:250px" size=10>
		<option>CG202001 이현경 01011112222 3</option>
		<option>CG202002 박지후 01023234545 3</option>
		<option>CG202003 윤찬영 01033333333 3</option>
		<option>CG202101 조이현 01065332222 2</option>	
		<option>CG202102 유인수 01078789999 2</option>	
		<option>CG202103 이유미 01012345678 2</option>		
	</select>
</td>
<td>
	<table>
		<tr><td>아이디: </td>
			<td><input type=text id=st_id name=st_id></td>
		</tr>
		<tr><td>이름: </td>
			<td><input type=text id=name name=name></td>
		</tr>
		<tr><td>전화번호: </td>
			<td><input type=number id=mobile name=mobile></td>
		</tr>
		<tr><td>학년: </td>
			<td><input type=number id=grade name=grade></td>
		</tr>
		<tr><td colspan=2 align=center>
			<input type=submit value='추가'>
			<input type=button id=Delete value='삭제'>
			<input type=reset value="비우기"></td>
		</tr>
	</table>
</td>
</tr>
</table>
</body>
</html>