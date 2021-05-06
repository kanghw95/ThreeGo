<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
<input type="hidden" name ="list" value="${list }">
<h1>문의사항</h1>
<hr>
	<form action="<%=request.getContextPath() %>/userqna" method="get">
		<input type="search" name="search" value="${search}">
		<button type="submit">검색</button>
	</form>
<h2>자주묻는질문</h2>
<h2>QNA</h2>
	<c:if test="${ empty list }">
		<p>게시글이 없습니다.</p>
	</c:if>
	<c:if test="${not empty list }">
		<table border ="1">
			<tr>
				<th>No</th>
				<th>제목</th>

			</tr>
		 	<c:forEach items="${list }" var="i">
			<tr>
				<td>${i.qna_no }</td>
				<td><a href="#">${i.qna_subject }</a></td>

			</tr>
			</c:forEach>
		</table>
	</c:if>
	
	<c:if test="${startPage != 1 }">
		<a href="<%=request.getContextPath() %>/adminctrl?pageNum=${startPage-1}&search=${search}">이전</a> 
	</c:if>
	<c:forEach begin="${startPage }" end="${endPage }" var="s" step="1">
		<a href="<%=request.getContextPath() %>/adminctrl?pageNum=${s }&search=${search}">${s }</a> 
	</c:forEach>
	<c:if test="${endPage < pageCnt }">
		<a href="<%=request.getContextPath() %>/adminctrl?pageNum=${endPage+1}&search=${search}">다음</a>
	</c:if>
	
	<br>
	<input type="button" value="메인화면" onclick="location.href='<%=request.getContextPath()%>/main/adminmain';">
	<c:if test="${not empty search}">
		<input type="button" value="전체글목록" onclick="window.location='<%=request.getContextPath()%>/userqna';">
	</c:if>
	
</body>
</html>