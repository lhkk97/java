<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table {border-collapse:collapse;}
tr,td,th{
	border:1px solid black;
}
</style>
<body>
<h1>부서별 직원명단 조회</h1>
부서명 : <select id=selDept>
<c:forEach items="${dept}" var="d">
	<option value="${d.d_id}">${d.dname}</option>
</c:forEach>
</select><br><br>
<table id=tblDept></table>
</body>
<script src="https:/code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('change','#selDept',function() {
	let did=$('#selDept').val();
	console.log(did);
	$.ajax({
		url:"/exercise/deptlist",
		data:{did:did},
		method:"GET",
		datatype:'json',
		beforeSend:function() {
			$('#tblDept').empty();
		},
		success:function(data) {
			for(i=0;i<data.length;i++) {
				let str='<tr><td>'+data[i]['eid']+'</td><td>'+
						data[i]['ename']+'</td><td>'+data[i]['mobile']
						+'</td><td>'+data[i]['salary']+'</td></tr>';
				$('#tblDept').append(str);
			}
		}
	});
})
</script>
</html>