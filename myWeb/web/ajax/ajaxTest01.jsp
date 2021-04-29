<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<input type="text" id="src">
	<button id="send">보내기</button>
	<div id="result"></div>
<script >
	$("#send").on("click",function(){
		var src = $("#src").val();
	$.ajax({
		url: "<%=request.getContextPath()%>/ajaxtest"
		,type : "get"
		,data : {
			source : src
		}
		,dataType : "json"
		,success : function(d1){
			console.log(d1);
			console.log(d1.passwd);
		}
		,error : function(){
			
		}
	});
		
	});
	</script>
</body>
</html>