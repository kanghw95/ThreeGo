<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록</title>
</head>
<body>
<h1>주차권 쉐어링 게시판</h1>
<form action="<%=request.getContextPath() %>/boardlist.do" method="get">
		<input type="search" name="search" value="${search}">
		<button type="submit">검색</button>
	</form>
	<c:if test="${not empty search}">
		<strong>${search}</strong>에 대한 검색 결과입니다.
	</c:if>
	<c:if test="${empty Sboardlist}">
		게시글이 없습니다.
	</c:if>
	<c:if test="${not empty Sboardlist}">
		<table border="1">
				<tr>
				<th colspan="2">제목</th><!-- 제목이 제목+ 번호 어디를 colspan?? -->
				<th>작성자</th>
				<th>작성일</th>
				<th>공감</th>
				
			</tr>
		<c:forEach items="${Sboardlist}" var="v">
			<tr>
				<td><a href="<%=request.getContextPath() %>/boardRead.do?bd_content_no=${v.bd_content_no}">${v.bd_content_no}</a></td><!--맞는 주소로 바꿔야됨 -->
				<td>${v.bd_content_no}</td>
				<td>${v.bd_subject}</td>
				<td>${v.bd_writer}</td>
				<td>${v.bd_date}</td>
				<td>${v.bd_likecnt}</td> 
			</tr>
		</c:forEach>
		</table>
	</c:if>
	
	<c:if test="${startPage != 1 }">
		<a href="<%=request.getContextPath() %>/boardlist.do?pageNum=${startPage-1}&search=${search}">이전</a> 
	</c:if>
	<c:forEach begin="${startPage }" end="${endPage }" var="s" step="1">
		<a href="<%=request.getContextPath() %>/boardlist.do?pageNum=${s}&search=${search}">${s}</a> 
	</c:forEach>
	<c:if test="${endPage < pageCnt }">
		<a href="<%=request.getContextPath() %>/boardlist.do?pageNum=${endPage+1}&search=${search}">다음</a>
	</c:if>
	
	
	<!--a href="${pageContext.request.contextPath }/board/boardwrite.jsp">글쓰기</a>-->
	
	<br>
	<!-- <c:if test="${not empty search}"> 지울까말까 ?? </c:if>-->
		<input type="button" value="글쓰기" onclick="window.location='<%=request.getContextPath() %>/board/boardwrite.jsp';">
</body>
</html>