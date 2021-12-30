<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Third Page</title>
</head>
<body>
thirdPage.jsp<br>
하나의 PAGE속성:${pageScope.name}<br>
하나의 REQUEST속성:${requestScope.name}<br>
하나의 SESSION속성:${sessionScope.name}<br>
하나의 APPLICATION속성:${applicationScope.name}<br>
</body>
</html>