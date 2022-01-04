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
	String passcode="human";
	String sql="select*from menu";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table {border-collapse:collapse;}
tr,td,th {border:1px solid blue;}
</style>
<body>
<table>
<thead>
	<tr><th>메뉴</th><th>가격</th></tr>
</thead>
<tbody>
<%
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection(url,userid,passcode);
	stmt=conn.createStatement();
	rs=stmt.executeQuery(sql);
	
	while(rs.next()) {
		String name=rs.getString("name");
		int price=rs.getInt("price");
		out.println("<tr><td>"+name+"</td><td>"+price+"</td></tr>");
	}
} catch(Exception e) {
	e.printStackTrace();
} finally {
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
}
%>
</tbody>
</table><br><br><br>
<form method:"GET" action="" id=frmMenu>
<table>
<tr>
	<td>현재메뉴명 : <input type=text id=name name=name></td>
</tr>
<tr>
	<td>메뉴명 : <input type=text id=newname name=newname></td>
</tr>
<tr>
	<td>가격 : <input type=number id=price name=price></td>
</tr>
<tr>
	<td><input type=submit value='전송'>&nbsp;
	<input type=reset value='비우기'></td>
</tr>
</table>
</form> 
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('submit','#frmMenu',function(){
	if($('#name').val()!='') {
		if($('#newname').val()!='') {  // update
			$('#frmMenu').prop('action','update.jsp');
		} else {  // delete
			$('#frmMenu').prop('action','delete.jsp');
		}
	} else {  // insert
		if($('#newname').val()!='' && $('#price').val()!='') { // just insert
			$('#frmMenu').prop('action','addmenu.jsp');
		} else {
			alert('메뉴명과 가격이 모두 입력되어야 합니다.');
			return false;
		}
	}
	return true;
});
</script>
</html>