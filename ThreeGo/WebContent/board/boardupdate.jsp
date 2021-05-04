<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>글수정</h1>
	<form action="<%=request.getContextPath() %>/boardupdate.do" method="post" enctype="multipart/form-data">
put type="text" name="bre_level" value="${vo.bre_level}"  />
	
		<table border="1">
			
			<tr>
				<td>제목</td>
				<td><input type="text" name="bd_subject" id="bd_subject" value="${vo.bd_subject}"></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input type="text" name="bd_writer" value="로그인 " readonly ></td>
			</tr>
				<tr>
				<td>내용</td>
				<td><textarea class="form-control" placeholder="글 내용" name="bd_content" 
				value="${vo.bd_content}" maxlength="2048" style="height: 350px;"></textarea></td>
			</tr>
			<tr>
				<td>파일첨부</td>
				<td><input type="file" name=file multiple="multiple" value="${ao.filepath}" ></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="수정 완료">
				
				<input type="button" value="글목록" onclick="window.location='<%=request.getContextPath()%>/boardlist.do';">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>