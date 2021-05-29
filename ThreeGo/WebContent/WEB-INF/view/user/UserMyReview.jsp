<%@page import="threego.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 글 조회</title>
</head>
<body style="font-family:'서울남산 장체 L', sans-serif;">
<%User user = (User) session.getAttribute("user"); %>

	<c:if test="${empty boardList}">
		게시글이 없습니다.
	</c:if>
	<c:if test="${not empty boardList}">
		<table border="1">
			<tr>
				<th>No</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>좋아요 수</th>
			</tr>
		<c:forEach items="${boardList }" var="v">
			<tr>
				<td><a href="<%=request.getContextPath() %>/boardRead?bd_content_no=${v.bd_content_no }">${v.bd_content_no }</a></td>
				<td>${v.bd_subject }</td>
				<td>${v.bd_writer }</td>
				<td>${v.bd_date }</td>
				<td>${v.bd_likecnt}</td>
			</tr>		
		</c:forEach>
		</table>
	</c:if>
</body>
</html>