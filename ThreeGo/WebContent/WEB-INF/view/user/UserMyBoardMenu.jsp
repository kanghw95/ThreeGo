<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/usermyboard" method="post">
		<input type="hidden" id="bd_category_1" name="bd_category_1" value="bd_category_1">
		<h1>
			<button type="submit">주차장 평가게시판</button>
		</h1>
	</form>
	<form action="<%=request.getContextPath()%>/usermyboard" method="post">
		<input type="hidden" id="bd_category_2" name="bd_category_1" value="bd_category_2">
		<h1>
			<button type="submit">주차장 쉐어링게시판</button>
		</h1>
	</form>
	<form action="<%=request.getContextPath()%>/usermyboard" method="post">
		<input type="hidden" id="bd_category_3" name="bd_category_1" value="bd_category_3">
		<h1>
			<button type="submit">드라이브코스 추천게시판</button>
		</h1>
	</form>
	<form action="<%=request.getContextPath()%>/usermyboard" method="post">
		<input type="hidden" id="bd_category_4" name="bd_category_1" value="bd_category_4">
		<h1>
			<button type="submit">자유 게시판</button>
		</h1>
	</form>
	<form action="<%=request.getContextPath()%>/usermyboard" method="post">
		<input type="hidden" id="bd_category_5" name="bd_category_1" value="bd_category_5">
		<h1>
			<button type="submit">자랑 게시판</button>
		</h1>
	</form>
</body>
</html>