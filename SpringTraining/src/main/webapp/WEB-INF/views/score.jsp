<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적</title>
</head>
<body>
<table>
<tr>
<td>
	<select id=selScore style="width:280px" size=10>
		<option>2021중간 20220617 수학 CG202001 96</option>
		<option>2021중간 20220617 수학 CG202002 78</option>
		<option>2021기말 20220920 국어 CG202001 80</option>
		<option>2021기말 20220920 국어 CG202002 90</option>			
	</select>
</td>
<td>
	<table>
		<tr><td>시험: </td>
			<td><input type=text id=title name=title></td>
		</tr>
		<tr><td>시험날짜: </td>
			<td><input type=number id=date name=date></td>
		</tr>
		<tr><td>과목: </td>
			<td><input type=text id=test_id name=test_id></td>
		</tr>
		<tr><td>아이디: </td>
			<td><input type=text id=st_id name=st_id></td>
		</tr>
		<tr><td>점수: </td>
			<td><input type=text id=point name=point></td>
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