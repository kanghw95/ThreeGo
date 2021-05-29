<%@page import="threego.model.vo.User"%>
<%@page import="threego.model.service.ParkingService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<style type="text/css">

#nonmypage1{

   clear: both;
   width: 400;
   height: 100;
   padding-top: 20;
}


#nonmypage2{
   width: 400;

}
#mypage1{
   clear: both;
   width: 400;
   padding-top: 20;
   text-align: center;
}

#mypage2{
   width: 400;
}


#mypagefrm {
text-align: center;
   margin-top: 10;
}
#nonmypage1 #btnok{
   margin: 0;
   padding: 1 4 1 4;
   border: none;
   border-radius: 12px;
   background: #E0DEC3;
   color: black;
   position: relative;
   height: 30px;
   font-size: 13px;
   cursor: pointer;
   outline: none;
}
#mypagetable  {
margin: 0 auto;
width: 400;
margin: 10 0 10 0;
}
 

#nonmypage1 #passwd{
width: 340;
border-box;
height: 30;
  margin: 0;
  padding: 1 4 1 4;
  border: 0;
  border-radius: 12px;
  background :#EFEFEF;
  color: black;
  position:relative;
  height:30px;
  font-size:13px;
  outline:none;
}

#nonmypage2 input[type=submit],input[type=button]{
	margin: 0;
   padding: 1 4 1 4;
   border: 3px solid #E0DEC3;
   border-radius: 12px;
   background: white;
   color: black;
   position: relative;
   height: 30px;
   font-size: 13px;
   cursor: pointer;
   outline: none;
}

#mypage2 input[type=submit],input[type=button]{
	margin: 0;
   padding: 1 4 1 4;
   border: 3px solid #E0DEC3;
   border-radius: 12px;
   background: white;
   color: black;
   position: relative;
   height: 30px;
   font-size: 13px;
   cursor: pointer;
   outline: none;
}

#myinfo2{
  text-align : center;
   padding: 0 4 0 4;
   background: white;
   color: black;
   height: 30px;
   font-size: 13px;
   cursor: pointer;
   outline: none;
   border-left :1px solid black;
   border-color: #66612D;
}

#nonmypage1 placeholder {
   font-size: 15px;
}
    
</style>

</head>
<body style="font-family:'서울남산 장체 L', sans-serif;">

<%User user = (User) session.getAttribute("user"); %>

<%
		Object result1 = request.getAttribute("result");
		if (result1 == null) {
%>
	<div id="nonmypage1" style="margin: 0 auto;">
	<h3 style="text-align: left; color: #66612D; font-size: 20px; font-weight: bold; margin-left: 2px;">마이 페이지</h3><br>
		<form id="frm">
		<input type="hidden" id="id" name="id" value="<%=user.getUser_id()%>">
			<table>
				<tr>
					<td><input type="password" id="passwd" name="passwd" placeholder="비밀번호를 입력하세요">
					<input style="width: 40px;" id=btnok type="button" value="확인" >
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div id="nonmypage2" style="margin: 0 auto; text-align: center;" >
	<form action="<%=request.getContextPath() %>/user/userboard" method="post">
		<input type="hidden" id="user_no" name="user_no" value="<%=user.getUser_no()%>">
		<input class="nomypagefrmbtn1" type="submit" value="내가 쓴 글 보기">
		<input class="nomypagefrmbtn2" type="button" value="내가 쓴 댓글 보기" onclick="location.href ='<%=request.getContextPath() %>/main/mycomment'">
		<input class="nomypagefrmbtn3" type="button" value="내가 쓴 리뷰 보기" onclick="location.href ='<%=request.getContextPath() %>/main'">
	</form>
	</div>
	
<%
		} else {
%>
		<div id="mypage1" style="margin: 0 auto;">
		<h3 style="text-align: left; color: #66612D; font-size: 20px; font-weight: bold;">마이 페이지</h3><br>
			<table id="mypagetable" style="border-collapse: collapse;">
				<tr>
				<td><strong>회원 아이디</strong></td>
				<td id="myinfo2" ><%=user.getUser_id()%></td>
				</tr>
				
				<tr>
				<td><strong>회원 패스워드 </strong></td>
				<td id="myinfo2"><%=user.getUser_pwd()%></td>
				</tr>
				
				<tr>
				<td><strong>회원 이름</strong></td>
				<td id="myinfo2"><%=user.getUser_name()%></td>
				</tr>
				
				<tr>
				<td><strong>닉네임</strong></td>
				<td id="myinfo2"><%=user.getNickname()%></td>
				</tr>
				
				<tr>
				<td><strong>주소 </strong></td>
				<td id="myinfo2"><%=user.getAddress()%></td>
				</tr>
				
				<tr>
				<td><strong>마지막 로그인 시간</strong></td>
				<td id="myinfo2"><%=user.getLast_login()%></td>
				</tr>
				
				<tr>
				<td><strong>전화번호</strong></td>
				<td id="myinfo2"><%=user.getPhone()%></td>
				</tr>
				
				<tr>
				<td><strong>이메일</strong></td>
				<td id="myinfo2"><%=user.getEmail()%></td>
				</tr>
				
				<tr>
				<td><strong>성별</strong></td>
				<td id="myinfo2"><%=user.getGender()%></td>
				</tr>
				
				<tr>
				<td><strong>생년월일</strong></td>
				<td id="myinfo2"><%=user.getBirth()%></td>
				</tr>
				
			</table>
		<input type="button" value="수정" style="  margin: 0;
	width: 60px;
   padding: 1 4 1 4;
   border: none;
   border-radius: 12px;
   background: #E0DEC3;
   color: black;
   position: relative;
   height: 30px;
   font-size: 13px;
   cursor: pointer;
   outline: none;" 
   onclick="location.href ='<%=request.getContextPath() %>/main/modify'">
		<input type="button" value="회원탈퇴"
		style="  margin: 0;
   padding: 1 4 1 4;
   border: none;
   border-radius: 12px;
   background: #E0DEC3;
   color: black;
   position: relative;
   height: 30px;
   font-size: 13px;
   cursor: pointer;
   outline: none;" 
		onclick="location.href ='<%=request.getContextPath() %>/main/drawal'">
		</div>
		<br>
		<div id="mypage2" style="margin: 0 auto; text-align: center;">
		<form action="<%=request.getContextPath() %>/user/userboard" method="post">
				<input type="hidden" id="user_no" name="user_no" value="<%=user.getUser_no()%>">
				<input type="submit" value="내가 쓴 글 보기">
				<input type="button" value="내가 쓴 댓글 보기" onclick="location.href ='<%=request.getContextPath() %>/main/mycomment'">
				<input type="button" value="내가 쓴 리뷰 보기" onclick="location.href ='<%=request.getContextPath() %>/main'">
		</form>
	</div>
<%
		}
%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$("#btnok").click(function() {
		var frm = document.getElementById("frm");
		if ($("#passwd").val().length == 0) {
			alert("비밀번호를 입력해주세요")
			return;
		}
		frm.action = "<%=request.getContextPath() %>/usermypage";
		frm.method = "post";
		frm.submit();
	});
	
	$(function(){
		$('#passwd').keydown(function(key){
			if(key.keyCode == 13){
				$('#passwd').focus();
				var frm = document.getElementById("frm");
				if ($("#passwd").val().length == 0) {
					alert("비밀번호를 입력해주세요")
					return;
				}

				frm.action = "<%=request.getContextPath() %>/usermypage";
				frm.method = "post";
				frm.submit();
			}
		});
	});
</script>
</body>
</html>