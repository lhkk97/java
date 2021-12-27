<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>First Page</title>
</head>
<body>
<%
	pageContext.setAttribute("name","page man");
	request.setAttribute("name","request man");
	session.setAttribute("name","session man");
	application.setAttribute("name","application man");

	out.println("firstPage.jsp<br>");
	out.println("하나의 PAGE속성:"+pageContext.getAttribute("name")+"<br>");
	out.println("하나의 REQUEST속성:"+request.getAttribute("name")+"<br>");
	out.println("하나의 SESSION속성:"+session.getAttribute("name")+"<br>");
	out.println("하나의 APPLICATION속성:"+application.getAttribute("name")+"<br>");

	//RequestDispatcher rd=request.getRequestDispatcher("07_secondpage.jsp");
	//rd.forward(request,response);
	request.getRequestDispatcher("07_secondpage.jsp").forward(request,response);
	response.sendRedirect("07_secondpage.jsp?name="+request.getAttribute("name"));
%>

<%@ page import="java.net.URLEncoder" %>	
<% 
	String name=(String)request.getAttribute("name");
	response.sendRedirect("07_secondpage.jsp?name="+URLEncoder.encode(name,"UTF-8"));
%>
<a href="07_secondpage.jsp">또다른 페이지(second page)</a>
</body>
</html>