<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바빈 객체 생성하기(by useBean action tag)</title>
</head>
<body>
<jsp:useBean id="member" class="com.ncs7.javabeans.MemberBean"/>
<%
	//member.setName("dd");
	//member.setUserid("dddd");
%>
<jsp:setProperty name="member" property="name" value="aa"/>
<jsp:setProperty name="member" property="userid" value="dddd"/>
<%-- 이름 : <%=member.getName() %><br> --%>
<%-- 아이디 : <%=member.getUserid() %><br> --%>
이름 : <jsp:getProperty name="member" property="name"/>
아이디 : <jsp:getProperty property="userid" name="member"/>
</body>
</html>