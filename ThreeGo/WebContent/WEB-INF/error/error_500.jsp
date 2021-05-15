<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
    <%
    	response.setStatus(HttpServletResponse.SC_OK);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500에러 페이지</title>
</head>
<body>
요청하신 페이지는 존재하지 않습니다.
<a href="<%=request.getContextPath()%>/index.jsp">홈으로 이동</a>
</body>
</html>