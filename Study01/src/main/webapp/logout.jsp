<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	//request.removeAttribute("userid"); 
	session.invalidate(); // 모든 session attribute를 삭제,제거
	
// 	Cookie c = new Cookie("id",null);  // 쿠키 만들기
// 	c.setMaxAge(0); // 쿠키의 수명(유효기간) 지정
// 	response.addCookie(c);  // 클라이언트에 쿠키화일 생성(화일로 쓰기)
	
// 	Cookie c1 = new Cookie("passcode",null);
// 	c1.setMaxAge(0);
// 	response.addCookie(c1);
	
	response.sendRedirect("home.jsp");
%>
</body>
</html>