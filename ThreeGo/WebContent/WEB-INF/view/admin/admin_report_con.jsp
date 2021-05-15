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



		<table border ="1">
			<tr>
				<th>No</th>
				<td>${bd_report_no }</td>
			</tr>
			<tr>
				<th>게시판번호</th>
				<td>${bd_content_no }</td>
			</tr>
			<tr>
				<th >신고당한 사람</th>
				<td onclick="location.href ='<%=request.getContextPath() %>/main/user/chat'" style="cursor: pointer">${reported }</td>
			</tr>
			<tr>
				<th>신고글</th>
				<td><textarea name="con" maxlength="2048" readonly
					style="height: 200px; width:200px; color:black;" >${bd_content }
					</textarea> </td>
			</tr>
		</table>
	<br><br><br>
		<table border ="1">
			<tr>
				<th >신고자</th>
				<td onclick="location.href ='<%=request.getContextPath() %>/main/user/chat'" style="cursor: pointer">${reporter }</td>
			</tr>
			<tr>
				<th>신고내용</th>
				<td><textarea name="con" maxlength="2048" readonly
					style="height: 200px; width:200px; color:black;" >${report_content }
					</textarea> </td>
			</tr>
		</table>	
		
	
	
	<br>
	
	<input type="button" value="메인화면" onclick="location.href='<%=request.getContextPath()%>/admin/adminmain';">

</body>
</html>