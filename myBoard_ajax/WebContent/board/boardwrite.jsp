<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
		String msg = (String)request.getAttribute("msg");
		if(msg != null && !msg.equals("")) {
			--%>
<%-- 		<c:if test="${msg != null && msg != ''}">
			<script>
				console.log("sss");
				alert("${msg}");
			</script>
		</c:if>
		<c:if test="${msg eq '글 등록 완료' }">
			<script>
				location.href="<%=request.getContextPath()%>/boardlist.do";
			</script>
		</c:if>
		<c:if test="${msg eq '글 등록 실패' }">
			<script>
				history.back();
			</script>
		</c:if> --%>
			<%--
		}
	--%>
<!-- 
	private int bno;
	private String bsubject;
	private String bcontent;
	private Timestamp bdate;
	private int bcnt;
	private String bwriter;
	private String bwriter_snd;
	private String bfilepath;
	private String bpwd;
	private int bref;
	private int bre_step;
	private int bre_level;
 -->
	<h1>글쓰기</h1>
	<form action="<%=request.getContextPath() %>/boardWrite.do" method="post"
		enctype="multipart/form-data"	>
	
		<input type="text" name="bno" value="${param.bno }">
		<input type="text" name="bref" value="${param.bref }">
		<input type="text" name="bre_step" value="${param.bre_step }">
		<input type="text" name="bre_level" value="${param.bre_level }">
	
	
		<table border="1">
			<tr>
				<td>작성자</td>
				<td><input type="text" name="bwriter" id="bwriter"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="bsubject" id="bsubject"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="bcontent" id="bcontent"></td>
			</tr>
			<tr>
				<td>파일선택</td>
				<td><input type="file" name="bfilepath" id="bfilepath"></td>
			</tr>
<!-- 			<tr>
				<td>파일선택-여러개</td>
				<td><input type="file" name="bfilepaths" id="bfilepaths" multiple="multiple"></td>
			</tr> -->
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="bpwd" id="bpwd"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="글등록">
					<input type="reset" value="다시작성">
					<input type="button" value="글목록" onclick="window.location='<%=request.getContextPath()%>/boardlist.do';">
				</td>
			</tr>
		</table>

	</form>
</body>
</html>