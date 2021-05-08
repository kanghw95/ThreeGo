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

<h2>공지사항/이용방법</h2>
	<c:if test="${ empty list }">
		<p>게시글이 없습니다.</p>
	</c:if>
	<c:if test="${not empty list }">
	
		<table border ="1">
			<tr>
				<th>No</th>
				<th>제목</th>

			</tr>
		 	<c:forEach items="${list }" var="i" >
			<tr>
				<td>${i.faq_no-1000 }</td>
				<form method="post" action="<%=request.getContextPath()%>/adminnotifyanswer">
					<td>
						<input type="submit" class="btnc" value="${i.faq_subject }">
						<input type="hidden" value="${i.faq_no }" name="no" >
						<input type="hidden" value="${i.faq_subject }" name="sub">
						<input type="hidden" value="${i.faq_content }" name="con">
						<input type="hidden" value="${i.admin_number }" name="a_num">
					</td>i
				</form>
								
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
	<form method="post" action="<%=request.getContextPath()%>/adminqnaanswer">
		<input type="submit" value="글쓰기">
		<input type="hidden" value="5" name="a_num">			
		<input type="hidden" value="notify" name="notify">			
	</form>
	<input type="button" value="메인화면" onclick="location.href='<%=request.getContextPath()%>/admin/adminmain';">
	
	<c:if test="${not empty search}">
		<input type="button" value="전체글목록" onclick="window.location='<%=request.getContextPath()%>/userqna';">
	</c:if>
</body>
</html>