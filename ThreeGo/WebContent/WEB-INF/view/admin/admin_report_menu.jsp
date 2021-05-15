<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a{
text-decoration: none;
color : black;
}
</style>
</head>
<body>
<h1>신고하기</h1>
<br>
	<h1><a href="<%=request.getContextPath()%>/adminreportctrl?type=grade">주차장 평가게시판</a></h1>
	<h1><a href="<%=request.getContextPath()%>/adminreportctrl?type=share">주차장 쉐어링게시판 </a></h1>
	<h1><a href="<%=request.getContextPath()%>/adminreportctrl?type=drive">드라이브코스 추천게시판 </a></h1>
	<h1><a href="<%=request.getContextPath()%>/adminreportctrl?type=free">자유게시판</a></h1>
	<h1><a href="<%=request.getContextPath()%>/adminreportctrl?type=pride">자랑게시판</a></h1>
</body>
</html>