<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%
	response.setStatus(HttpServletResponse.SC_OK);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500에러페이지</title>
</head>
<body>
서비스가 원활하지 못합니다. 잠시 후 다시 이용해 주세요.
<a href="<%=request.getContextPath() %>/index.jsp">홈으로 이동</a>
</body>
</html>