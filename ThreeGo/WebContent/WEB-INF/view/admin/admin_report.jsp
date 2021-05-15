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
<h2>신고하기</h2>
<c:if test="${type=='grade' }">
<h2>주차장 평가게시판</h2>
</c:if>
<c:if test="${type=='share' }">
<h2>주차장 쉐어링게시판</h2>
</c:if>
<c:if test="${type=='drive' }">
<h2>드라이브코스 추천게시판</h2>
</c:if>
<c:if test="${type=='free' }">
<h2>자유게시판</h2>
</c:if>
<c:if test="${type=='free' }">
<h2>자랑게시판</h2>
</c:if>
	<c:if test="${ empty list }">
		<p>조회된 신고가 없습니다.</p>
	</c:if>
	<c:if test="${not empty list }">

		<table border ="1">
			<tr>
				<th>No</th>
				<th>신고자</th>
				<th>글번호</th>
				<th>신고당한사람</th>
				<th>신고날짜</th>
				<th>내용</th>
			</tr>
		 	<c:forEach items="${list }" var="i">
			
			<tr>
				<td>${i.bd_report_no }</td>
				<td>${i.reporter }</td>
				<td>${i.bd_content_no }</td>
				<td>${i.reported }</td>
				<td>${i.report_date}</td>
			<form  method="post" action="<%=request.getContextPath() %>/adminreport">
				<td>
					<input type="submit" value="신고내용">
					<input type="hidden" value="${i.bd_report_no }" name="bd_report_no">
					<input type="hidden" value="${i.bd_content_no }" name="bd_content_no">
					<input type="hidden" value="${i.reported }" name="reported">
					<input type="hidden" value="${i.bd_content }" name="bd_content">
					<input type="hidden" value="${i.reporter }" name="reporter">
					<input type="hidden" value="${i.report_content }" name="report_content">
				</td>
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
	
	<input type="button" value="메인화면" onclick="location.href='<%=request.getContextPath()%>/admin/adminmain';">
	<c:if test="${not empty search}">
		<input type="button" value="전체글목록" onclick="location.href='<%=request.getContextPath()%>/adminctrl';">
	</c:if>
</body>
</html>