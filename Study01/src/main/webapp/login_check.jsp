<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%  
	String userid=request.getParameter("userid");
	String passcode= request.getParameter("passcode");
	
    if(!userid.equals(application.getAttribute("userid"))) {
 		response.sendRedirect("login.jsp");
    } else if(!passcode.equals(application.getAttribute("passcode"))) {
    	response.sendRedirect("login.jsp");
    } else {  
    	//request.setAttribute("userid", userid);
    	//request.getRequestDispatcher("home.jsp").forward(request,response);
    	session.setAttribute("userid", userid);
   		response.sendRedirect("home.jsp");
    }
%>
