<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
$(function(){
	var pwd = prompt('비밀번호를 입력하세요');
	document.getElementById("pwd").value = pwd;
	var frm = document.getElementById("frm");
	frm.action = "<%=request.getContextPath()%>/boardckpw.do";
	frm.method = "post";
	frm.submit();
});

</script>
</head>
<body>
	<form id="frm">
		<input type="hidden" name="bno" id="bno" value="${param.bno }">
		<input type="hidden" name="pwd" id="pwd">
	</form>
</body>
</html>