<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원 정보 조회</h1>
<br><br>
<form action="<%=request.getContextPath()%>/searchUser" method="post">
<input type="text" name="userNo" id="userNo"><input type="submit" >
</form>

</body>
</html>