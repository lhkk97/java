<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">

<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic-coding.css" rel="stylesheet">

<link rel="stylesheet" href="cafe.css">
<meta charset="UTF-8">
<title>CAFE</title>
</head>
<body>
<h1>101 Cafe</h1><hr>
<table align=center>
<tr>
	<td>
	<table class='bound1'>
		<caption>메뉴목록</caption>
		<tr style='height:15px;'><td></td></tr>
		<tr>
			<td colspan=2 valign=top><select id=selMenu size=12></select></td>
		</tr>
		<tr>
			<td id=a>&nbsp;메뉴명</td>
			<td><input type=text id=menu_name readonly> ☆</td>
		</tr>
		<tr>
			<td id=a>&nbsp;수량</td>
			<td><input type=number id=qty min=1> 잔</td>
		</tr>
		<tr>
			<td id=a>&nbsp;총액</td>
			<td><input type=number id=menu_price readonly> 원</td>
		</tr>
		<tr style='height:15px;'><td></td></tr>
		<tr>
			<td colspan=2><button id=btnReset>취소</button>
			<button id=btnAdd>주문</button></td>
		</tr>
		<tr>
			<td colspan=2 align=center>
				<button id=btnMenu>메뉴관리</button>
			</td>
		</tr>
		<tr style='height:15px;'><td></td></tr>
	</table>
	</td><td>
	<table class='bound2'>
		<caption>주문목록</caption>
		<tr style='height:15px;'><td></td></tr>
    	<tr>
    		<td colspan=2 valign=top><select id=selOrder size=12></select></td>
   		</tr>
    	<tr>
       		<td id=a>&nbsp;총액</td>
       	 	<td><input type=number id=total> 원</td>
    	</tr>
    	<tr>
       	 	<td id=a>&nbsp;모바일</td>
        	<td><input type=text id=mobile size=13> ☎</td>
    	</tr>
    	<tr>
        	<td colspan=2>&nbsp;</td>
    	</tr>
    	<tr>
    		<td colspan=2><button id=btnDone>주문완료</button></td>
    	</tr>
    	<tr>
        	<td colspan=2><button id=btnCancel>주문취소</button></td>
    	</tr>
    	<tr style='height:15px;'><td></td></tr>
	</table>
	</td><td>
	<table class='bound3'>
		<caption>판매내역</caption>
		<tr style='height:15px;'><td></td></tr>
		<tr>
			<td align=center class='bound' valign=top>
            <select id=selSales size=20></select>
        </td></tr>
        <tr>
        	<td colspan=2 align=center>
				<button id=btnSum>summary</button>
			</td>
		</tr>
		<tr style='height:15px;'><td></td></tr>
    </table>
    </td>
</tr></table>

<div id=dlgMenu style='display:none;' title='메뉴관리'>
<table align=center>
   <tr><td><select id=selMenu1 size=10></select></td>
       <td>
       <table class=bound4>
       	<tr>
       		<td id=a>번호&nbsp;</td><td><input type=number id=code> 번</td>
       	</tr>
       	<tr>
            <td id=a>메뉴명&nbsp;</td><td><input type=text id=name> ☆</td>
        </tr>
        <tr>
            <td id=a>가격&nbsp;</td><td><input type=number id=price min=500 step=500> 원</td>
        </tr>
        <tr>
            <td colspan=2 align=center> 
                <br>
                <button id=btnQ>?</button>&nbsp;
                <button id=btnPlus>완료</button>&nbsp;
                <button id=btnD>취소</button>
            </td>
         </tr>
         </table>
        </td>
    </tr>
</table></div>

<div id=dlgSum style='display:none;' title='Summary'>
<table>
<tr><td>
	<table class=bound5>
	<caption>메뉴별 매출금액</caption>
   		<tr><td><select id=selSum size=20></select></td>
   	</table>
       <td>
       	<table class=bound5>
       	<caption>고객별 매출금액</caption>
       		<tr><td><select id=selSum2 size=20></select></td></tr>
        </table>
       </td>
</td></tr>
</table></div>

<div id=dlgQ style='display:none;' title='FAQ'>
<table>
<tr><td>
	<pre>
	1. 메뉴를 <font size="6" color="#008299">'등록'</font>하시려면, <font size=5>메뉴명과 가격을 입력하세요.</font>
	2. 메뉴를 <font size="6" color="#008299">'삭제'</font>하시려면, <font size=5>번호만 입력하세요.</font>
	3. 메뉴를 <font size="6" color="#008299">'수정'</font>하시려면, <font size=5>번호 & 메뉴명 & 가격을 모두 입력하세요.</font>
	</pre>
</td></tr>
</table></div>
</body>

<script src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script>
let total;
let operation;
let dlg;
$(document)
.ready(function() {
	operation='';
	dlg='';
  	loadMenu();
  	selectSale();
  	total=0;
  	return false;
})

// 메뉴관리 dialog
.on('click','#selMenu1', function() {
	str=$('#selMenu1 option:selected').text();
	ar=str.split(' ');
	arA=ar[0].substring(ar[0].lastIndexOf('\u00a0'),ar[0].length);
	arB=ar[1].substring(0,ar[1].search('\u00a0'));
 	$('#code').val(parseInt(arA));
 	$('#name').val(arB);
 	$('#price').val(ar[2]);
})
.on('click','#btnMenu', function() {
	selectMenu();
})
.on('click','#btnPlus', function() {  // dialog 완료 버튼
	if($('#name').val()!='' && $('price').val()!='') {
		if($('#code').val()!='') {
			operation='menu_update';
		} else {
			operation='menu_insert';
		}
	} else {
			operation='menu_delete';
	}
	operateMenu();
	return false;
})
.on('click','#btnD', function() { // dialog 취소(비우기) 버튼
	$('#name,#price,#code').val('');
})
.on('click','#btnQ', function() {
	$('#dlgQ').dialog({
	    width:720,height:300
	});
})

// 메뉴목록
.on('click','#btnReset', function() {
	$('#menu_name,#menu_price,#qty').val('');
})
.on('click','#selMenu', function() {
	str=$('#selMenu option:selected').text();
	stra=str.substring(0,str.search('\u00a0'));
	ar=str.split(' ');
 	$('#menu_name').val(stra);
 	$('#menu_price').val(ar[1]);
 	$('#qty').val(1);
})
.on('change','#qty', function() {
    $('#menu_price').val(ar[1]*$('#qty').val());
})

// 주문목록
.on('click','#btnAdd', function() {
	str=$('#selMenu option:selected').text();
	ar=str.split(' ');
	order='<option>'+ar[0]+' x'+$('#qty').val()
			+' '+$('#menu_price').val()+'원</option>';
	$('#selOrder').append(order);
	total+=parseInt($('#menu_price').val());
	$('#total').val(total);
	$('#menu_name,#menu_price,#qty').val('');
})
.on('click','#btnCancel', function() {
	total=0;
	$('#total,#mobile').val('');
	$('#selOrder option').remove();
})

// 판매내역
.on('click','#btnDone', function() {
 	$('#selOrder option').each(function() {
 		str=$(this).text().replace('x','');
 		stra=str.substring(0,str.search('\u00a0'));
 		ar=str.split(' ');
 		ar2=parseInt(ar[2]);
 		
 		$('#menu_name').val(stra);
 		$('#qty').val(ar[1]);
 		$('#menu_price').val(ar2);
 		
 		operation='sale_insert';
 		if($('#mobile').val()=='') {
			$('#mobile').val('-');
		} 
 		operateSale();
	});
  	selectSale();

	$('#mobile,#total').val('');
	$('#selOrder option').remove();
	total=0;
})

// summary
.on('click','#btnSum', function() {
	$('#dlgSum').dialog({
		modal:true,
	    width:640,height:500,
	    open:function(){
	    	$.get('sum_menu',{},function(txt){
	    		if(txt=='') return false;
	    		let rec=txt.split(';');
	    		for(i=0;i<rec.length;i++) {
	    			let field=rec[i].split(',');
	    			str=field[0].replace(/['!']/g,'\u00a0');
	    			let html='<option>'+str+' '+'x'+field[1]+' '+field[2]+'</option>';
	    			$('#selSum').append(html);
	    		}
	    	},'text');
	    	$.get('sum_mobile',{},function(txt){
	    		if(txt=='') return false;
	    		let rec=txt.split(';');
	    		for(i=0;i<rec.length;i++) {
	    			let field=rec[i].split(',');
	    			str=field[0].replace(/['!']/g,'\u00a0');
	    			let html='<option>'+str+' '+'x'+field[1]+' '+field[2]+'</option>';
	    			$('#selSum2').append(html);
	    		}
	    	},'text');
	    },
	    close:function() {
	    	$('#selSum').empty();
 	    	$('#selSum2').empty();
	    }
	});
})

// 메뉴목록 관련 함수
function selectMenu() {
	$('#dlgMenu').dialog({
		modal:true,
	    width:650,height:350,
	    open:function(){
	    	loadMenu_dlg();
	    },
	    close:function(){
	        $('#selMenu').empty();
	        loadMenu();
	        $('#selMenu1').empty();
	    }
	});
}

function loadMenu() {
	$.get('menu_select',{},function(txt){
 		if(txt=='') return false;
		let rec=txt.split(';');
		for(i=0;i<rec.length;i++) {
			let field=rec[i].split(',');
			str=field[1].replace(/['!']/g,'\u00a0');
			let html='<option>'+str+' '+field[2]+'</option>';
			$('#selMenu').append(html);	
		}
 	},'text');
}
function loadMenu_dlg() {
	$('#selMenu1').empty();
	$.get('menu_select',{},function(txt){
 		if(txt=='') return false;
		let rec=txt.split(';');
		for(i=0;i<rec.length;i++) {
			let field=rec[i].split(',');
			str1=field[0].replace(/['!']/g,'\u00a0');
			str2=field[1].replace(/['!']/g,'\u00a0');
			let html='<option>'+str1+' '+str2+' '+field[2]+'</option>';
			$('#selMenu1').append(html);
		}
 	},'text');
}
	
function operateMenu() {
	$.get(operation,{code:$('#code').val(),name:$('#name').val(),price:$('#price').val()},
		function(){
			$('#code,#name,#price').val('');
			loadMenu_dlg();
	},'text');
}
// 판매 관련 함수
function selectSale() {
	$('#selSales option').remove();
	$.get('sale_select',{},function(txt){
 		if(txt=='') return false;
		let rec=txt.split(';');
		for(i=0;i<rec.length;i++) {
			let field=rec[i].split(',');
 			str1=field[0].replace(/['!']/g,'\u00a0');
 			str2=field[1].replace(/['!']/g,'\u00a0');
			let html='<option>'+str1+' '+str2+' '+'x'+field[2]+' '
						+field[3]+'원'+' '+field[4]+'</option>';
			$('#selSales').append(html);
		}
 	},'text');
}
function operateSale() {
	$.get(operation,{mobile:$('#mobile').val(),menu_name:$('#menu_name').val(),
		qty:$('#qty').val(),menu_price:$('#menu_price').val()},
		function(){},'text');
}
</script>
</html>