<%@page import="threego.model.vo.User"%>
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
<%	User user = (User) session.getAttribute("user"); %>
<form action="<%=request.getContextPath()%>/boardreportsend" method="post">
	
		<input type="text" name="user_no" value="${boardread.user_no}">
		<input type="text" name="user_no2" value="<%=user.getUser_no()%>">
		<input type="text" name="bd_content_no" value="${boardread.bd_content_no}">
	<table>
			<tr>
				<td>신고할 닉네임 : </td> 
				<td><input type="text" id="report_nick" name="report_nick" readonly="readonly" size="38" value="${boardread.bd_writer}"></td>
			</tr>
			<tr>
				<td>신고이유 :</td> 
				<td><textarea id="report_content" name="report_content" rows="10" cols="40" placeholder="신고사유를 작성해주세요"></textarea></td>
			</tr>
			<tr>
			<td><input type="submit" value="신고하기"></td>
			</tr>
	</table>
</form>
</body>
</html>