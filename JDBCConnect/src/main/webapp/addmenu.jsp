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
	String passcode="human";
	String sql="insert into menu values(?,?)";
%>

<%
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn=DriverManager.getConnection(url,userid,passcode);
		pstmt=conn.prepareStatement(sql);
		
		pstmt.setString(1,request.getParameter("newname"));
		pstmt.setInt(2,Integer.parseInt(request.getParameter("price")));
		
		pstmt.executeUpdate();		
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
		response.sendRedirect("controlmenu.jsp");
	}
%>