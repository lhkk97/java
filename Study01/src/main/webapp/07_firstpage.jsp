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
%>
firstPage.jsp<br>
하나의 PAGE속성:${pageScope.name}<br>
하나의 REQUEST속성:${requestScope.name}<br>
하나의 SESSION속성:${sessionScope.name}<br>
하나의 APPLICATION속성:${applicationScope.name}<br>

<jsp:forward page="07_secondpage.jsp"/>
<%--  	<jsp:param name="name" value="request man"/> --%>
<%-- </jsp:forward> --%>
<%-- <%@ page import="java.net.URLEncoder" %>	 --%>
<%-- <%
 	String name=(String)request.getAttribute("name");
 	response.sendRedirect("07_secondpage.jsp?name="+URLEncoder.encode(name,"UTF-8"));
%> --%>
</body>
</html>