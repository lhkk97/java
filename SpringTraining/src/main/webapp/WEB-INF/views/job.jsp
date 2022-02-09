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
<h1>직위별 직원명단 조회</h1>
직위명 : <select id=selJob>
<c:forEach items="${jobs}" var="job">
	<option value="${job.job_id}">${job.job_title}</option>
</c:forEach>
</select><br><br>
<table id=tblJob></table>

<h1>매니저별 직원 조회</h1>
매니저 : <select id=selManager>
<c:forEach items="${manager}" var="m">
	<option value="${m.manager_id}">${m.emp_name}</option>
</c:forEach>
</select><br><br>
<table id=tblManager></table>
</body>
<script src="https:/code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.ready(function() {
	console.log($('#selManager').val());
})
.on('change','#selJob',function() {
	let jobid=$('#selJob').val();
	$.ajax({
		url:"/exercise/position",
		data:{jobcode:jobid},
		method:"GET",
		datatype:'json',
		beforeSend:function() {
			$('#tblJob').empty();
		},
		success:function(data) {
			for(i=0;i<data.length;i++) {
				let str='<tr><td>'+data[i]['eid']+'</td><td>'+
						data[i]['ename']+'</td><td>'+data[i]['mobile']
						+'</td><td>'+data[i]['dname']+'</td></tr>';
				$('#tblJob').append(str);
			}
		}
	});
})

// $(document)
// .on('change','#selManager',function() {
// 	let did=$('#selManager').val();
// 	$.ajax({
// 		url:"/exercise/maglist",
// 		data:{did:did},
// 		method:"GET",
// 		datatype:'json',
// 		beforeSend:function() {
// 			$('#tblManager').empty();
// 		},
// 		success:function(data) {
// 			for(i=0;i<data.length;i++) {
// 				let str='<tr><td>'+data[i]['eid']+'</td><td>'+
// 						data[i]['ename']+'</td><td>'+data[i]['mobile']
// 						+'</td><td>'+data[i]['salary']+'</td></tr>';
// 				$('#tblManager').append(str);
// 			}
// 		}
// 	});
// })
</script>
</html>