<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="threego.model.vo.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>

<form method="get" action="<%=request.getContextPath()%>/boardlike">
<c:if test="${empty like.likechech }">
	<input type="submit" value="따봉" >
</c:if>
<c:if test="${not empty like.likechech }">
	<input type="submit" value="따봉취소" >
</c:if>
	<input type="hidden" value="${like.user_no }" name="user_no">
	<input type="hidden" value="${like.bd_content_no }" name="bd_no">
	<input type="hidden" value="${like.bd_content_no }" name="likech">
</form>
</body>
</html>