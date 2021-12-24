<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>

실명:<%=request.getParameter("name") %><br>
성별:<%=request.getParameter("gender") %><br>
아이디:<%=request.getParameter("userid") %><br>
비밀번호:<%=request.getParameter("passcode") %><br>
비밀번호 확인:<%=request.getParameter("pw_check") %><br>
모바일:<%=request.getParameter("mobile") %><br>
관심분야:
<%
//	String[] interest=request.getParameterValues("interest");
//	for(int i=0;i<interest.length;i++) {
//		if(i!=0) out.println(",");
//		out.println(interest[i]);
//	}
	for(String area: request.getParameterValues("interest")) {
		out.println(area+"<br>");
	}
%>
<!--<input type=button onclick='showLogin()' value='로그인하기'>  -->
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.ready(function() {
	setTimeout(function() {
		document.location='login.jsp';
	},3000)
});
</script>
</html>