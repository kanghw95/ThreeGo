<link rel="stylesheet" href="<%=request.getContextPath() %>/css/search_park.css" type="text/css">
<%@page import="threego.model.vo.User"%>
<%@page import="threego.admin.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%User users = (User) session.getAttribute("user"); %>
<%
	Admin admin = (Admin) session.getAttribute("admin");
%>
   <div class="mainstop">
   <h1 class="title">얻다대GO</h1>
   </div>

<%
		if (users == null && admin==null) {
%>
	<div>
	<form id="loginfrm">
		<p>ID : <input type="text" name="id" id="id"></p>
		<p>PW : <input type="password" name="passwd" id="passwd"></p>
		<input type="button" id="btnjoin" value="회원가입" onclick="location.href ='<%=request.getContextPath() %>/main/insert'">
		<input type="button" id="btnlogin" value="로그인 ">
		<br><br>
		<input type="button" id="btnidfind" value="아이디 찾기" onclick="location.href ='<%=request.getContextPath() %>/main/idfind'">
		<input type="button" id="btnpwfind" value="비밀번호 찾기" onclick="location.href ='<%=request.getContextPath() %>/main/pwfind'">
	</form>
	</div>
<%
		} else if(admin!=null){
		%>	
		<div>
		<h2>관리자 계정입니다.</h2>
		<input type="button" id="btnLogout" value="로그아웃" onclick="location.href='<%=request.getContextPath()%>/userlogout'">
		</div>
		
		
		<% }else {
%>
	<div>
		<%= session.getAttribute("msg") %>
		<input type="hidden" <%= session.getAttribute("username") %>>
		<p>마지막 접속 시간 : <span><%=users.getLast_login()%></span></p><br>
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
	
	$(function(){
		$('#passwd').keydown(function(key){
			if(key.keyCode == 13){
				$('#passwd').focus();
				var frm = document.getElementById("loginfrm");
				if ($("#id").val().length == 0) {
					alert("입력된 아이디가 없습니다.")
					return;
				}

				frm.action = "<%=request.getContextPath() %>/userlogin";
				frm.method = "post";
				frm.submit();
			}
		});
	});
</script>