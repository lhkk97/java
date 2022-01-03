<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String userid="ora_user";
	String passcode="human123";
	String sql="select*from departments";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employees</title>
</head>
<style>
table {border-collapse:collapse;}
td,th {border:1px solid blue;}
</style>
<body>
<table>
<tr><th>부서아이디</th><th>부서명</th><th>매니저사번</th></tr>
<%
try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn=DriverManager.getConnection(url,userid,passcode);
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		while(rs.next()) {
			int did=rs.getInt("department_id");
			String dname=rs.getString("department_name");
			int mid=rs.getInt("manager_id");
			out.println("<tr><td>"+did+"</td><td>"+dname+"</td><td>"
				+mid+"</td></tr>");
		}
} catch(Exception e) {
	e.printStackTrace();
} finally {
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
}
%>
</table>
</body>
</html>