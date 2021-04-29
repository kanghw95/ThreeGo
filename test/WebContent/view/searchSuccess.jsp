<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원정보</h1>
<br>
	<table border="1">
		<tr>
			<td>회원번호</td>
			<td>회원아이디</td>
			<td>회원이름</td>
			<td>회원나이</td>
		</tr>
		<tr>
			<td>${result.userNo } </td>
			<td>${result.userId } </td>
			<td>${result.userName }</td>
			<td>${result.userAge }</td>
		</tr>
	</table>
</body>
</html>