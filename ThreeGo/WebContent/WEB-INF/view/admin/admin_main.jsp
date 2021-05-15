<link rel="stylesheet" type="text/css" href="/ThreeGo/css/main.css" />
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
section{
height: 800px;
position: relative;
float: left;
width: 70%;
}
aside{
position: relative;
float: left;
width: 30%;
height: 800px;
clear: both;
}

</style>

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>

		<h1><a href="<%=request.getContextPath()%>/adminctrl" >회원관리</a></h1>
		<h1><a href="<%=request.getContextPath() %>/admin/adminboard">게시판관리</a></h1>
		<h1><a href="<%=request.getContextPath() %>/adminnotify">공지사항관리</a></h1>
		<h1><a href="<%=request.getContextPath() %>/userqna">이용자문의사항관리</a></h1>
		<input type="button" id="btnLogout" value="로그아웃" onclick="location.href='<%=request.getContextPath()%>/userlogout'">

</body>
</html>