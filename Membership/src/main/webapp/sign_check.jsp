<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
 	String userid=request.getParameter("userid");
 	String passcode=request.getParameter("passcode");
 	application.setAttribute("userid",userid);
 	application.setAttribute("passcode",passcode);
%>
<jsp:forward page="login.jsp">
	<jsp:param name="userid" value="<%=userid %>"/>
	<jsp:param name="passcode" value="<%=passcode %>"/>
</jsp:forward>