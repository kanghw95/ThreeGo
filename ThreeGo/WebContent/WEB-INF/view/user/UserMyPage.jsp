<%@page import="threego.model.vo.User"%>
<%@page import="threego.model.service.ParkingService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
</head>
<body>
<h2>마이 페이지입니다.</h2>
<%User user = (User) session.getAttribute("user"); %>

<%
		Object result1 = request.getAttribute("result");
		if (result1 == null) {
%>
	<div>
	<form id="frm">
	<input type="hidden" id="id" name="id" value="<%=user.getUser_id()%>">
	<input type="password" id="passwd" name="passwd" placeholder="비밀번호를 입력하세요">
	<input type="button" id="btnok" value="확인">
	</form>
	<hr>
	<input type="button" value="메인페이지"  onclick="location.href ='<%=request.getContextPath() %>/main'">
	
	</div>
<%
		} else {
%>
		<div>
		<table border="1">
			<tr><td><strong>회원 아이디</strong></td><td><%=user.getUser_id()%></td></tr>
			<tr><td><strong>회원 패스워드 </strong></td><td><%=user.getUser_pwd()%></td></tr>
			<tr><td><strong>회원 이름</strong></td><td><%=user.getUser_name()%></td></tr>
			<tr><td><strong>닉네임</strong></td><td><%=user.getNickname()%></td></tr>
			<tr><td><strong>주소 </strong></td><td><%=user.getAddress()%></td></tr>
			<tr><td><strong>마지막 로그인 시간</strong></td><td><%=user.getLast_login()%></td></tr>
			<tr><td><strong>전화번호</strong></td><td><%=user.getPhone()%></td></tr>
			<tr><td><strong>이메일</strong></td><td><%=user.getEmail()%></td></tr>
			<tr><td><strong>성별</strong></td><td><%=user.getGender()%></td></tr>
			<tr><td><strong>생년월일</strong></td><td><%=user.getBirth()%></td></tr>
		</table>
		<hr>
		<input type="button" value="수정" onclick="location.href ='<%=request.getContextPath() %>/main/modify'">
		<input type="button" value="회원탈퇴" onclick="location.href ='<%=request.getContextPath() %>/main/drawal'">
		<input type="button" value="메인페이지"  onclick="location.href ='<%=request.getContextPath() %>/main'">
		</div>
<%
		}
%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$("#btnok").click(function() {
		var frm = document.getElementById("frm");
		if ($("#passwd").val().length == 0) {
			alert("비밀번호를 입력해주세요")
			return;
		}
		frm.action = "<%=request.getContextPath() %>/usermypage";
		frm.method = "post";
		frm.submit();
	});
</script>
</body>
</html>