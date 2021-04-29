<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글읽기</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	function writeContent(){
		var frm = document.getElementById("frm");
		frm.action="<%=request.getContextPath() %>/board/boardwrite.jsp";
		frm.method="post";
		frm.submit();
	}
	function updateContent(){
		var frm = document.getElementById("frm");
		frm.action="<%=request.getContextPath() %>/board/boardupdate.jsp";
		frm.method="post";
		frm.submit();
	}
	function deleteContent(){
		var frm = document.getElementById("frm");
		frm.action="<%=request.getContextPath() %>/board/boarddelete.jsp";
		frm.method="post";
		frm.submit();
	}
</script>
</head>
<body>
	<h1>글읽기</h1>
	<form id="frm">
		<input type="hidden" name="bno" value="${boardcontent.bno }">
		<input type="hidden" name="bref" value="${boardcontent.bref }">
		<input type="hidden" name="bre_step" value="${boardcontent.bre_step }">
		<input type="hidden" name="bre_level" value="${boardcontent.bre_level }">
		<table border="1">
			<tr>
				<td>작성자</td>
				<td>${boardcontent.bwriter }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${boardcontent.bsubject }</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${boardcontent.bcontent }</td>
			</tr>
			<tr>
				<td><%=request.getContextPath()%>/files/${boardcontent.bfilepath }</td>
				<td><a href="<%=request.getContextPath()%>/files/${boardcontent.bfilepath }" 
				download="${boardcontent.bfilepath }">
				${boardcontent.bfilepath }</a></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="button" value="답글쓰기" onclick="writeContent();">
				<input type="button" value="글수정" onclick="updateContent();">
				<input type="button" value="글삭제" onclick="deleteContent();">
				<input type="button" value="글목록" onclick="window.location='<%=request.getContextPath() %>/boardlist.do?pageNum=${param.pageNum }&search=${param.search}';"></td>
			</tr>
		</table>
	</form>
</body>
</html>