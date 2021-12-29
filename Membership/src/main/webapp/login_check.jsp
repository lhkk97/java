<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%  
	String userid=request.getParameter("userid");
	String passcode= request.getParameter("passcode");
	String jspfile=null;
	
    if(!userid.equals(application.getAttribute("userid"))) {
    	jspfile="login.jsp";
    } else if(!passcode.equals(application.getAttribute("passcode"))) {
    	jspfile="login.jsp";
    } else {  
    	session.setAttribute("userid", userid);
		session.setAttribute("passcode",passcode);
    	jspfile="home.jsp";
    }
%>
<jsp:forward page="<%=jspfile %>"/>
