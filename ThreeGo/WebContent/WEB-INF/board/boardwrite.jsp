<%@page import="threego.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style type="text/css">
#subjectDiv {
	clear: both;
	margin-bottom: 10px;
	width: 400;
	box-sizing: border-box;
	height: 40;
	outline: none;
	border-top: 1px solid #66612D;
	border-bottom: 1px solid #66612D;
}

#fileDiv {
	margin-bottom: 5;
	overflow: hidden;

}

textarea {
	border-color: white;
	maxlength: "2048";
	resize: none;
	outline: none;
	width: 380px;
	height: 320;
	margin-top: 30;
	margin-left: 15;
	margin-right: 0;
	maxlength: "2048";
	font-size: 17px;
	padding: 0;
}

#contentDiv {
	border-top: 1px solid #66612D;
	border-bottom: 1px solid #66612D;
	margin-top: 0;
}

input {

	
	padding: 10;
	outline: none;

}

#filecancel {
	float: right;
	padding: 1 3 1 3;
	margin: 1;
}

#fileupload {
	float: left;
	outline: none;
	margin: 1;
}

p {
	margin-top: 10;
	float: left;
	font-size: 20px;
	font-weight: bold;
}

span {
	margin-top: 20;
	margin-bottom: 10;
	float: left;
	clear: both;
	font-size: 20px;
	font-weight: bold;
	color: #66612D;
}

#writebtn {
	float: right;
	margin-top: 15;
	margin-bottom: 5;

	background-color: white;
	background: #E0DEC3;
	border-radius: 12px;
	cursor: pointer;
	padding: 5 10 5 10;
}

#listbtn {
	float: right;
	margin-top: 5;
	padding: 1 4 1 4;
	background-color: white;
	border: 3px solid #E0DEC3;
	border-radius: 12px;
	cursor: pointer;
}

img {
	border: none;
	width: 30;
	height: 30;
	margin: 5;
}

button {
	background-color: white;
	border: 0;
}

placeholder {
	font-size: 15px;
}
</style>



<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(function() {
		$("#filecancel").click(function() {

			$("#fileupload").val("");
		})
	})
</script>


</head>
<body>


	<%
		User user = (User) session.getAttribute("user");
	String nickname = user.getNickname();
	int userno = user.getUser_no();
	%>
	<%
		if (user.getUser_authority() == 0) {
	%>
	아이디가 정지 당했습니다.문의부탁드립니다.
	<a href="<%=request.getContextPath()%>/main">메인화면으로</a>

	<%
		} else {
	%>
	<div style="margin: 0 50 0 50">

		<c:if test="${bd_category eq 'bd_category_1'}">
			<span>주차장 평가게시판</span>
		</c:if>
		<c:if test="${bd_category eq 'bd_category_2'}">
			<span>주차장 쉐어링게시판</span>
		</c:if>
		<c:if test="${bd_category eq 'bd_category_3'}">
			<span>드라이브코스 추천게시판</span>
		</c:if>
		<c:if test="${bd_category eq 'bd_category_4'}">
			<span>자유게시판</span>
		</c:if>
		<c:if test="${bd_category eq 'bd_category_5'}">
			<span>자랑게시판</span>
		</c:if>

		<form action="<%=request.getContextPath()%>/boardWrite" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="bd_category_1" value="${bd_category}">
			<input type="hidden" name="userno" value=<%=userno%>> <input
				type="hidden" name="bd_writer" value=<%=nickname%>>
			<!--  <input id=writebtn type="submit" value="등록"> -->
			<button id=writebtn type="submit">등록</button>



			<div id="subjectDiv">
				<input type="text" style="border: none; width: 390" placeholder="제목을 입력해 주세요"
					name="bd_subject">
			</div>


			<div id="fileDiv">

				<input type="file" id="fileupload" name="uploads" multiple
					accept="image/*" onchange="filename(this);">
				<button type="button" id="filecancel">
					<img src="<%=request.getContextPath()%>/img/x-mark (5).png">
				</button>
			</div>


			<div id="contentDiv" border=1px>
				<textarea placeholder="내용을 입력해 주세요" name="bd_content"></textarea>
			</div>


			<button type="button" id="listbtn"
			<%-- 	onclick="window.location='<%=request.getContextPath()%>/board/boardlist';">목록으로</button> --%>
				onclick="history.back()">목록으로</button>

		</form>


	</div>

	<%
		}
	%>
</body>
</html>

<write.jsp>