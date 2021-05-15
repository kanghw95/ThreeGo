<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<style>
#textform{
maxlength : 2048;
height: 350px;
}

</style>
</head>
<body>
	<h1>글수정</h1>
	<form action="<%=request.getContextPath()%>/boardupdate2" method="post">
	
	<input type="hidden" name="bd_content_no" value="${bd_content_no}">
	
		<table border="1">
			<tr>
				<td><h3>제목</h3></td>
				<td><textarea name="bd_subject" id="bd_subject">${bd_subject }</textarea></td>
			</tr>
			
			<tr id="textform" >
				<td>내용</td>
				      
				<td>
		         	<input type="file" id="fileupload" name="uploads" multiple accept="image/*">
		         	<input type="reset" id ="filecancel" value=삭제 >
		         	<br>
					<textarea name="bd_content" id="bd_content">${bd_content}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="수정 완료" >
				<input type="button" value="글목록" onclick="window.location='<%=request.getContextPath()%>/boardlist';">
				</td>
			</tr>
		</table>
		</form>

</body>
</html>