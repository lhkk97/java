<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=utf-8");
%>
<jsp:useBean id="member" class="member.Member"/>
<jsp:setProperty name="member" property="*"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table,tr,td {border:1px solid black;}
#a,#b,#c,#d,#e {
	font-weight:bold;
	text-align:center;
	width:130px;
}
#userid,#name,#age,#mobile {width:200px;}
</style>
<body>
<table>
<tr><td colspan=2 id=a>회원 정보 확인</td></tr>
<tr><td id=b>회원 아이디</td><td id=userid><jsp:getProperty name="member" property="userid"/></td></tr>
<tr><td id=c>회원 이름</td><td id=name><jsp:getProperty name="member" property="name"/></td></tr>
<tr><td id=d>회원 나이</td><td id=age><jsp:getProperty name="member" property="age"/></td></tr>
<tr><td id=e>회원 전화</td><td id=mobile><jsp:getProperty name="member" property="mobile"/></td></tr>
</table>
</body>
</html>