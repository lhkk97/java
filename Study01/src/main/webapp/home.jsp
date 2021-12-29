<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body align=right>
<%
	//if(request.getParameter("userid")==null) {
	String userid=(String)session.getAttribute("userid");
	if(userid==null) {
		out.print("<a href='login.jsp'>로그인</a>&nbsp;&nbsp<a href='register.jsp'>회원가입</a>");
	} else {
		out.print(userid+"&nbsp;&nbsp<a href='logout.jsp'>로그아웃</a>");
	}

// 쿠키
// 	Cookie[] cookies=request.getCookies();
// 	boolean flag=true;
// 	for(Cookie c:cookies) {
// 		if(c.getName().equals("id")) {
// 			out.println(c.getValue()+"&nbsp;&nbsp;<a href='logout.jsp'>로그아웃</a");
// 			flag=false;
// 			break;
// 		}
// 	}
// 	if(flag==true) {
// 		out.println("<a href='login.jsp'>로그인</a>&nbsp;&nbsp;<a href='register.jsp'>회원가입</a>");
// 	}
%>
</body>
</html>