<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getParameter("userid").equals("xaexal") &&
		request.getParameter("passcode").equals("human123")) {
		//request.setAttribute("userid", "xaexal");  -- 데이터전달
		request.setAttribute("userid", request.getParameter("userid"));
		request.setAttribute("passcode", "human123");
		RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
		rd.forward(request,response);
	} else {
		RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
		rd.forward(request,response);
	}
%>
<script>
document.location="login.jsp?userid=xaexal&passcode=human123";
</script>