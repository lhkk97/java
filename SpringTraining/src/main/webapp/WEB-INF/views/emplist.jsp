<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table {border-collapse:collapse;}
td,tr,th {border:1px solid black;}
</style>
<body>
<button id=btnEmp>직원명단</button>
<input type=text id=txtKeyword>&nbsp;<button id=btnShow>&nbsp;직원명단조회<br></button>
<table id=tblEmp></table>
</body>
<script src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('click','#btnEmp',function() {
	$.ajax({url:'/exercise/empview',data:{},datatype:'json',method:"GET",
			beforeSend:function() {
				alert("ajax called");
			},
			success:function(txt) {
				console.log(txt);
				$('#tblEmp').empty();
				let head='<thead><tr><th>사번</th><th>이름</th><th>전화번호</th><th>매니저아이디</th><th>입사일자</th></tr></thead>';
				$('#tblEmp').append(head);
				for(i=0;i<txt.length;i++) {
					let str='<tr><td>'+txt[i]["emp_id"]+'</td><td>'+txt[i]["emp_name"]+'</td><td>'+txt[i]["mobile"]
							+'</td><td>'+txt[i]["manager_id"]+'</td><td>'+txt[i]["hire_date"]+'</td></tr>';
					$('#tblEmp').append(str);
				}
			}
	});		
})
.on('click','#btnShow',function() {
	$.ajax({url:'/exercise/empshow',data:{kw:$('#txtKeyword').val()},
			datatype:'json',method:"GET",
			success:function(txt) {
				console.log(txt);
				$('#tblEmp').empty();
				let head='<tr><td></td></tr><thead><tr><th>사번</th><th>이름</th><th>전화번호</th><th>매니저아이디</th><th>입사일자</th></tr></thead>';
				$('#tblEmp').append(head);
				for(i=0;i<txt.length;i++) {
					let str='<tr><td>'+txt[i]["emp_id"]+'</td><td>'+txt[i]["emp_name"]+'</td><td>'+txt[i]["mobile"]
							+'</td><td>'+txt[i]["manager_id"]+'</td><td>'+txt[i]["hire_date"]+'</td></tr>';
					$('#tblEmp').append(str);
				}
			}
	});		
})
</script>
</html>