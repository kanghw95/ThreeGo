<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<form action="<%=request.getContextPath() %>/boardlist.do" method="get">
		<input type="search" name="search" value="${search}">
		<button type="submit">검색</button>
	</form>
	<c:if test="${not empty search}">
		<h1>${search}에 대한 검색 결과입니다.</h1>
	</c:if>
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
			</tr>
		<c:forEach items="${boardList }" var="v">
			<tr>
				<td><a href="<%=request.getContextPath() %>/boardRead.do?bd_content_no=${v.bd_content_no }">${v.bd_content_no }</a></td>
				<td>${v.bd_subject }</td>
				<td>${v.bd_writer }</td>
				<td>${v.bd_date }</td>
				<td>${v.bd_likecnt}</td>
			</tr>			
		</c:forEach>
		</table>
	</c:if>
	
	<c:if test="${startPage != 1 }">
		<a href="<%=request.getContextPath() %>/boardlist.do?pageNum=${startPage-1}&search=${search}">이전</a> 
	</c:if>
	<c:forEach begin="${startPage }" end="${endPage }" var="s" step="1">
		<a href="<%=request.getContextPath() %>/boardlist.do?pageNum=${s }&search=${search}">${s }</a> 
	</c:forEach>
	<c:if test="${endPage < pageCnt }">
		<a href="<%=request.getContextPath() %>/boardlist.do?pageNum=${endPage+1}&search=${search}">다음</a>
	</c:if>
	
	
	<br>
	<a href="${pageContext.request.contextPath }/board/boardwrite.jsp">글쓰기</a>
	<br>
	<c:if test="${not empty search}">
		<input type="button" value="전체글목록" onclick="window.location='<%=request.getContextPath()%>/boardlist.do';">
	</c:if>
</body>
</html>