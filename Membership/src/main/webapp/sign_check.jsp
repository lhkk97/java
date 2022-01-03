<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%-- <%
 	String userid=request.getParameter("userid");
  	String passcode=request.getParameter("passcode");
  	application.setAttribute("userid",userid);
  	application.setAttribute("passcode",passcode);
%> --%>
<%-- <jsp:forward page="login.jsp"> --%>
<%-- 	<jsp:param name="userid" value="<%=userid %>"/> --%>
<%-- 	<jsp:param name="passcode" value="<%=passcode %>"/> --%>
<%-- </jsp:forward> --%>

<%
	String[] interest=request.getParameterValues("interest");
	//pageContext.setAttribute("areas",interest);
	pageContext.setAttribute("areas",String.join(",",interest));
%>
이름:<c:out value="${param.name}"/><br>
성별:<c:out value="${param.gender}"/><br>
아이디:<c:out value="${param.userid}"/><br>
비밀번호:<c:out value="${param.passcode}"/><br>
비밀번호확인:<c:out value="${param.pw_check}"/><br>
관심분야:
<c:forTokens var="area" items="${areas}" delims=",">
	<c:out value="${area}"/><br>
</c:forTokens>
<%-- <c:forEach var="area" items="${areas}"> --%>
<%-- 	<c:out value="${area}"/>, --%>
<%-- </c:forEach> --%>
