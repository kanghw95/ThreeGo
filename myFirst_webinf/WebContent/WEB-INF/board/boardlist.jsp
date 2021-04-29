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
		<input type="search" name="search">
		<button type="submit">검색</button>
	</form>
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
				<th>조회수</th>
			</tr>
		<c:forEach items="${boardList }" var="v">
			<tr>
				<td><a href="<%=request.getContextPath() %>/boardRead.do?bno=${v.bno }">${v.bno }</a></td>
				<td>${v.bsubject }</td>
				<td>${v.bwriter }</td>
				<td>${v.bdate }</td>
				<td>${v.bcnt }</td>
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

	<c:if test="${search != null }">
	<input type="button" value="전체글목록" onclick="window.location='<%=request.getContextPath()%>/boardlist.do'">
	</c:if>
</body>
</html>