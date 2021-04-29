<%@page import="java.sql.Connection"%>
<%@page import="common.jdbc.JDBCConectionPool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="<%=request.getContextPath() %>/boardlist.do" >게시판 리스트</a>
	<a href="<%=request.getContextPath() %>/board/boardwrite.jsp" >게시판 글쓰기</a> 
</body>
</html>