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
   margin-top: 10;
   margin-left: 50px;

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

</style>

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<body style="font-family:'서울남산 장체 L', sans-serif;">
<form action="<%=request.getContextPath()%>/boardlist" method="get">
		<input type="hidden" id="bd_category_1" name="bd_category_1" value="bd_category_1">
		<h1>
			<button type="submit" class="button1">주차장 평가게시판</button>
		</h1>
	</form>
	<form action="<%=request.getContextPath()%>/boardlist" method="get">
		<input type="hidden" id="bd_category_2" name="bd_category_1" value="bd_category_2">
		<h1>
			<button type="submit" class="button1">주차장 쉐어링게시판</button>
		</h1>
	</form>
	<form action="<%=request.getContextPath()%>/boardlist" method="get">
		<input type="hidden" id="bd_category_3" name="bd_category_1" value="bd_category_3">
		<h1>
			<button type="submit" class="button1">드라이브코스 추천게시판</button>
		</h1>
	</form>
	<form action="<%=request.getContextPath()%>/boardlist" method="get">
		<input type="hidden" id="bd_category_4" name="bd_category_1" value="bd_category_4">
		<h1>
			<button type="submit" class="button1">자유 게시판</button>
		</h1>
	</form>
	<form action="<%=request.getContextPath()%>/boardlist" method="get">
		<input type="hidden" id="bd_category_5" name="bd_category_1" value="bd_category_5">
		<h1>
			<button type="submit" class="button1">자랑 게시판</button>
		</h1>
	</form>
</body>
</html>