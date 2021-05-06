<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="login.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<hr>
	깃허브 확인용
	<input type="button" value="관리자페이지" onclick="location.href ='<%=request.getContextPath() %>/main/adminmain'">
	<input type="button" id="btnlist" value="회원조회 " onclick="location.href='<%=request.getContextPath() %>/selectalluser'"> 
	<hr>
	<form action="<%=request.getContextPath() %>/p_searchuser.do" method="get">
	<input type="text" id="searchuser" name="searchuser">
	<input type="submit" id="btnsearch" value="회원검색">
	</form>
	<hr>
</body>
</html>