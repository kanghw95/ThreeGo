<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>글읽기</h1>
<input type="submit" value="답글 쓰기"> 
<!-- 마이페이지에서 진입 : 삭제 버튼, 마이페이지로// 남이 쓴 게시물 보는경우 좋아요 누르기,신고 버튼  -->

	<input type="button" value="신고" onclick="window.location='<%=request.getContextPath() %>/board/boardwrite.jsp?bd_content_no=${boardread.bd_content_no}';"> <!-- 신고페이지 -->



	<form action="<%=request.getContextPath()%>/board/boardwrite.jsp" method="post">
		<input type="hidden" name="bd_content_no" value="${boardread.bd_content_no }">

		<table border="1">
			<tr>
				<td><h1>제목</h1></td>
				<td>${boardread.bd_subject }</td>
			</tr>
			<tr>
				<td>작성자</td> <!-- 작성자랑 작성날짜 colspan -->
				<td>${boardread.bd_writer }</td>
			</tr>
			<tr>
				<td>작성날짜</td>
				<td>${boardread.bd_date }</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${boardread.bd_content }</td>
			</tr>
			
		
			<tr>
				<td colspan="2">
			
				<input type="button" value="글 수정" onclick="window.location='<%=request.getContextPath() %>/board/boardwrite.jsp?bd_content_no=${boardread.bd_content_no}';"> 
				<input type="button" value="글 삭제" onclick="window.location='<%=request.getContextPath() %>/board/boarddelete.jsp?bd_content_no=${boardread.bd_content_no}';"> 
			
				
				<input type="button" value="메인화면" onclick="window.location='<%=request.getContextPath() %>/boardlist.do?search=${param.search}';"></td>
				
				
			</tr>
		</table>
	
		

	</form>
</body>
</html>