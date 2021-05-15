<%@page import="threego.model.vo.Review"%>
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
<%Review review = (Review) session.getAttribute("reviewlist"); %>
	<h2>간단리뷰</h2>
	<c:if test="${ empty list }">
		<p>조회된 회원이 없습니다.</p>
	</c:if>
	<c:if test="${not empty list }">
		<table border="1">
			<tr>
				<td><strong>리뷰 번호</strong></td>
				<td><strong>주차장 코드</strong></td>
				<td><strong>유저 번호 </strong></td>
				<td><strong>평가</strong></td>
				<td><strong>내용</strong></td>
			
			</tr>
			<c:forEach items="${list}" var="i">
				<tr>
					<td>${i.simple_rv_no }</td>
					<td>${i.parking_code }</td>
					<td>${i.user_no }</td>
					<td>${i.grade }</td>
					<td>${i.s_contents }</td>
				
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>