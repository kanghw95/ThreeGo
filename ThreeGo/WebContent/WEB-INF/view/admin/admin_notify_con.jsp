<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>공지사항/이용방법</h1>
	<form method="post" action="<%=request.getContextPath()%>/adminfaqdelete">
		<input type="submit" value="삭제하기">
		<input type="hidden" name="no" value="${no }">
	</form>
<form action="<%=request.getContextPath()%>/adminfaqupdate" method="post">
	<input type="hidden" value="${no }" name="no">
		<table border="1">
			<tr>
				<td>번호</td>
				<td>${no-1000 }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" value="${sub }" name="sub"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="con" maxlength="2048" 
					style="height: 200px; width:200px; color:black;" >${con }
					</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정하기">
					<input type="button" value="메인페이지"
					onclick="window.location='<%=request.getContextPath()%>/admin/adminmain';">
				</td>
			</tr>
		</table>
</form>
</body>
</html>