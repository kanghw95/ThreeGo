<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>신고하기</h1>
<form action="<%=request.getContextPath()%>/board/boardwrite.jsp" method="post">
	<table>
			<tr>
				<td>닉네임1을 신고</td> 
				<td>${boardread.bd_writer }</td>
			</tr>	
			<tr>
				<td>신고이유</td> 
				<td>${boardreport.report_content }</td>
			</tr>	
	<input type="submit" value="신고 완료">
	<td colspan="2">
			<input type="button" value="메인화면" onclick="window.location='<%=request.getContextPath()%>/boardlist';">
			<input type="button" value="마이페이지" onclick="window.location='<%=request.getContextPath()%>/boardlist';">
	
	</td>
	</table>
</form>
</body>
</html>