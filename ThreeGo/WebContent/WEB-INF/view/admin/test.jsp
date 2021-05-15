<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/adminctrl" method="get">
		<input type="text" value="번호" name="no"><br>
		<input type="text" value="이름" name="name"><br>
		<input type="text" value="아이디" name="id"><br>
		<input type="text" value="비밀번호" name="passwd"><br>
		<input type="submit">
	</form>
</body>
</html>