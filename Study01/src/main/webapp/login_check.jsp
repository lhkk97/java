<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%  
	String userid=request.getParameter("userid");
	String passcode= request.getParameter("passcode");
	
	String jspfile=null;
	
    if(!userid.equals(application.getAttribute("userid"))) {
 		//response.sendRedirect("login.jsp");
    	jspfile="login.jsp";
    } else if(!passcode.equals(application.getAttribute("passcode"))) {
    	//response.sendRedirect("login.jsp");
    	jspfile="login.jsp";
    } else {  
    	//request.setAttribute("userid", userid);
    	//request.getRequestDispatcher("home.jsp").forward(request,response);
    	
//     	Cookie c=new Cookie("id",userid);
//     	c.setMaxAge(365*24*60*60);
//     	response.addCookie(c);
    	
//     	response.addCookie(new Cookie("passcode",passcode));
    	
    	session.setAttribute("userid", userid);
		session.setAttribute("passcode",passcode);
    	//response.sendRedirect("home.jsp");
    	jspfile="home.jsp";
    }
%>
<jsp:forward page="<%=jspfile %>"/>
