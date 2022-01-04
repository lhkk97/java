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
	String sql="select roomcode,name,type,howmany,howmuch from room order by roomcode";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotel Room</title>
</head>
<style>
table {border-collapse:collapse;}
tr,td,th {border:1px solid blue;}
</style>
<body>
<table>
<thead>
	<tr><th>객실코드</th><th>객실명</th><th>객실타입</th><th>숙박가능인원</th><th>숙박비</th></tr>
</thead>
<tbody>
<%
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection(url,userid,passcode);
	stmt=conn.createStatement();
	rs=stmt.executeQuery(sql);
	
	while(rs.next()) {
		int roomcode=rs.getInt("roomcode");
		String name=rs.getString("name");
		int type=rs.getInt("type");
		int howmany=rs.getInt("howmany");
		int howmuch=rs.getInt("howmuch");
		out.println("<tr><td>"+roomcode+"</td><td>"+name+"</td><td>"+type
				+"</td><td>"+howmany+"</td><td>"+howmuch+"</td></tr>");
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
	<td>객실코드 : <input type=number id=roomcode name=roomcode></td>
</tr>
<tr>
	<td>객실명 : <input type=text id=name name=name></td>
</tr>
<tr>
	<td>객실타입 : <input type=number id=type name=type></td>
</tr>
<tr>
	<td>숙박가능인원 : <input type=number id=howmany name=howmany></td>
</tr>
<tr>
	<td>숙박비 : <input type=number id=howmuch name=howmuch></td>
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
	if(($('#name').val() && $('#type').val() && 
			$('#howmany').val() && $('#howmuch').val())!='') {
		if($('#roomcode').val()!='') {
			$('#frmMenu').prop('action','update.jsp');
		} else {
			$('#frmMenu').prop('action','insert.jsp');
		}
	} else {
		if($('#roomcode').val()!='') {
			$('#frmMenu').prop('action','delete.jsp');
		} else {
			alert('객실명,객실타입,숙박가능인원,숙박비 확인해주세요.');
			return false;
		}
	}
	return true;
});
</script>
</html>