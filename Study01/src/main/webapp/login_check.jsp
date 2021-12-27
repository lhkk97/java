<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<% 
	if(request.getParameter("userid").equals("")) {
		out.print("<a href='login.jsp'>로그인</a>");
		out.print("<br>아이디를 입력하세요.");
	} else if(request.getParameter("passcode").equals("")) {
		out.print("<a href='login.jsp'>로그인</a>");
		out.print("<br>비밀번호를 입력하세요.");
	} else {
		out.print(request.getParameter("userid")+"&nbsp"+"<a href='home.jsp'>로그아웃</a>");
	}
%>

<!-- if(request.getParameter("userid").equals("xaexal") && -->
<!-- 		request.getParameter("passcode").equals("human123")) { -->
<!-- 		//request.setAttribute("userid", "xaexal");  -- 데이터전달 -->
<!-- 		request.setAttribute("userid", request.getParameter("userid")); -->
<!-- 		request.setAttribute("passcode", "human123"); -->
<!-- 		RequestDispatcher rd=request.getRequestDispatcher("login.jsp"); -->
<!-- 		rd.forward(request,response); -->
<!-- 	} else { -->
<!-- 		RequestDispatcher rd=request.getRequestDispatcher("register.jsp"); -->
<!-- 		rd.forward(request,response); -->
<!-- 	} -->
</body>
</html>