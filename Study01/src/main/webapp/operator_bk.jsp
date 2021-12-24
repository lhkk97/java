<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연산결과</title>
</head>
<body>
<%
	int v1=Integer.parseInt(request.getParameter("value1"));
	int v2=Integer.parseInt(request.getParameter("value2"));
	String op=request.getParameter("operator");

	int n=0;
	if(op.equals("+")) {
		n=v1+v2;
	} else if(op.equals("-") ) {
		n=v1-v2;
	} else if(op.equals("*")) {
		n=v1*v2;
	} else if(op.equals("/")) {
		n=v1/v2;
	} else return;
	
//	out.println("value:"+v1+"<br>"+"value2:"+v2+
//			"<br>operator:"+op+"<br>Result:"+n);
%>
value1:<%=v1%><br>
value2:<%=v2%><br>
operator:<%=op%><br>
result:<%=n%><br>
</body>
</html>