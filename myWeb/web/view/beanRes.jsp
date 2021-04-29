<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//String msg = request.getParameter("message");

first.bean.model.vo.SimpleBeanData vo = new first.bean.model.vo.SimpleBeanData();
%>
<jsp:useBean id="msg" class="first.bean.model.vo.SimpleBeanData"></jsp:useBean>
<jsp:setProperty property="message" name="msg"/>
<%
	//vo.setMessage(request.getParameter("message"));
%>

	<%= vo.getMessage() %>
	메세지 : <jsp:getProperty property="message" name="msg"/>
</body>
</html>