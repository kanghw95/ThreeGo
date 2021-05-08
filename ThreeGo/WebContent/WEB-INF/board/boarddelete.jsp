<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/boarddelete" method="POST"> <!-- servlet이름 변경 -->
			<table border="1">
				<input type="hidden" name="bd_content_no" value="${param.bd_content_no}" />
				<h1>비밀번호를 입력해주세요.</h1>
				<input type="password" name="pwd"/>
				<input type="submit" value="확인"/>			
			</table>
</form>
</body>
</html>