<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>글작성</h1>

	<c:if test="${empty param.bd_content_no}"> 
	<form action="<%=request.getContextPath() %>/boardwrite.do" method="post"
		enctype="multipart/form-data"	>
	
		<!-- <input type="text" name="bd_content_no" value="${param.bd_content_no }">
		<input type="text" name="bd_ref" value="${param.bd_ref }">
		<input type="text" name="bd_re_step" value="${param.bd_re_step}">
		<input type="text" name="bd_re_level" value="${param.bd_re_level }">-->
	
	
		<table border="1">
			<tr>
				<td>작성자</td>
				<td><input type="text" name="bd_writer" id="bd_writer" value="${param.bd_writer}"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="bd_subject" id="bd_subject"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="BD_CONTENT" id="BD_CONTENT"></td>
			</tr>
		<!--	<tr>
				<td>파일선택</td>
				<td><input type="file" name="FILEPATH" id="FILEPATH"></td>
			</tr>
 			<tr>
				<td>파일선택-여러개</td>
				<td><input type="file" name="FILEPATHS" id="FILEPATHS" multiple="multiple"></td>
			</tr> -->
				<tr>
					<td><input type="submit" value="글등록 "></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="메인화면" onclick="window.location='<%=request.getContextPath()%>/boardlist.do';">
					<input type="button" value="마이페이지" onclick="window.location='<%=request.getContextPath()%>/boardlist.do';">
				</td>
			</tr>
		</table>
	</form>
</c:if>

  
<c:if test="${not empty param.bd_content_no}">
<h1>글수정</h1>
	<form action="<%=request.getContextPath() %>/boardupdate.do" method="post" enctype="multipart/form-data">
	<!--  	<input type="text" name="bd_content_no" value="${param.bd_content_no }">
		<input type="text" name="bd_ref" value="${param.bd_ref }">
		<input type="text" name="bd_re_step" value="${param.bd_re_step}">
		<input type="text" name="bd_re_level" value="${param.bd_re_level }">-->
	
		<table border="1">
			<tr>
				<td>작성자</td>
				<td><input type="text" name="bwriter" id="bwriter" value="${vo.bwriter }"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="bsubject" id="bsubject" value="${vo.bsubject }"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="bcontent" id="bcontent" value="${vo.bcontent }"></td>
			</tr>
		<!--  	<tr>
				<td>파일선택</td>
				<td><input type="file" name="bfilepath" id="bfilepath" value="${vo.bfilepath }"></td>
			</tr>-->
		<!--  	<tr>
				<td>파일선택 여러개</td>
				<td><input type="file" name="bfilepath" id="bfilepath" multiple="multiple"></td>
			</tr>  -->
			
			<tr>
					<td><input type="submit" value="글수정 완료 "></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="메인화면" onclick="window.location='<%=request.getContextPath()%>/boardlist.do';">
					<input type="button" value="마이페이지" onclick="window.location='<%=request.getContextPath()%>/boardlist.do';">
				</td>
			</tr>
		</table>
	</form>
</c:if>


</body>
</html>