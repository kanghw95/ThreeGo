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
<script>
	function qnacheck(no,sub,con,answer){
		console.log(no,sub,con,answer);
		var sql = "no="+no+"&sub="+sub+"&con="+con+"&answer="+answer;
		$.ajax({
			type : "post"
			,url : "<%=request.getContextPath() %>"
			,data : sql
			
		});
	};

</script>
    <style>
        .btnc{
            background-color: white;
            border : 0;
            outline: 0;
            cursor: pointer;
        }
            .btnc:hover{
            color: purple;
        }
    </style>
<body>


<input type="hidden" name ="list" value="${list }">
<h1>문의사항</h1>
<hr>
	<form action="<%=request.getContextPath() %>/userqna" method="get">
		<input type="search" name="search" value="${search}">
		<button type="submit">검색</button>
	</form>
<h2>자주묻는질문</h2>
	<c:if test="${ empty list }">
		<p>게시글이 없습니다.</p>
	</c:if>
	<c:if test="${not empty list }">
	
		<table border ="1">
			<tr>
				<th>No</th>
				<th>제목</th>

			</tr>
		 	<c:forEach items="${list3 }" var="i" >
				<tr>
					<td>${i.faq_no }</td>
					<form method="post" action="<%=request.getContextPath()%>/adminqnaanswer">
					<td>
						<input type="submit" class="btnc" value="${i.faq_subject }">
						<input type="hidden" value="${i.faq_no }" name="no">
						<input type="hidden" value="${i.faq_subject }" name="sub">
						<input type="hidden" value="${i.faq_content }" name="con">
						<input type="hidden" value="${i.admin_number }" name="a_num">
					</td>
					</form>
				</tr>
			</c:forEach>
		</table>
		<form method="post" action="<%=request.getContextPath()%>/adminqnaanswer">
			<input type="submit" value="글쓰기">
			<input type="hidden" value="5" name="a_num">			
		</form>
</c:if>

<h2>QNA</h2>
	<c:if test="${ empty list }">
		<p>게시글이 없습니다.</p>
	</c:if>
	<c:if test="${not empty list }">
	
		<table border ="1">
			<tr>
				<th>No</th>
				<th>닉네임</th>
				<th>제목</th>
				<th>답변하기</th>

			</tr>
		 	<c:forEach items="${list }" var="i" >
			<tr>
				<td>${i.qna_no }</td>
				<c:forEach items="${list2 }" var="j">
				<c:if test="${i.qna_no == j.qna_no }">
					<td>${j.nickname }</td>
				</c:if>
				</c:forEach>
				<form method="post" action="<%=request.getContextPath()%>/adminqnaanswer">
					<td>
						<input type="submit" class="btnc" value="${i.qna_subject }">
						<input type="hidden" value="${i.qna_no }" name="no">
						<input type="hidden" value="${i.qna_subject }" name="sub">
						<input type="hidden" value="${i.qna_content }" name="con">
						<input type="hidden" value="${i.a_content }" name="a_con">
						<c:forEach items="${list2 }" var="j">
							<c:if test="${i.qna_no == j.qna_no }">
								<input type="hidden" value="${j.nickname }" name="nickname">
							</c:if>
						</c:forEach>
					</td>
				</form>
				<c:forEach items="${list2 }" var="j">
					<c:if test="${i.qna_no == j.qna_no && j.a_content !=null}">
						<td>답변완료<td>
					</c:if>
					
					<c:if test="${i.qna_no == j.qna_no && j.a_content ==null}">
						<form method="post" action="<%=request.getContextPath()%>/adminqnaanswer">
							<td><input type="submit" value="답변하기" >
								<input type="hidden" value="${i.qna_no }" name="no">
								<input type="hidden" value="${i.qna_subject }" name="sub">
								<input type="hidden" value="${i.qna_content }" name="con">
								<c:forEach items="${list2 }" var="j">
									<c:if test="${i.qna_no == j.qna_no }">
										<input type="hidden" value="${j.nickname }" name="nickname">
									</c:if>
								</c:forEach>								
							</td>
						</form>
					</c:if>
				</c:forEach>
			</tr>
			</c:forEach>
		</table>
	</c:if>
	
	<c:if test="${startPage != 1 }">
		<a href="<%=request.getContextPath() %>/adminctrl?pageNum=${startPage-1}&search=${search}">이전</a> 
	</c:if>
	<c:forEach begin="${startPage }" end="${endPage }" var="s" step="1">
		<a href="<%=request.getContextPath() %>/adminctrl?pageNum=${s }&search=${search}">${s }</a> 
	</c:forEach>
	<c:if test="${endPage < pageCnt }">
		<a href="<%=request.getContextPath() %>/adminctrl?pageNum=${endPage+1}&search=${search}">다음</a>
	</c:if>
	
	<br>
	<input type="button" value="메인화면" onclick="location.href='<%=request.getContextPath()%>/admin/adminmain';">
	<c:if test="${not empty search}">
		<input type="button" value="전체글목록" onclick="window.location='<%=request.getContextPath()%>/userqna';">
	</c:if>
	
</body>
</html>