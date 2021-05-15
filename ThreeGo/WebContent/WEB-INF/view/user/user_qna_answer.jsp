<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="threego.model.vo.User"%>
<%
	User user = (User) session.getAttribute("user");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
<!-- FAQ 답 -->
<c:if test="${empty qna_kind }">

<h2>자주묻는질문</h2>

	<table border="1">
		<tr>
			<td>번호</td>
			<td>${qna_no }</td>
		</tr>

		<tr>
			<td >제목</td>
			<td><input type="text" value="${qna_subject }" name="sub" readonly></td>
		</tr>

		<tr>
			<td>내용</td>
			<td>
				<textarea name="con" maxlength="2048" readonly
					style="height: 200px; width:200px; color:black;" >${qna_content }
				</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="확인" onclick="history.back();">
				<input type="button" value="메인페이지" readonly
				onclick="window.location='<%=request.getContextPath()%>/main';">
			</td>
		</tr>
	</table>

</c:if>


<!-- QNA -->
<c:if test="${not empty qna_kind }">
<!-- 내가 등록한 QNA -->
<h1>이용자문의사항</h1>
<c:if test="${nickname == user.getNickname() }">
<form action="<%=request.getContextPath()%>/userqnaupdate" method="POST">
<input type="hidden" value="${qna_no }" name="no">
		<table border="1">
			<tr>
			
				<td>번호</td>
				<td>${qna_no }</td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td>${nickname }</td>
			</tr>
			<c:if test="${empty a_content }">
			<tr>
				<td>제목</td>
				<td><input type="text" name="sub" value="${qna_subject }"></td>
			</tr>
			</c:if>
			<c:if test="${not empty a_content }">
			<tr>
				<td>제목</td>
				<td><input type="text" value="${qna_subject }" readonly></td>
			</tr>
			</c:if>
			<c:if test="${empty a_content }">
			<tr>
				<td>문의항목</td>
				<td>
				<select id="select" name="select">
					<option value="${qna_kind }">${qna_kind }</option>
					<option value="계정">계정</option>
					<option value="채팅">채팅</option>
					<option value="게시판">게시판</option>
					<option value="쉐어링">쉐어링</option>
					<option value="기타">기타</option>
				</select>
				</td>
			</tr>
			</c:if>
			<c:if test="${not empty a_content }">
			<tr>
				<td>문의항목</td>
				<td>${qna_kind }</td>
			</tr>
			</c:if>	
			<c:if test="${empty a_content }">
			<tr>
				<td>내용</td>
				<td>
					<textarea name="con" maxlength="2048" 
					style="height: 200px; width:200px; color:black;" >${qna_content }
					</textarea>
				</td>
			</tr>
			</c:if>
			<c:if test="${not empty a_content }">
			<tr>
				<td>내용</td>
				<td>
					<textarea name="con" maxlength="2048" 
					style="height: 200px; width:200px; color:black;" readonly>${qna_content }
					</textarea>
				</td>
			</tr>
			</c:if>
			<tr>
				<td colspan="2">
				<c:if test="${empty a_content }">
					<input type="submit" value="질문 수정">
				</c:if>
				<c:if test="${not empty a_content }">
					<input type="button" value="확인"
						onclick="history.back();">
				</c:if>
			</tr>
		</table>
</form>
</c:if>
<c:if test="${nickname != user.getNickname() }">
		<table border="1">
			<tr>
				<td>번호</td>
				<td>${qna_no }</td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td>${nickname }</td>
			</tr>

			<tr>
				<td>제목</td>
				<td><input type="text" value="${qna_subject }" readonly></td>
			</tr>
			<tr>
				<td>문의항목</td>
				<td>${qna_kind }</td>
			</tr>

			<tr>
				<td>내용</td>
				<td>
					<textarea name="con" maxlength="2048" 
					style="height: 200px; width:200px; color:black;" readonly>${qna_content }
					</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="확인"
						onclick="history.back();">
				</td>
			</tr>
		</table>
</c:if>
	<h1>답변내용</h1>

		
		<input type="hidden" name="qnano" value="${qna_no }">
		<table border="1">
			<tr>
				<td>내용</td>
				<c:if test="${empty a_content }">
					<td><textarea name="answer" placeholder="아직답변이 없습니다." readonly
						 maxlength="2048" style="height: 200px; width:200px;"></textarea>
					</td>
				</c:if>
				<c:if test="${not empty a_content }">
					<td><textarea name="answer" readonly
						 maxlength="2048" style="height: 200px; width:200px; color:black;">${a_content }</textarea>
					</td>
				</c:if>
			</tr>
		</table>
		<input type="button" value="메인페이지"
			onclick="window.location='<%=request.getContextPath()%>/main';">

		

</c:if>
</body>
</html>