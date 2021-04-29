<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
<% request.getParameter("msg"); %><br>
<input type="button" id="btnlist" value="회원조회 " onclick="location.href='p_selectall.do'" >
</body>
</html>