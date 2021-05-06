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
		<table border="1">
			<tr>
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
				<td><strong>내 계정 상태</strong></td>
			</tr>
			<c:forEach items="${list}" var="i">
				<tr>
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
</body>
</html>