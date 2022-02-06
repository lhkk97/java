<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <c:set var="now" value="<%=new java.util.Date() %>"/> --%>
<jsp:useBean id="now" class="java.util.Date"/>
default : <c:out value="${now}"/><br>
Korea KST : <fmt:formatDate value="${now}"
				type="both" dateStyle="full" timeStyle="full"/><br>
<fmt:timeZone value="GMT">
Korea GMT :<fmt:formatDate value="${now}"
				type="both" dateStyle="full" timeStyle="full"/><br>
</fmt:timeZone>
<fmt:timeZone value="GMT-8">
Korea GMT-8 :<fmt:formatDate value="${now}"
				type="both" dateStyle="full" timeStyle="full"/><br>
</fmt:timeZone>
<%-- <%
if(request.getParameter("color")=="") {
%> --%>
<!-- 	<span style="color:magenta">마젠타</span> -->
<%-- <% } %> --%>

<%-- <c:if test="${param.color==1}"> --%>
<!-- 	<span style="color:red">빨강</span> -->
<%-- </c:if> --%>
<%-- <c:if test="${param.color==2}"> --%>
<!-- 	<span style="color:green">초록</span> -->
<%-- </c:if> --%>
<%-- <c:if test="${param.color==3}"> --%>
<!-- 	<span style="color:blue">파랑</span> -->
<%-- </c:if> --%>
<%-- <c:if test="${param.color==null}"> --%>
<!-- 	<span style="color:yellow">노랑</span> -->
<%-- </c:if> --%>

<%-- <c:choose> --%>
<%-- 	<c:when test="${param.color==4}"> --%>
<!-- 		<span style="color:pink">핑크</span> -->
<%-- 	</c:when> --%>
<%-- 	<c:when test="${param.color==5}"> --%>
<!-- 		<span style="color:skyblue">스카이블루</span> -->
<%-- 	</c:when> --%>
<%-- 	<c:otherwise> --%>
<!-- 		<span style="color:black">검정</span> -->
<%-- 	</c:otherwise> --%>
<%-- </c:choose> --%>
</body>
</html>