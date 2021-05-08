<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>

<!-- 자주묻는 질문 -->
<c:if test="${not empty admin_number }">
	
	<c:if test="${not empty qna_content }">
	<h2>자주묻는질문</h2>
	<form method="post" action="<%=request.getContextPath()%>/adminfaqdelete">
		<input type="submit" value="삭제하기">
		<input type="hidden" name="no" value="${qna_no }">
	</form>
	<form method="post" action="<%=request.getContextPath()%>/adminfaqupdate">
	<input type="hidden" value="${qna_no }" name="no">
	<table border="1">
		<tr>
			<td>번호</td>
			<td>${qna_no }</td>
		</tr>

		<tr>
			<td>제목</td>
			<td><input type="text" value="${qna_subject }" name="sub"></td>
		</tr>

		<tr>
			<td>내용</td>
			<td>
				<textarea name="con" maxlength="2048" 
					style="height: 200px; width:200px; color:black;" >${qna_content }
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
	</c:if>
	
<!-- 자주묻는 질문 글쓰기-->
	<c:if test="${empty qna_content }">
	<c:if test="${empty notify }">
	<h2>자주묻는질문</h2>
	<h3>글쓰기</h3>
	<form method="post" action="<%=request.getContextPath()%>/adminfaqinsert">
		<table border="1">
		<input type="hidden" value="1" name="faq_notify">
			<tr>
				<td>제목</td>
				<td><input type="text" placeholder="자주묻는 질문의 제목" name="faq_subject"></td>
			<tr>
				<td>내용</td>
				<td><textarea name="faq_content" placeholder="자주묻는 질문의 답"
					maxlength="2048" style="height: 200px; width:200px;"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록하기">
					<input type="button" value="메인페이지"
					onclick="window.location='<%=request.getContextPath()%>/admin/adminmain';">
				</td>
			</tr>
		</table>
	</form>
	</c:if>
<!-- 공지사항 글쓰기-->
	<c:if test="${not empty notify }">
	<h2>공지사항/이용방법</h2>
	<h3>글쓰기</h3>
	<form method="post" action="<%=request.getContextPath()%>/adminfaqinsert">
	<input type="hidden" value="1001" name="faq_notify">
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" placeholder="자주묻는 질문의 제목" name="faq_subject"></td>
			<tr>
				<td>내용</td>
				<td><textarea name="faq_content" placeholder="자주묻는 질문의 답"
					maxlength="2048" style="height: 200px; width:200px;"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록하기">
					<input type="button" value="메인페이지"
					onclick="window.location='<%=request.getContextPath()%>/admin/adminmain';">
				</td>
			</tr>
		</table>
	</form>
	</c:if>		
	</c:if>

</c:if>


<!-- 이용자문의사항 -->
<c:if test="${not empty nickname}">
	<h1>이용자문의사항</h1>
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
				<td>${qna_subject }</td>
			</tr>

			<tr>
				<td>내용</td>
				<td>
					<textarea name="con" maxlength="2048" 
					style="height: 200px; width:200px; color:black;" readonly>${qna_content }
					</textarea>
				</td>
			</tr>

		</table>
		
		
	<h1>답변내용</h1>
		<form action="<%=request.getContextPath()%>/answerupdate" method="POST">

		<input type="hidden" name="qnano" value="${qna_no }">
		<table border="1">
			<tr>
				<td>내용</td>
				<c:if test="${empty a_content }">
					<td><textarea name="answer" placeholder="답글남기기"
						 maxlength="2048" style="height: 200px; width:200px;"></textarea>
					</td>
				</c:if>
				<c:if test="${not empty a_content }">
					<td><textarea name="answer"
						 maxlength="2048" style="height: 200px; width:200px; color:black;">${a_content }</textarea>
					</td>
				</c:if>
			</tr>
			
			<tr>
				<td colspan="2">
				<c:if test="${empty a_content }">
					<input type="submit" value="답변하기">
				</c:if>
				<c:if test="${not empty a_content }">
					<input type="submit" value="수정하기">
				</c:if>
				<input type="button" value="메인페이지"
					onclick="window.location='<%=request.getContextPath()%>/admin/adminmain';">
				</td>
			</tr>
		</table>

	</form>
</c:if>
</body>
</html>