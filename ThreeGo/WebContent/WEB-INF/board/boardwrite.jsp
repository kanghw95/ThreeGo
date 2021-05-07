<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>


</script>

</head>
<body>


	<h1>글쓰기</h1>
	<form action="<%=request.getContextPath()%>/boardWrite.do"
		method="post" enctype="multipart/form-data">

		<input type="text" name="bdno" value="${param.bd_content_no }">




		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="bd_subject"></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input type="text" name="bd_writer" value="로그인 " readonly ></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea class="form-control" placeholder="글 내용"
						name="bd_content" maxlength="2048" style="height: 350px;"></textarea></td>
			</tr>

			<tr>
				<td>파일첨부</td>
				<td><input type="file" name=file multiple="multiple" ></td>
			</tr>
			
			<tr>
				<td colspan="2"><input type="submit" value="글등록"> 
				<input
					type="reset" value="다시작성"> <input type="button" value="글목록"
					onclick="window.location='<%=request.getContextPath()%>/boardlist.do';">
				</td>
			</tr>
		</table>

	</form>
</body>
</html>