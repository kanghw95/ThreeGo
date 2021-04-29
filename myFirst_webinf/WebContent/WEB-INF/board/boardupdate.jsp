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
	<h1>글수정</h1>
	<form action="<%=request.getContextPath()%>/boardupdate.do" method="post">

		<input type="hidden" name="bno" value="${param.bno }"> 
		<input type="hidden" name="bref" value="${param.bref }">  
		<input type="hidden" name="bre_step" value="${param.bre_step }"> 
		<input type="hidden" name="bre_level" value="${param.bre_level }">

		<table border="1">
			<tr>
				<td>작성자</td>
				<td>${param.bwriter }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${param.bsubject }</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="bcontent" id="bcontent"></td>
			</tr>

			<tr>
				<td colspan="2">
				<input type="submit" value="수정하기"> 
				<input type="button" value="글목록" onclick="window.location='<%=request.getContextPath()%>/boardlist.do';">
				</td>
			</tr>
		</table>

	</form>
</body>
</html>