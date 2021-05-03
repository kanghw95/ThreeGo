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
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<h1><a href="<%=request.getContextPath()%>/adminctrl" >회원관리</a></h1>
	<h1><a href="<%=request.getContextPath() %>/main/adminboard">게시판관리</a></h1>
	<h1><a href="#">공지사항관리</a></h1>
	<h1><a href="<%=request.getContextPath() %>/userqna">이용자문의사항관리</a></h1>
	<h1><a href="#">채팅</a></h1>

	
</body>
</html>