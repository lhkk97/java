<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page session=true %> --%>
<%-- <%!
 int global_cnt=0;
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 선언부</title>
</head>
<body>
<%-- <%
 int local_cnt=0;
 out.print("local_cnt:");
 out.print(++local_cnt);

 out.println("<br>global_cnt:");
 out.print(global_cnt++);
 %> --%>
<%="getContextPath ["+request.getContextPath()+"]<br>" %>
<%="getMethod ["+request.getMethod()+"]<br>" %>
<%="getRequestURL ["+request.getRequestURL()+"]<br>" %>
<%="getRequestURI ["+request.getRequestURI()+"]<br>" %>
<%="getQueryString ["+request.getQueryString()+"]<br>" %>
<%="getSession(true) ["+request.getSession()+"]<br>" %>
<%="getRequestDispatcher ["+request.getRequestDispatcher("03_dec.jsp")+"]<br>" %>
<%="getRemoteHost ["+request.getRemoteHost()+"]<br>" %>
<%="getRemoteAddr ["+request.getRemoteAddr()+"]<br>" %>
<%="getSession ["+request.getSession()+"]<br>" %>
<%="getServerName ["+request.getServerName()+"]<br>" %>
<%="getProtocol ["+request.getProtocol()+"]<br>" %>
</body>
</html>