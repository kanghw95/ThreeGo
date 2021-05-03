<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% String ctxPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script>

</script>
</head>
<body>
	<input type="button" id="btnlist" value="회원조회 " onclick="location.href='<%=request.getContextPath() %>/selectalluser'"> 
	<hr>
	<form action="<%=request.getContextPath() %>/p_searchuser.do" method="get">
	<input type="text" id="searchuser" name="searchuser">
	<input type="submit" id="btnsearch" value="회원검색">
	</form>
	<hr>
	<form action="<%=request.getContextPath() %>/userlogin" method="post">
		<p>ID : <input type="text" name="id" id="id"></p>
		<p>PW : <input type="password" name="passwd" id="passwd"></p>
		<input type="button" id="btnjoin" value="회원가입 " onclick="location.href ='<%=request.getContextPath() %>/main/insert'">
		<input type="submit" id="btnlogin" value="로그인 ">
	</form>
	<input type="button" value="관리자페이지" onclick="location.href ='<%=request.getContextPath() %>/main/adminmain'">
</body>
</html>