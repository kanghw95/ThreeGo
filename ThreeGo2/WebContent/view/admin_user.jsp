<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원관리</h1>
	<input type="text" value="회원검색">
	<table>
	<a><%=request.getParameter("list") %></a>
<!-- 	<c:forEach items="list" var="i">
	<tr>
		<td>${i.yh_no }</td>
		<td><input type="button" value="일시정지" id="stop"></td>
	</tr>
	</c:forEach>
 -->
	</table>
</body>
</html>
