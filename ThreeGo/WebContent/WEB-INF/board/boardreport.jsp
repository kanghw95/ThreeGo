<%@page import="threego.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#reportfrm{
  clear: both;
   width: 420;
   padding-top: 20;
   margin: 0 auto;
}
.button{

  margin: 0;
  padding: 1 4 1 4;
  border: 3px solid #CFCFCF;
  border-radius: 12px;
	background :white;
	color: black;
  position:relative;
  height:30px;
  font-size:13px;
  cursor:pointer;
  outline:none;
}
#go{
font-size : 12px;
 border: 0px;
 background : #E0DEC3;
 text-align : center;
}
#gogo{
 text-align : center;
}
#report{
border: 0px;
}
#report_nick, #report_content{
border: 0px;
resize: none;
}
</style>
</head>
<body style="font-family:'서울남산 장체 L', sans-serif;">
<div id="reportfrm">
	<h1 style="text-align: left; color: #66612D; font-size: 20px; font-weight: bold; margin-left: 2px;">신고하기</h1>
	<%	User user = (User) session.getAttribute("user"); %>
	<form action="<%=request.getContextPath()%>/boardreportsend" method="post">
		
			<input type="hidden" name="user_no" value="${boardread.user_no}">
			<input type="hidden" name="user_no2" value="<%=user.getUser_no()%>">
			<input type="hidden" name="bd_content_no" value="${boardread.bd_content_no}">
		<table id="report">
				<tr>
					<td>피신고자&nbsp;  </td>
					<td class="button"><input type="text" id="report_nick" name="report_nick" readonly="readonly" size="38" value="${boardread.bd_writer}"></td>
				</tr>
				<tr>
					<td>신고이유&nbsp; </td>
					<td class="button"><textarea id="report_content" name="report_content" rows="10" cols="40" placeholder="신고사유를 작성해주세요"></textarea></td>
				</tr>
		</table>
		<br>
				<tr>
				<td ><div id="gogo"><input type="submit" id="go" class="button" value="신고하기"></div></td>
				</tr>
	</form>
</div>
</body>
</html>