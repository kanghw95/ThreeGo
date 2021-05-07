<%@page import="threego.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	User user = (User) session.getAttribute("user");
		if (user == null) {
%>
	<div>
	<form id="loginfrm">
		<p>ID : <input type="text" name="id" id="id"></p>
		<p>PW : <input type="password" name="passwd" id="passwd"></p>
		<input type="button" id="btnjoin" value="회원가입" onclick="location.href ='<%=request.getContextPath() %>/main/insert'">
		<input type="button" id="btnlogin" value="로그인 ">
	</form>
	</div>
<%
		} else {
%>
	<div>
		<%= session.getAttribute("msg") %>
		<input type="hidden" <%= session.getAttribute("username") %>>
		<p>마지막 접속 시간 : <span><%=user.getLast_login()%></span></p><br>
		<input type="button" id="btnmypage" value="마이페이지" onclick="location.href='<%=request.getContextPath()%>/main/user/usermypage'">
		<input type="button" id="btnLogout" value="로그아웃" onclick="location.href='<%=request.getContextPath()%>/userlogout'">
	</div>
<%
		}
%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$("#btnlogin").click(function() {
		var frm = document.getElementById("loginfrm");
		if ($("#id").val().length == 0) {
			alert("입력된 아이디가 없습니다.")
			return;
		}
		frm.action = "<%=request.getContextPath() %>/userlogin";
		frm.method = "post";
		frm.submit();
	});
</script>