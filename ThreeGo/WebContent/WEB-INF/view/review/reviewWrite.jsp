<%@page import="threego.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#write{
  clear: both;
   width: 420;
   padding-top: 20;
}

#write input[type=text]{
  margin: 0;
  padding: 1 4 1 4;
  border: 3px solid #CFCFCF;
  border-radius: 12px;
  background :white;
  color: black;
  position:relative;
  height:30px;
  font-size:13px;
  outline:none;
}
#write input[type=password]{
  margin: 0;
  padding: 1 4 1 4;
  border: 3px solid #CFCFCF;
  border-radius: 12px;
  background :white;
  color: black;
  position:relative;
  height:30px;
  font-size:13px;
  outline:none;
}

#write select{
  margin: 0;
  padding: 1 4 1 4;
  border: 3px solid #CFCFCF;
  border-radius: 12px;
  background :white;
  color: black;
  position:relative;
  height:30px;
  font-size:13px;
  outline:none;
}
#write input[type=submit],input[type=button]{
   padding: 1 4 1 4;
   margin : 0 5 0 5;
   background-color: white;
   border :  none;
   height: 30;
}
</style>
</head>
<body style="font-family:'서울남산 장체 L', sans-serif;">
<div id="write" style="margin: 0 auto;">
<h3 style="text-align: left; color: #66612D; font-size: 20px; font-weight: bold;">간단 리뷰 작성</h3><br>
<%
		User user = (User) session.getAttribute("user");
	if (user == null) {
	%>
	로그인 후 이용하시길 바랍니다.
	<a href="<%=request.getContextPath()%>/main"><br>메인화면으로</a>
	<%
		} else if(user.getUser_authority()==0){
		%>
	아이디가 정지 당했습니다.문의부탁드립니다.
	<a href="<%=request.getContextPath()%>/main">메인화면으로</a>	
			
		<% }
	
	else {
	%>
<form action="<%=request.getContextPath()%>/reviewwrite" method="post">
	
		<input type="hidden" name="user_no" value="<%=user.getUser_no()%>">
		<input type="hidden" name="parking_code" value="<%=request.getParameter("parking_code")%>">
	<table>
			<tr>
				<td>작성자 닉네임  </td> 
				<td><input type="text" id="wirte_nick" name="wirte_nick" readonly="readonly" size="38" value="<%=user.getNickname()%>"></td>
			</tr>
			<tr>
				<td>주차장 이름  </td> 
				<td><input type="text" name=parking_name readonly="readonly" value="<%=request.getParameter("parking_name")%>"></td>
			</tr>
			<tr>
			<td>평점 </td>
				<td>
			   <select name="grade">
			       <option value="1">1점</option>
			       <option value="2">2점</option>
			       <option value="3">3점</option>
			       <option value="4">4점</option>
			       <option value="5">5점</option>
	    		 </select>
	    		 </td>
			</tr>
			<tr>
				<td >리뷰  내용</td> 
				<td><textarea id="review_content" name="review_content" rows="10" cols="40" placeholder="여기에 리뷰를 작성해주세요" style="border: 3px solid #CFCFCF;  border-radius: 12px;"></textarea></td>
			</tr>
			<tr>
			<td colspan="2" style="text-align: center; height: 60px;"><input style="border-radius: 12px; background : #E0DEC3;" type="submit" value="리뷰 작성"></td>
			</tr>
	</table>
		<%
		}
	%>
</form>
</div>
</body>
</html>