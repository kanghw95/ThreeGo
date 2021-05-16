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
	<h2>간단리뷰</h2>
	<c:if test="${ empty list }">
		<p>글을 작성한 회원이 없습니다.</p>
	</c:if>
	<c:if test="${not empty list }">
		<table border="1">
			<tr>
				<td><strong>작성자</strong></td>
				<td><strong>점수</strong></td>
				<td><strong>내용</strong></td>
			
			</tr>
			<c:forEach items="${list}" var="i">
				<tr>
					<td>${i.nickname }</td>
					<td>${i.grade }</td>
					<td>${i.s_contents }</td>
					<td><input type="button" value="삭제"></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>