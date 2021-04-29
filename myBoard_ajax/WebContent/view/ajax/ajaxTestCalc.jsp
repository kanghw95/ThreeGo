<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#btnSend").click(function(){
			var num1 = $("#num1").val();
			var num2 = $("#num2").val();
			var oper = $("#oper").val();  // add / sub / mul / div
			var url = "<%=ctxPath%>/cal.do";
			var query ="n1=" + num1  +   "&n2=" +  num2;
			query += "&oper="  +  oper;
			// n1=33&n2=2&oper=sub
			
			$.ajax( { 
				type : "POST",
				url : "<%=ctxPath%>/cal.do",
				data : query ,
				success : function( d1 ) {
					console.log(d1);
					$("#result").css("color","red");
					$("#result").html(d1);
					//$("#result").html(d1.result);
				},
				error : function(e){
					alert(e.responseText);
				}
			} );
			
		});
	});	
</script>
</head>
<body>
	<input type="text" id="num1">
	<select id="oper">
		<option value="add">더하기</option>
		<option value="sub">빼기</option>
		<option value="mul">곱하기</option>
		<option value="div">나누기</option>
	</select>
	<input type="text" id="num2">
	<input type="button" value="=" id="btnSend">
	<br> <hr>
	<div  id="result"></div>
</body>
</html>