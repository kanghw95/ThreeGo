<%@page import="threego.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%User users = (User) session.getAttribute("user"); %>
<%String adminch =  (String) session.getAttribute("adminch"); %>

<style>

#logfrm,#myinfo{
    text-align: center;
}
#myinfo p{
    margin-top: 10;
    margin-left: 50px;
    font-size: 20px;
    font-weight: bold;

}
#logfrmp{
    margin-top: 10;
    margin-left: 50px;
    font-size: 20px;
    font-weight: bold;

}
#logfrm{
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

#myinfo{
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
.password{
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
.text{
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

#logfrm{
   padding: 1 4 1 4;
   margin : 0 5 0 5;
   background-color: white;
   border :  none;
   height: 30;
}

#myinfo{
   padding: 1 4 1 4;
   margin : 0 5 0 5;
   background-color: white;
   border :  none;
   height: 30;
}
.btn11{
   padding: 1 4 1 4;
   margin : 0 5 0 5;
   background-color: white;
   border :  none;
   height: 30;
}

#logfrm table{
text-align :center;
margin-left:auto; 
margin-right:auto;

}
</style>
<%
		if (users == null && adminch==null) {
%>
	<div id="logfrm" style="margin: 0 auto; font-family :'서울남산 장체 L', sans-serif;">
	<form id="loginfrm" style="padding-top: 30px">
   		<table>
   		<tr>
   		<td>ID</td>
   		<td><input class="text" type="text" name="id" id="id"></td>
   		<td><input class="btn11" type="button" id="btnlogin" value="로그인 "></td>
   		</tr>
   		
   		   		
   		<tr>
   		<td>PW</td>
   		<td><input class="password" type="password" name="passwd" id="passwd"></td>
   		<td></td>
   		</tr>
   		
   		</table>
		<br>
		
		<input class="btn11" type="button" id="btnjoin" value="회원가입" onclick="location.href ='<%=request.getContextPath() %>/main/insert'">
		<input class="btn11" type="button" id="btnidfind" value="아이디 찾기" onclick="location.href ='<%=request.getContextPath() %>/main/idfind'">|
		<input class="btn11" type="button" id="btnpwfind" value="비밀번호 찾기" onclick="location.href ='<%=request.getContextPath() %>/main/pwfind'">
	</form>
	</div>
<%
		} else if(adminch!=null){
		%>	
		<div  style="padding-top: 30px; text-align: center;">
		<h2>관리자 계정입니다.</h2><br>
		<input class="btn11" type="button" id="btnLogout" value="로그아웃" onclick="location.href='<%=request.getContextPath()%>/userlogout'">
		</div>
		
		
		<% }else {
%>
	<div id="myinfo" style="margin: 0 auto; padding-top: 50px;">
		<%= session.getAttribute("msg") %>
		<input type="hidden" <%= session.getAttribute("username") %>><br><br>
		<input class="btn11" type="button" id="btnmypage" value="마이페이지" onclick="location.href='<%=request.getContextPath()%>/main/user/usermypage'">
		<input class="btn11" type="button" id="btnLogout" value="로그아웃" onclick="location.href='<%=request.getContextPath()%>/userlogout'">
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