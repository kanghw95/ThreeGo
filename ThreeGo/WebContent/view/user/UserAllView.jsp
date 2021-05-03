<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저조회</title>
</head>
<body>
	<h2>유저 조회 페이지입니다.</h2>
	<c:if test="${ empty list }">
		<p>조회된 회원이 없습니다.</p>
	</c:if>
	<c:if test="${not empty list }">
		<table border="1">
			<tr>
				<td><strong>회원 번호</strong></td>
				<td><strong>회원 아이디</strong></td>
				<td><strong>회원 패스워드 </strong></td>
				<td><strong>회원 이름</strong></td>
				<td><strong>닉네임</strong></td>
				<td><strong>주소 </strong></td>
				<td><strong>마지막 로그인 시간</strong></td>
				<td><strong>전화번호</strong></td>
				<td><strong>이메일</strong></td>
				<td><strong>성별</strong></td>
				<td><strong>생년월일</strong></td>
				<td><strong>회원자격</strong></td>
			</tr>
			<c:forEach items="${list}" var="i">
				<tr>
					<td>${i.user_no }</td>
					<td>${i.user_id }</td>
					<td>${i.user_pwd }</td>
					<td>${i.user_name }</td>
					<td>${i.nickname }</td>
					<td>${i.address }</td>
					<td>${i.last_login }</td>
					<td>${i.phone }</td>
					<td>${i.email }</td>
					<td>${i.gender }</td>
					<td>${i.birth }</td>
					<td>${i.user_authority }</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		total records: ${mlist.size()}
	</c:if>
</body>
</html>