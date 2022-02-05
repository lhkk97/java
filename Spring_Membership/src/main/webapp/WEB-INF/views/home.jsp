<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>

<form name="frm" action="/membership/logout" method="POST">
	<input type="hidden" name="userid" value="${userid}">
</form>

<c:if test="${userid==null}">
<a href="/membership/login">로그인</a>&nbsp;&nbsp;<a href="/membership/signon">회원가입</a>
</c:if>
<c:if test="${userid!=null}">
${userid}&nbsp;&nbsp;<a href="#" onclick="if(confirm('로그아웃하시겠습니까?')){javascript:document.frm.submit();return false;}">로그아웃</a>
</c:if>
</body>
</html>
