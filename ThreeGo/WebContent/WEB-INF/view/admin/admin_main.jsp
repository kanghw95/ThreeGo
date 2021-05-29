<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
a {
   text-decoration: none;
   color: black;
   
}



.button1 {
	/* margin : 0 auto; */
	margin-left: 65;
	margin-bottom: 20;
	display: block; text-align;
	font-weight: bold;
	height: 40px;
	font-size: 20px;
	padding: 2em 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
	color: #black;
	background: none;
	border: none;
}

.button1 {
	letter-spacing: 0;
	-webkit-transition: all .28s ease-in-out;
	transition: all .28s ease-in-out;
}

.button1:hover, .button1:focus, .button1:active {
	letter-spacing: 6px;
}

.button1:after, .button1:before {
	border: 1px solid rgba(255, 255, 255, 0);
	bottom: 0;
	content: " ";
	display: block;
	margin: 0 auto;
	position: relative;
	-webkit-transition: all .28s ease-in-out;
	transition: all .28s ease-in-out;
	width: 0;
}

.button1:hover:after, .button1:hover:before {
	border-color: #fff;
	-webkit-transition: width 350ms ease-in-out;
	transition: width 350ms ease-in-out;
	width: 70%;
}

.button1:hover:before {
	bottom: auto;
	top: 0;
}
</style>

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<body>

	<form action="<%=request.getContextPath()%>/adminctrl" method="get">
		<h1>
			<button type="submit" class="button1" style="padding-top: 80">회원관리</button>
		</h1>
	</form>
	<form action="<%=request.getContextPath()%>/admin/adminboard" method="get">
		<h1>
			<button type="submit" class="button1">게시판관리</button>
		</h1>
	</form>
	<form action="<%=request.getContextPath()%>/adminnotify" method="get">
		<h1>
			<button type="submit" class="button1">공지사항관리</button>
		</h1>
	</form>
	<form action="<%=request.getContextPath()%>/userqna" method="get">
		<h1>
			<button type="submit" class="button1">이용자문의사항관리</button>
		</h1>
	</form>
	

</body>
</html>