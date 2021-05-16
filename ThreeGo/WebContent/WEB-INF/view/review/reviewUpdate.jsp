<%@page import="threego.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>간단 리뷰 수정 페이지</h1>
<%	User user = (User) session.getAttribute("user"); %>
<form action="<%=request.getContextPath()%>/reviewwrite" method="post">
	
		<input type="hidden" name="user_no" value="<%=user.getUser_no()%>">
		<input type="hidden" name=parking_code value="<%=request.getParameter("parking_code")%>">
	<table>
			<tr>
				<td>작성자 닉네임 : </td> 
				<td><input type="text" id="wirte_nick" name="wirte_nick" readonly="readonly" size="38" value="<%=user.getNickname()%>"></td>
			</tr>
			<tr>
				<td>주차장 이름 : </td> 
				<td><input type="text" name=parking_name readonly="readonly" value="<%=request.getParameter("parking_name")%>"></td>
			</tr>
			<tr>
				<td colspan="2">
			 평점 : <select name="grade">
			       <option value="1">1점</option>
			       <option value="2">2점</option>
			       <option value="3">3점</option>
			       <option value="4">4점</option>
			       <option value="5">5점</option>
	    		 </select></td>
			</tr>
			<tr>
				<td>리뷰 작성 :</td> 
				<td><textarea id="review_content" name="review_content" rows="10" cols="40" placeholder="여기에 리뷰를 작성해주세요"></textarea></td>
			</tr>
			<tr>
			<td><input type="submit" value="리뷰 작성"></td>
			</tr>
	</table>
</form>
</body>
</html>