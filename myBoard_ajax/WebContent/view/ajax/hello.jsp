<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("a2");
%>
<body>
안녕하세요, <%=name %>님!
</body>
</html>