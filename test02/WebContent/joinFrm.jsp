<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>회원가입</title>

<style>
label {
	width: 100px;
	display: inline-block;
}
</style>

</head>

<body>

	<h1>회원가입</h1>

	<form action="<%=request.getContextPath() %>/join" method="post">

		<label for="memberId">아이디</label><input type="text" name="memberId" id="memberId" required><br> 
		<label for="memberPw">비밀번호</label><input type="password" name="memberPw" id="memberPw" required><br>
        <label for="memberName">이름 </label><input type="text" name="memberName" id="memberName" required><br> 
        <input type="submit" value="전송">

	</form>

</body>

</html>