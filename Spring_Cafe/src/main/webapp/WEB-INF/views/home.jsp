<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>카페관리</title>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css"/>
</head>
<body align=center>
<h1>
	주문관리
</h1>
<table style='border-collapse:collapse;' align=center>
	<tr>
		<td style='border:1px solid black;'>
			<table>
			<tr style='height:30px;'><td align=center>메뉴목록&nbsp;&nbsp;&nbsp;&nbsp;<button id=btnMenu>메뉴관리</button>
			<tr><td><select id=selMenu style='width:200px' size=10>
<c:forEach var="menu" items="${ml}">
	<option value="${menu.code}">${menu.name},${menu.price}</option>
</c:forEach>
			</select></td>
			<tr><td>메뉴명&nbsp;<input type=text id=menuname name=menuname readonly size=10>
				<input type=hidden id=code name=code></td></tr>
			<tr><td>수량&nbsp;<input type=number id=qty name=qty min=1 style="width:60px"></td></tr>
			<tr><td>금액&nbsp;<input type=number id=price name=price readonly style="width:100px">
				<input type=hidden id=net name=net></td></tr>
			<tr><td><button id=btnAdd>추가</button>&nbsp;<button id=btnReset>비우기</button></td></tr>
			</table>
		</td>
		<td style='border:1px solid black;'>
			<table>
			<tr style='height:30px;'><td align=center>주문내역</td></tr>
			<tr><td><select id=selOrder style='width:200px' size=10></select></td></tr>
			<tr><td>총액&nbsp;<input type=number id=total style='width:100px;'></td></tr>
			<tr><td>모바일&nbsp;<input type=text id=mobile name=mobile size=12></td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr><td align=right><button id=btnOrder>주문완료</button>&nbsp;<button id=btnCancel>주문취소</button></td></tr>
			</table>
		</td>
		<td style='border:1px solid black;' valign=top>
			<table>
			<tr style='height:30px;'><td align=center>매출내역&nbsp;&nbsp;&nbsp;&nbsp;<button id=btnSummary>summary</button></td></tr>
			<tr><td><select id=selSales style='width:400px' size=16>
<c:forEach var="sales" items="${sl}">
	<option>${sales.mobile} ${sales.name} x${sales.qty} ${sales.total} ${sales.sold_time}</option>
</c:forEach>
			</select></td></tr>
			</table>
		</td>
</table>
<div id=dlgMenu style='display:none;'>
<table>
<tr>
	<td>
		<select id=selMenu1 size=10 style='width:220px'></select>
	</td>
	<td valign=top>
		<table>
		<tr><td>code&nbsp;<input type=text id=d_code name=d_code size=3></td></tr>
		<tr><td>name&nbsp;<input type=text id=d_name name=d_name size=10></td></tr>
		<tr><td>price&nbsp;<input type=number id=d_price name=d_price style='width:100px'></td></tr>
		<tr><td align=right>
			<button id=btnDone>완료</button>&nbsp;
			<button id=btnEmpty>비우기</button>
		</td></tr>
		</table>
	</td>
</tr>
</table>
</div>
<div style="display:none" id=dlgSales>
<table>
<tr>
	<td><select style='width:200px' size=20 id=salesMenu></select></td>
	<td><select style='width:200px' size=20 id=salesMobile></select></td>
</tr>
</table>
</div>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script>
$(document)
.on('click','#btnSummary',function() {
	$('#dlgSales').dialog({
		modal:true,
		width:450,
		open:function(){
			$.post("/cafe/salesMenu",{},function(txt) {
				$('#salesMenu').empty();
				for(i=0;i<txt.length;i++) {
					let str='<option>'+txt[i]['name']+','+txt[i]['total']+'</option>';
					$('#salesMenu').append(str);
				}
			},'json');
			$.post("/cafe/salesMobile",{},function(txt) {
				$('#salesMobile').empty();
				for(i=0;i<txt.length;i++) {
					let str='<option>'+txt[i]['mobile']+','+txt[i]['total']+'</option>';
					$('#salesMobile').append(str);
				}
			},'json');
		},
		close:function(){
		
		}
	});
	return false;
})
.on('click','#btnOrder',function() {
	if($('#mobile').val()=='') {
		if(confirm('모바일번호를 입력하시겠습니까?')) return false;
		$('#mobile').val('-');
	}
	$('#selOrder option').each(function() {
// 		let str='<option>'+$('#mobile').val()+$(this).text()+'</option>';
// 		$('#selSales').append(str);
		// AJAX호출로 Database에 주문내역 저장 by calling $.post();
		str=$(this).text();
		let ar=str.split(' ');
		let oParam={mobile:$('#mobile').val(),menu_code:$(this).val(),
				qty:ar[1].substr(1),total:ar[2]};
		$.post('/cafe/insertSales',oParam,function(txt) {
			if(txt=='ok') {
				
			} else {
				
			}
		},'text');
	});
	$('#selOrder').empty();
	$('#total,#mobile').val('');

	return false;
})
.on('click','#btnCancel',function() {
	if(confirm('모든 주문을 취소하시겠습니까?')) {
		$('#selOrder').empty();
		$('#total,#mobile').val('');
	}
	return false;
})
.on('click','#btnReset',function() {
	$('#menuname,#qty,#price').val('');
})
.on('click','#btnAdd',function() {
	let str='<option value='+$('#code').val()+'>'+$('#menuname').val()+
			' x'+$('#qty').val()+' '+$('#price').val()+'</option>';
	$('#selOrder').append(str);
	$('#code,#menuname,#price,#net,#qty').val('');
	getSum();
	return false;
})
.on('keydown','#qty',function(event,ui) {
// 	console.log(event.keyCode) 버튼눌렀을 때 뭐가 날라오는지 알 수 있다.
	if(event.keyCode==13) {  // 13 : ender
		$('#btnAdd').trigger('click');
		return false;
	}
})
.on('click','#selMenu option',function() {
	$('#code').val($(this).val());
	let txt=$(this).text();
	let ar=txt.split(',');
	$('#menuname').val($.trim(ar[0]));
	$('#price,#net').val($.trim(ar[1]));
	$('#qty').val(1);
	return false;	
})
.on('change','#qty',function() {
 	let qty=parseInt($(this).val());
 	let net=parseInt($('#net').val());
 	$('#price').val(qty*net);
 	return false;
})

.on('click','#btnDone',function() {
	if($('#d_code').val()=='') {
		if($('#d_name').val()!='' && $('#d_price').val()!='') {  // insert
			operation="insertMenu";
		} else {
			alert('메뉴이름과 가격이 입력돼야 합니다.');
			return false;
		}
	} else {
		if($('#d_name').val()!='' && $('#d_price').val()!='') {  // insert
			operation="updateMenu";
		} else {
			operation="deleteMenu";
		}
	}
	let oParam={code:$('#d_code').val(),name:$('#d_name').val(),price:$('#d_price').val()};
	$.post('/cafe/'+operation,oParam,function(txt){
		if(txt=="ok") {
			$('#d_code,#d_name,#d_price').val('');
			loadMenu('selMenu1');
		} else {
			alert(operation+' was failed.');
		}
	},'text');
	return false;
})
.on('click','#btnEmpty',function() {
	$('#d_code,#d_name,#d_price').val('');
// 	$('input[id^="d_"]').val('');
	return false;  // prevent code form BUBBLING
})
.on('click','#selMenu1 option',function() {
	$('#d_code').val($(this).val());
	let txt=$(this).text();
	let ar=txt.split(',');
	$('#d_name').val($.trim(ar[0]));
	$('#d_price').val($.trim(ar[1]));
	return false;
})
.on('click','#btnMenu',function() {
	$('#dlgMenu').dialog({
		modal:true,
		width:450,
		open:function(){
			loadMenu('selMenu1');
		},
		close:function(){
			$('#selMenu1').empty();
			loadMenu('selMenu');
		}
	});
	return false;
});

function loadMenu(selTarget) {
	$('#'+selTarget).empty();
	$.post('/cafe/list',{},function(txt){
		for(i=0;i<txt.length;i++) {
			let mo=txt[i];
			let str='<option value='+mo['code']+'>'+mo['name']+','+mo['price']+'</option>';
			$('#'+selTarget).append(str);
		}
	},'json');
}

function getSum() {
	let total=0;
	$('#selOrder option').each(function() {
		let str=$(this).text();
		let ar=str.split(' ');
		total+=parseInt(ar[2]);
	});
	$('#total').val(total);
}

</script>
</html>
