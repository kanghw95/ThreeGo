<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안녕하세요</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src = "<%=request.getContextPath() %>/js/httpRequest.js"></script>
<script>
	function helloToServer(){   // 입력버튼 클릭시 호출되어서. 폼에 입력한 값을 hello.jsp 에 전송
		var params = "a2="+encodeURIComponent(document.f.a1.value);
		sendRequest("POST", "hello.jsp", params, helloFromServer)
	}
	
	function helloFromServer() {  // 웹서버에서 응답결과가 상태 4가 되면 hello.jsp가 생성한 텍스트를 가져와서 출력함.
		 //응답결과 상태에는 0~4까지가 있음
		 console.log(httpRequest.readyState);
		 if(httpRequest.readyState  == 4) {
			 if(httpRequest.status == 200) { // 서버로부터 받은 HTTP 응답 상태 코드
				alert("서버응답:" + httpRequest.responseText);   // 서버의 응답을 String 형식으로 나타냄.
			 }			 
		 }
	}
</script>
</head>
<body>
	<form name="f">
		<input type="text" name="a1">
		<input type="button" value="입력" onclick="helloToServer();">
	</form>
	<div>
	
	</div>
</body>
</html>