<%@page import="first.member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Member> mlist = (ArrayList<Member>) request.getAttribute("mlist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC2 방식의 데이터베이스 연동</title>
<link href="../../css/style.css" ref="stylesheet">
</head>
<body>
	<h2>MVC2 방식의 데이터베이스 연동</h2>
	<h3>회원 정보 조회</h3>
	<table border="1">
		<tr>
			<td><strong>ID</strong></td>
			<td><strong> PASSWD </strong></td>
			<td><strong>NAME</strong></td>
			<td><strong>E_MAIL</strong></td>
			<td><strong> GRADE </strong></td>
			<td><strong>GENDER</strong></td>
			<td><strong>REGDATE</strong></td>
		</tr>
<%
	for(int i=0; i<mlist.size(); i++) {
		Member m = mlist.get(i);
%>
		<tr>
			<td><%= m.getId() %></td>
			<td><%= m.getPasswd() %></td>
			<td><%= m.getName() %></td>
			<td><%= m.getEmail() %></td>
			<td><%= m.getGrade() %></td>
			<td><%= String.valueOf(m.getGender()) %></td>
			<td><%= m.getRegdate() %></td>
		</tr>
<%
}
%>

	</table>
<br>
total records: <%= mlist.size() %>

</body>
</html>