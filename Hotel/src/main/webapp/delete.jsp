<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	Connection conn=null;
	PreparedStatement pstmt=null;
	
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String userid="ora_user";
	String passcode="human123";
	String sql="delete from room where roomcode=?";
%>

<%
	try {
		if(!request.getParameter("name").equals("") || !request.getParameter("type").equals("") ||
				!request.getParameter("howmany").equals("") || !request.getParameter("howmuch").equals("")) {
			return;
		}
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn=DriverManager.getConnection(url,userid,passcode);
		pstmt=conn.prepareStatement(sql);
		
		pstmt.setString(1,request.getParameter("roomcode"));
		
		pstmt.executeUpdate();
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
		response.sendRedirect("controlroom.jsp");
	}
%>