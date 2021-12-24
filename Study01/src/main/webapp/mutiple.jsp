<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다중선택</title>
</head>
<body>
<form method=post action=multiple_bk.jsp>
<table>
<tr><td>
<input type=checkbox name=item value='신발'>신발
<input type=checkbox name=item value='가방'>가방
<input type=checkbox name=item value='벨트'>벨트
<input type=checkbox name=item value='모자'>모자
<input type=checkbox name=item value='시계'>시계
<input type=checkbox name=item value='반지'>반지
</td></tr>
<tr><td>
	<input type=submit value="작성완료">&nbsp;&nbsp;
	<input type=reset value="Reset">
</td></tr>
</table>
</form>
</body>
</html>
