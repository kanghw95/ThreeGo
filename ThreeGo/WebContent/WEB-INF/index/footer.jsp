<link rel="stylesheet" type="text/css" href="/ThreeGo/css/main.css" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div class="footer">
<br>
<input type="button" id="btnNotify" value="공지사항" onclick="location.href='<%=request.getContextPath()%>/adminnotify'">
<input type="button" id="btnQna" value="문의사항" onclick="location.href='<%=request.getContextPath()%>/userqna'">
</div>
</body>
</html>