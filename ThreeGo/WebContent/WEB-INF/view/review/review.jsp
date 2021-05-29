<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저조회</title>
<style>

#simple{
  clear: both;
   width: 420;
   padding-top: 20;
  	text-align: center;
   
}
#simple table {
	width: 400px;
	table-layout: fixed;
	margin-left: auto;
	margin-right: auto;
	border-collapse: collapse;
}

#simple td {
	white-space: nowrap;
	text-align: center;
	text-overflow: ellipsis;
	overflow: hidden;
	height: 32px;
}

#simple tr {
	border-bottom: 1px solid #66612D;
	height: 25px;
}

#simple input[type=button]{
   padding: 1 4 1 4;
   margin : 0 5 0 5;
   background-color: white;
   border :  none;
   height: 30;
}
</style>
</head>
<body style="font-family:'서울남산 장체 L', sans-serif;">
<div id="simple" style="margin: 0 auto;">
		<h3 style="text-align: left; color: #66612D; font-size: 20px; font-weight: bold; margin-left: 10px;">간단리뷰</h3><br>
		<c:if test="${ empty list }">
			<p>글을 작성한 회원이 없습니다.</p>
		</c:if>
		<c:if test="${not empty list }">
			<table>
				<tr>
					<td><strong>작성자</strong></td>
					<td><strong>점수</strong></td>
					<td><strong>내용</strong></td>
	
				</tr>
				<c:forEach items="${list}" var="i">
					<tr>
						<td>${i.nickname }</td>
						<td>${i.grade }</td>
						<td>${i.s_contents }</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
</body>
</html>